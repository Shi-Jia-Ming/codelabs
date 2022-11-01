/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

function processFunc(coreContext, func) {
    let argNames = ((func || '').toString()
        .replace(/((\/\/.*$)|(\/\*[\s\S]*?\*\/))/mg, '')
        .match(/^(function)?\s*[^\(]*\(\s*([^\)]*)\)/m) || ['', '', ''])[2]
        .split(',') // split parameters
        .map(item => item.replace(/^\s*(_?)(.+?)\1\s*$/, name => name.split('=')[0].trim()))
        .filter(String);
    let funcLen = func.length;
    let processedFunc;
    coreContext.getDefaultService('config').setSupportAsync(true);
    switch (funcLen) {
        case 0: {
            processedFunc = func;
            break;
        }
        case 1: {
            if (argNames[0] === 'data') {
                processedFunc = function (paramItem) {
                    func(paramItem);
                };
            } else {
                processedFunc = function () {
                    return new Promise((resolve, reject) => {
                        function done() {
                            resolve();
                        }

                        let funcType = func(done);
                        if (funcType instanceof Promise) {
                            funcType.catch(err => {reject(err);});
                        }
                    });
                };
            }
            break;
        }
        default: {
            processedFunc = function (paramItem) {
                return new Promise((resolve, reject) => {
                    function done() {
                        resolve();
                    }

                    let funcType = func(done, paramItem);
                    if (funcType instanceof Promise) {
                        funcType.catch(err => {reject(err);});
                    }
                });
            };
            break;
        }
    }
    return processedFunc;
}

function secureRandomNumber() {
    return crypto.randomBytes(8).readUInt32LE() / 0xffffffff;
}

class SuiteService {
    constructor(attr) {
        this.id = attr.id;
        this.rootSuite = new SuiteService.Suite({});
        this.currentRunningSuite = this.rootSuite;
    }

    describe(desc, func) {
        if (this.coreContext.getDefaultService('config').filterSuite(desc)) {
            console.info('filter suite :' + desc);
            return;
        }
        const suite = new SuiteService.Suite({description: desc});
        if (typeof this.coreContext.getServices('dataDriver') !== 'undefined') {
            let suiteStress = this.coreContext.getServices('dataDriver').dataDriver.getSuiteStress(desc);
            for (let i = 1; i < suiteStress; i++) {
                this.currentRunningSuite.childSuites.push(suite);
            }
        }
        const currentSuiteCache = this.currentRunningSuite;
        this.currentRunningSuite.childSuites.push(suite);
        this.currentRunningSuite = suite;
        func.call();
        this.currentRunningSuite = currentSuiteCache;
    }

    beforeAll(func) {
        this.currentRunningSuite.beforeAll.push(processFunc(this.coreContext, func));
    }

    beforeEach(func) {
        this.currentRunningSuite.beforeEach.push(processFunc(this.coreContext, func));
    }

    afterAll(func) {
        this.currentRunningSuite.afterAll.push(processFunc(this.coreContext, func));
    }

    afterEach(func) {
        this.currentRunningSuite.afterEach.push(processFunc(this.coreContext, func));
    }

    getCurrentRunningSuite() {
        return this.currentRunningSuite;
    }

    setCurrentRunningSuite(suite) {
        this.currentRunningSuite = suite;
    }

    getSummary() {
        let total = 0;
        let error = 0;
        let failure = 0;
        let pass = 0;
        let rootSuite = this.coreContext.getDefaultService('suite').rootSuite;
        if (rootSuite && rootSuite.childSuites) {
            for (let i = 0; i < rootSuite.childSuites.length; i++) {
                let testsuite = rootSuite.childSuites[i];
                let specs = testsuite['specs'];
                for (let j = 0; j < specs.length; j++) {
                    total++;
                    let testcase = specs[j];
                    if (testcase.error) {
                        error++;
                    } else if (testcase.result.failExpects.length > 0) {
                        failure++;
                    } else if (testcase.result.pass === true) {
                        pass++;
                    }
                }
            }
        }
        return {total: total, failure: failure, error: error, pass: pass};
    }

