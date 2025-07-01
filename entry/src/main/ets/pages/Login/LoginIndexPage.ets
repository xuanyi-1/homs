import { router } from '@kit.ArkUI'
import { Log } from '@abner/log';
import { ApiResponse, LoginParams } from './LoginIndexPage.type'
import { encryptText } from '../../utils/Encryptor'
import { request } from '../../utils/Request'


// Login.ets
@Entry
@Component
struct Login {
  @StorageLink('token') token: string = '';
  @State username: string = ''
  @State password: string = ''
  private handleLoginArrow = async () => {

    const usernameAes = await encryptText(this.username);

    const passwordAes = await encryptText(this.password);

    const data: LoginParams = {
      username: usernameAes,
      password: passwordAes,
    };

    const resData = await request<ApiResponse, LoginParams>({ url: '/system/user/login', method: 'post', data })

    if (resData.code === 0) {


      this.token = resData?.data?.access_token


      router.replaceUrl({ url: 'pages/Index' })

    }


  };

  build() {
    Column() {
      TextInput({ placeholder: '用户名' })
        .onChange((value: string) => this.username = value)

      TextInput({ placeholder: '密码' })
        .onChange((value: string) => this.password = value)
        .type(InputType.Password)

      Button('登录')
        .onClick(this.handleLoginArrow)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}