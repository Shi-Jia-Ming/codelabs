/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

class SysTestKit {

    static delegator = null;

    constructor() {
        this.id = 'sysTestKit';
        this.index = 0;
    }

    static actionStart(tag) {
        console.info(JSON.stringify(tag));
        var message = '\n' + 'OHOS_REPORT_ACTIONSTART: ' + JSON.stringify(tag) + '\n';
        SysTestKit.delegator.print(message).then(() => {
            console.info(tag + ' actionStart print success');
        });
    }

    static actionEnd(tag) {
        console.info(JSON.stringify(tag));
        var message = '\n' + 'OHOS_REPORT_ACTIONEND: ' + JSON.stringify(tag) + '\n';
        SysTestKit.delegator.print(message).then(() => {
            console.info(tag + ' actionEnd print success');
        });
    }

    static async existKeyword(keyword, timeout) {
        keyword = keyword || 'jsapp';
        timeout = timeout || 4;

        let searchResult = false;
        let cmd = 'hilog -x | grep -i \'' + keyword + '\' | wc -l';
        await executePromise(cmd, timeout).then((data) => {
            searchResult = data;
        });
        return searchResult;
    }
}

function executePromise(cmd, timeout) {
    return new Promise((resolve, reject) => {
        SysTestKit.delegator.executeShellCommand(cmd, timeout,
            (error, data) => {
                console.info('existKeyword CallBack: err : ' + JSON.stringify(error));
                console.info('existKeyword CallBack: data : ' + JSON.stringify(data));
                resolve(parseInt(data.stdResult) > 3 ? true : false);
            });
    });
}

export default SysTestKit;