    init(coreContext) {
        this.coreContext = coreContext;
    }

    execute() {
        if (this.coreContext.getDefaultService('config').filterValid.length !== 0) {
            this.coreContext.fireEvents('task', 'incorrectFormat');
            return;
        }
        this.coreContext.fireEvents('task', 'taskStart');
        if (this.coreContext.getDefaultService('config').isSupportAsync()) {
            let asyncExecute = async () => {
                await this.rootSuite.asyncRun(this.coreContext);
            };
            asyncExecute().then(() => {
                this.coreContext.fireEvents('task', 'taskDone');
            });
        } else {
            this.rootSuite.run(this.coreContext);
            this.coreContext.fireEvents('task', 'taskDone');
        }
    }

    apis() {
        const _this = this;
        return {
            describe: function (desc, func) {
                return _this.describe(desc, func);
            },
            beforeAll: function (func) {
                return _this.beforeAll(func);
            },
            beforeEach: function (func) {
                return _this.beforeEach(func);
            },
            afterAll: function (func) {
                return _this.afterAll(func);
            },
            afterEach: function (func) {
                return _this.afterEach(func);
            }
        };
    }
}

SuiteService.Suite = class {
    constructor(attrs) {
        this.description = attrs.description || '';
        this.childSuites = [];
        this.specs = [];
        this.beforeAll = [];
        this.afterAll = [];
        this.beforeEach = [];
        this.afterEach = [];
        this.duration = 0;
    }

    pushSpec(spec) {
        this.specs.push(spec);
    }

    removeSpec(desc) {
        this.specs = this.specs.filter((item, index) => {
            return item.description !== desc;
        });
    }

    getSpecsNum() {
        return this.specs.length;
    }

    run(coreContext) {
        const suiteService = coreContext.getDefaultService('suite');
        suiteService.setCurrentRunningSuite(this);
        if (this.description !== '') {
            coreContext.fireEvents('suite', 'suiteStart', this);
        }
        let startTime = new Date().getTime();
        this.runHookFunc('beforeAll');
        if (this.specs.length > 0) {
            const configService = coreContext.getDefaultService('config');
            if (configService.isRandom()) {
                this.specs.sort(function () {
                    return secureRandomNumber() > 0.5 ? -1 : 1;
                });
            }
            this.specs.forEach(spec => {
                this.runHookFunc('beforeEach');
                spec.run(coreContext);
                this.runHookFunc('afterEach');
            });
        }
        if (this.childSuites.length > 0) {
            this.childSuites.forEach(childSuite => {
                childSuite.run(coreContext);
                suiteService.setCurrentRunningSuite(childSuite);
            });
        }
        this.runHookFunc('afterAll');
        let endTime = new Date().getTime();
        this.duration = endTime - startTime;
        if (this.description !== '') {
            coreContext.fireEvents('suite', 'suiteDone');
        }
    }

    asyncRun(coreContext) {
        const suiteService = coreContext.getDefaultService('suite');
        suiteService.setCurrentRunningSuite(this);
        return new Promise(async resolve => {
            if (this.description !== '') {
                coreContext.fireEvents('suite', 'suiteStart', this);
            }
            let startTime = new Date().getTime();
            await this.runAsyncHookFunc('beforeAll');
            if (this.specs.length > 0) {
                const configService = coreContext.getDefaultService('config');
                if (configService.isRandom()) {
                    this.specs.sort(function () {
                        return secureRandomNumber() > 0.5 ? -1 : 1;
                    });
                }
                for (let i = 0; i < this.specs.length; i++) {
                    await this.runAsyncHookFunc('beforeEach');
                    await this.specs[i].asyncRun(coreContext);
                    await this.runAsyncHookFunc('afterEach');
                }
            }

            if (this.childSuites.length > 0) {
                for (let i = 0; i < this.childSuites.length; i++) {
                    suiteService.setCurrentRunningSuite(this.childSuites[i]);
                    await this.childSuites[i].asyncRun(coreContext);
                }
            }

            await this.runAsyncHookFunc('afterAll');
            let endTime = new Date().getTime();
            this.duration = endTime - startTime;
            if (this.description !== '') {
                coreContext.fireEvents('suite', 'suiteDone');
            }
            resolve();
        });
    }

    runHookFunc(hookName) {
        if (this[hookName] && this[hookName].length > 0) {
            this[hookName].forEach(func => {
                try {
                    func();
                } catch (e) {
                    console.error(e);
                }
            });
        }
    }

    runAsyncHookFunc(hookName) {
        if (this[hookName] && this[hookName].length > 0) {
            return new Promise(async resolve => {
                for (let i = 0; i < this[hookName].length; i++) {
                    try {
                        await this[hookName][i]();
                    } catch (e) {
                        console.error(e);
                    }
                }
                resolve();
            });
        }
    }
};

