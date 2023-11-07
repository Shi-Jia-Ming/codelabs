// 执行http请求逻辑的工具类

import http from '@ohos.net.http';
import CommonConstant from '../constant/CommonConstants';

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @returns the result of HTTPS.
 */
export default async function httpGet(url: string) {
  if (!url) {
    return undefined;
  }
  let request = http.createHttp();
  let options = {
    method: http.RequestMethod.GET,
    header: { 'Content-Type': 'application/json' },
    readTimeout: CommonConstant.READ_TIMEOUT,
    connectTimeout: CommonConstant.CONNECT_TIMEOUT
  } as http.HttpRequestOptions;
  let result = await request.request(url, options);
  return result;
}