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

class OhReport {
    constructor(attr) {
        this.delegator = attr.delegator;
        this.id = 'report';
        this.index = 0;
        this.duration = 0;
    }

    init(coreContext) {
        this.coreContext = coreContext;
        this.suiteService = this.coreContext.getDefaultService('suite');
        this.specService = this.coreContext.getDefaultService('spec');
    }

    taskStart() {
        this.taskStartTime = new Date().getTime();
    }

    taskDone() {
        this.taskDoneTime = new Date().getTime();
        this.duration = this.taskDoneTime - this.taskStartTime;
        let summary = this.suiteService.getSummary();
        var message = '\n' + 'OHOS_REPORT_RESULT: stream=Tests run: ' + summary.total + ', Failure: ' + summary.failure;
        message += ', Error: ' + summary.error;
        message += ', Pass: ' + summary.pass;
        message += '\n' + 'OHOS_REPORT_CODE: ' + (summary.failure > 0 ? -1 : 0) + '\n';
        message += 'OHOS_REPORT_STATUS: consuming=' + this.duration + '\n';
        this.delegator.print(message).then(() => {
            console.info('report print success');
            this.delegator.finishTest('your test finished!!!', 0, () => { });
        });
    }

    incorrectFormat() {
        if (this.coreContext.getDefaultService('config').filterValid.length !== 0) {
            var value = this.coreContext.getDefaultService('config').filterValid;
            var message = 'this param ' + value.join(',') + ' is invalid' + '\n';
            this.delegator.finishTest(message, 0, () => { });
        }
    }

    suiteStart() {
        let suiteService = this.coreContext.getDefaultService('suite');
        var message = '\n' + 'OHOS_REPORT_SUM: ' + suiteService.getSummary().total;
        message += '\n' + 'OHOS_REPORT_STATUS: class=' + suiteService.getCurrentRunningSuite().description + '\n';
        this.delegator.print(message).then(() => {
            console.info(suiteService.getCurrentRunningSuite().description + ' print success');
        });
    }

    suiteDone() {
        var message = '\n' + 'OHOS_REPORT_STATUS: class=' + this.suiteService.getCurrentRunningSuite().description;
        message += '\n' + 'OHOS_REPORT_STATUS: consuming=' + this.suiteService.currentRunningSuite.duration + '\n';
        this.delegator.print(message).then(() => {
            console.info(suiteService.getCurrentRunningSuite().description + ' print success');
        });
    }

    specStart() {
        let suiteService = this.coreContext.getDefaultService('suite');
        var message = '\n' + 'OHOS_REPORT_STATUS: class=' + suiteService.getCurrentRunningSuite().description;
        message += '\n' + 'OHOS_REPORT_STATUS: current=' + (++this.index);
        message += '\n' + 'OHOS_REPORT_STATUS: id=JS';
        message += '\n' + 'OHOS_REPORT_STATUS: numtests=' + suiteService.getSummary().total;
        message += '\n' + 'OHOS_REPORT_STATUS: stream=';
        message += '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
        message += '\n' + 'OHOS_REPORT_STATUS_CODE: 1' + '\n';
        this.delegator.print(message).then(() => {
            console.info(this.specService.currentRunningSpec.description + ' start print success');
        });
    }

    specDone() {
        var message = '\n' + 'OHOS_REPORT_STATUS: class=' + this.suiteService.getCurrentRunningSuite().description;
        message += '\n' + 'OHOS_REPORT_STATUS: current=' + (this.index);
        message += '\n' + 'OHOS_REPORT_STATUS: id=JS';
        message += '\n' + 'OHOS_REPORT_STATUS: numtests=' + this.suiteService.getSummary().total;
        let emsg = '';
        if (this.specService.currentRunningSpec.error) {
            message += '\n' + 'OHOS_REPORT_STATUS: stack=' + this.specService.currentRunningSpec.error;
            message += '\n' + 'OHOS_REPORT_STATUS: stream=';
            message += '\n' + 'Error in ' + this.specService.currentRunningSpec.description;
            message += '\n' + this.specService.currentRunningSpec.error;
            message += '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
            message += '\n' + 'OHOS_REPORT_STATUS_CODE: -1' + '\n';
        } else if (this.specService.currentRunningSpec.result) {
            if (this.specService.currentRunningSpec.result.failExpects.length > 0) {
                this.specService.currentRunningSpec.result.failExpects.forEach(failExpect => {
                    emsg = failExpect.message || ('expect ' + failExpect.actualValue + ' ' + failExpect.checkFunc + ' ' + (failExpect.expectValue || ''));
                });
                message += '\n' + 'OHOS_REPORT_STATUS: stack=' + emsg;
                message += '\n' + 'OHOS_REPORT_STATUS: stream=';
                message += '\n' + 'Error in ' + this.specService.currentRunningSpec.description;
                message += '\n' + emsg + '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
                message += '\n' + 'OHOS_REPORT_STATUS_CODE: -2' + '\n';
            } else {
                message += '\n' + 'OHOS_REPORT_STATUS: stream=';
                message += '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
                message += '\n' + 'OHOS_REPORT_STATUS_CODE: 0' + '\n';
            }
        } else {
            message += '\n';
        }
        message += 'OHOS_REPORT_STATUS: consuming=' + this.specService.currentRunningSpec.duration + '\n';
        this.delegator.print(message).then(() => {
            console.info(this.specService.currentRunningSpec.description + ' end print success');
        });
    }
}

export default OhReport;