class SpecService {
    constructor(attr) {
        this.id = attr.id;
    }

    init(coreContext) {
        this.coreContext = coreContext;
    }

    setCurrentRunningSpec(spec) {
        this.currentRunningSpec = spec;
    }

    getCurrentRunningSpec() {
        return this.currentRunningSpec;
    }

    it(desc, filter, func) {
        const configService = this.coreContext.getDefaultService('config');
        const currentSuiteName = this.coreContext.getDefaultService('suite').getCurrentRunningSuite().description;
        if (configService.filterDesc(currentSuiteName, desc, filter, this.coreContext)) {
            console.info('filter it :' + desc);
        } else {
            let processedFunc = processFunc(this.coreContext, func);
            const spec = new SpecService.Spec({description: desc, fi: filter, fn: processedFunc});
            const suiteService = this.coreContext.getDefaultService('suite');
            if (typeof this.coreContext.getServices('dataDriver') !== 'undefined') {
                let specStress = this.coreContext.getServices('dataDriver').dataDriver.getSpecStress(desc);
                for (let i = 1; i < specStress; i++) {
                    suiteService.getCurrentRunningSuite().pushSpec(spec);
                }
            }
            suiteService.getCurrentRunningSuite().pushSpec(spec);
        }
    }

    apis() {
        const _this = this;
        return {
            it: function (desc, filter, func) {
                return _this.it(desc, filter, func);
            }
        };
    }
}

