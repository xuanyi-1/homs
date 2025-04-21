import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig, AxiosRequestConfig } from '@ohos/axios'
import { Log } from '@abner/log';

// 创建axios实例
export const instance = axios.create({
  baseURL: 'http://211.145.45.15:31005',
  headers: {
    'Content-Type': 'application/json;charset=UTF-8',
    permit: 'anchoremc',
    device: 'app'
  },
  timeout: 5000
})

// 添加请求拦截器
instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 对请求数据做点什么
  Log.info(`config:${JSON.stringify(config)}`, 'request123')

  Log.info(`1-请求配置${config.method!}-${config.url}:${JSON.stringify(config.params || config.data)}`, 'request123')
  // 通过 AppStorage 获取 token
  const token: string = AppStorage.get<string>('token') || '';
  if (token) {
    // 若 token 存在，则将其添加到请求头
    config.headers['token'] = token
  }
  return config;
}, (error: AxiosError) => {
  // 若出现异常，则提示异常信息
  // 对请求错误做些什么
  Log.error('3-http请求错误：' + JSON.stringify(error), 'request123')
  return Promise.reject(error);
});

// 添加响应拦截器
instance.interceptors.response.use((response: AxiosResponse) => {


  // 若服务器返回的是正常数据，不做任何处理
  if (response.data.code === 0) {
    Log.warn('2-响应成功结果：' + JSON.stringify(response.data), 'request123')
    return response.data
  } else {
    Log.error('3-code响应错误：' + JSON.stringify(response.data), 'request123')
    // 若服务器返回的是异常数据，则提示异常信息
    AlertDialog.show({
      message: response.data?.msg
    })

    return Promise.reject(response.data.msg)
  }
}, (error: AxiosError) => {
  // 若出现异常，则提示异常信息
  AlertDialog.show({ message: error.response?.status + '：' + error.message })
  Log.error('3-http响应错误：' + JSON.stringify(error), 'request123')
  return Promise.reject(error);
});

export function request<DataModel = null, DataParams = null>(config: AxiosRequestConfig<DataParams>) {
  return instance<null, DataModel>(config)
}


// import { request } from '../utils/Request'
//
// interface User {
//   /** token令牌 */
//   token: string
//   /** 用户ID */
//   id: string
//   /** 用户名称 */
//   account: string
//   /** 手机号 */
//   mobile: string
//   /** 头像 */
//   avatar: string
// }
//
// interface LoginParams {
//   /** 手机号 */
//   mobile: string,
//   /** 密码 */
//   password: string
// }
//
//get 请求发送params post请求参数发送data
// // 登录并返回用户数据
// async function login(data: LoginParams) {
//   const resData = await request<User, LoginParams>({ url: '/login', method: 'post', data })
//   return resData
// }