SpecService.Spec = class {
    constructor(attrs) {
        this.description = attrs.description || '';
        this.fi = attrs.fi;
        this.fn = attrs.fn || function () {
        };
        this.result = {
            failExpects: [],
            passExpects: []
        };
        this.error = undefined;
        this.duration = 0;
    }

    setResult() {
        if (this.result.failExpects.length > 0) {
            this.result.pass = false;
        } else {
            this.result.pass = true;
        }
        console.info('testcase ' + this.description + ' result:' + this.result.pass);
    }

    run(coreContext) {
        const specService = coreContext.getDefaultService('spec');
        specService.setCurrentRunningSpec(this);
        coreContext.fireEvents('spec', 'specStart', this);
        let startTime = new Date().getTime();
        try {
            let dataDriver = coreContext.getServices('dataDriver');
            if (typeof dataDriver === 'undefined') {
                this.fn();
            } else {
                let suiteParams = dataDriver.dataDriver.getSuiteParams();
                let specParams = dataDriver.dataDriver.getSpecParams();
                console.info('[suite params] ' + JSON.stringify(suiteParams));
                console.info('[spec params] ' + JSON.stringify(specParams));
                if (this.fn.length === 0) {
                    this.fn();
                } else if (specParams.length === 0) {
                    this.fn(suiteParams);
                } else {
                    specParams.forEach(paramItem => this.fn(Object.assign({}, paramItem, suiteParams)));
                }
            }
            this.setResult();
        } catch (e) {
            this.error = e;
        }
        let endTime = new Date().getTime();
        this.duration = endTime - startTime;
        coreContext.fireEvents('spec', 'specDone', this);
    }

    asyncRun(coreContext) {
        const specService = coreContext.getDefaultService('spec');
        specService.setCurrentRunningSpec(this);
        const config = coreContext.getDefaultService('config');
        const timeout = + (config.timeout === undefined ? 5000 : config.timeout);
        return new Promise(async resolve => {
            coreContext.fireEvents('spec', 'specStart', this);
            let startTime = new Date().getTime();

            function timeoutPromise() {
                return new Promise(function (resolve, reject) {
                    setTimeout(() => reject(new Error('execute timeout ' + timeout + 'ms')), timeout);
                });
            }

            try {
                let dataDriver = coreContext.getServices('dataDriver');
                if (typeof dataDriver === 'undefined') {
                    const p = Promise.race([this.fn(), timeoutPromise()]);
                    await p.then(() => {
                        this.setResult();
                    });
                } else {
                    let suiteParams = dataDriver.dataDriver.getSuiteParams();
                    let specParams = dataDriver.dataDriver.getSpecParams();
                    console.info('[suite params] ' + JSON.stringify(suiteParams));
                    console.info('[spec params] ' + JSON.stringify(specParams));
                    if (this.fn.length === 0) {
                        const p = Promise.race([this.fn(), timeoutPromise()]);
                        await p.then(() => {
                            this.setResult();
                        });
                    } else if (specParams.length === 0) {
                        const p = Promise.race([this.fn(suiteParams), timeoutPromise()]);
                        await p.then(() => {
                            this.setResult();
                        });
                    } else {
                        for (const paramItem of specParams) {
                            const p = Promise.race([this.fn(Object.assign({}, paramItem, suiteParams)), timeoutPromise()]);
                            await p.then(() => {
                                this.setResult();
                            });
                        }
                    }
                }
            } catch (e) {
                this.error = e;
            }
            let endTime = new Date().getTime();
            this.duration = endTime - startTime;
            coreContext.fireEvents('spec', 'specDone', this);
            resolve();
        });
    }

    filterCheck(coreContext) {
        const specService = coreContext.getDefaultService('spec');
        specService.setCurrentRunningSpec(this);
        return true;
    }

    addExpectationResult(expectResult) {
        if (expectResult.pass) {
            this.result.passExpects.push(expectResult);
        } else {
            this.result.failExpects.push(expectResult);
        }
    }
};

class ExpectService {
    constructor(attr) {
        this.id = attr.id;
        this.matchers = {};
    }

    expect(actualValue) {
        return this.wrapMatchers(actualValue);
    }

    init(coreContext) {
        this.coreContext = coreContext;
        this.addMatchers(this.basicMatchers());
    }

    addMatchers(matchers) {
        for (const matcherName in matchers) {
            if (Object.prototype.hasOwnProperty.call(matchers, matcherName)) {
                this.matchers[matcherName] = matchers[matcherName];
            }
        }
    }

    basicMatchers() {
        return {
            assertTrue: function (actualValue) {
                return {
                    pass: (actualValue) === true
                };
            },
            assertEqual: function (actualValue, args) {
                return {
                    pass: (actualValue) === args[0],
                    expectValue: args[0]
                };
            },
            assertThrow: function (actual, args) {
                const result = {
                    pass: false
                };
                if (typeof actual !== 'function') {
                    result.message = 'toThrow\'s Actual should be a Function';
                } else {
                    let hasThrow = false;
                    let throwError;
                    try {
                        actual();
                    } catch (e) {
                        hasThrow = true;
                        throwError = e;
                    }
                    if (!hasThrow) {
                        result.message = 'function did not throw an exception';
                    } else if (throwError && throwError.message === args[0]) {
                        result.pass = true;
                    } else {
                        result.message = `expect to throw ${args[0]} , actual throw ${throwError.message}`;
                    }
                }
                return result;
            }
        };
    }

    wrapMatchers(actualValue) {
        const _this = this;
        const wrappedMatchers = {};
        const specService = _this.coreContext.getDefaultService('spec');
        const currentRunningSpec = specService.getCurrentRunningSpec();
        for (const matcherName in this.matchers) {
            if (Object.prototype.hasOwnProperty.call(this.matchers, matcherName)) {
                wrappedMatchers[matcherName] = function () {
                    const result = _this.matchers[matcherName](actualValue, arguments);
                    result.actualValue = actualValue;
                    result.checkFunc = matcherName;
                    currentRunningSpec.addExpectationResult(result);
                };
            }
        }
        return wrappedMatchers;
    }

    apis() {
        const _this = this;
        return {
            expect: function (actualValue) {
                return _this.expect(actualValue);
            }
        };
    }
}

class ReportService {
    constructor(attr) {
        this.id = attr.id;
    }

    init(coreContext) {
        this.coreContext = coreContext;
        this.specService = this.coreContext.getDefaultService('spec');
        this.suiteService = this.coreContext.getDefaultService('suite');
        this.duration = 0;
    }

    taskStart() {
        this.sleep(50);
        this.taskStartTime = new Date().getTime();
        console.info('[start] start run suites');
    }

    suiteStart() {
        this.sleep(50);
        console.info('[suite start]' + this.suiteService.getCurrentRunningSuite().description);
    }

    specStart() {
        this.sleep(50);
        console.info('start running case \'' + this.specService.currentRunningSpec.description + '\'');
        this.index = this.index + 1;
    }

    specDone() {
        this.sleep(50);
        let msg = '';
        let spec = this.specService.currentRunningSpec;
        if (spec.error) {
            this.formatPrint('error', spec.description + ' ; consuming ' + spec.duration + 'ms');
            this.formatPrint('errorDetail', spec.error);
        } else if (spec.result) {
            if (spec.result.failExpects.length > 0) {
                this.formatPrint('fail', spec.description + ' ; consuming ' + spec.duration + 'ms');
                spec.result.failExpects.forEach(failExpect => {
                    msg = failExpect.message || ('expect ' + failExpect.actualValue + ' '
                        + failExpect.checkFunc + ' ' + (failExpect.expectValue || ''));
                    this.formatPrint('failDetail', msg);
                });
            } else {
                this.formatPrint('pass', spec.description + ' ; consuming ' + spec.duration + 'ms');
            }
        }
        this.formatPrint(this.specService.currentRunningSpec.error, msg);
    }

    suiteDone() {
        this.sleep(50);
        let suite = this.suiteService.currentRunningSuite;
        console.info('[suite end]' + ' consuming ' + suite.duration + 'ms');
    }

    taskDone() {
        this.sleep(50);
        let msg = '';
        this.taskDoneTime = new Date().getTime();
        this.duration = this.taskDoneTime - this.taskStartTime;
        let summary = this.suiteService.getSummary();
        msg = 'total cases:' + summary.total + ';failure ' + summary.failure + ',' + 'error ' + summary.error;
        msg += ',pass ' + summary.pass + '; consuming ' + this.duration + 'ms';
        console.info(msg);
        console.info('[end] run suites end');
    }

    incorrectFormat() {
        if (this.coreContext.getDefaultService('config').filterValid.length !== 0) {
            this.coreContext.getDefaultService('config').filterValid.forEach(function (item) {
                console.info('this param ' + item + ' is invalid');
            });
        }
    }

    formatPrint(type, msg) {
        switch (type) {
            case 'pass':
                console.info('[pass]' + msg);
                break;
            case 'fail':
                console.info('[fail]' + msg);
                break;
            case 'failDetail':
                console.info('[failDetail]' + msg);
                break;
            case 'error':
                console.info('[error]' + msg);
                break;
            case 'errorDetail':
                console.info('[errorDetail]' + msg);
                break;
        }
    }

    sleep(numberMillis) {
        var now = new Date();
        var exitTime = now.getTime() + numberMillis;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime) {
                return;
            }
        }
    }
}

export {
    SuiteService,
    SpecService,
    ExpectService,
    ReportService
};
