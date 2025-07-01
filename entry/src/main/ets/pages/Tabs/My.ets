import { router } from '@kit.ArkUI';

@Component
export struct My {
  @State username: string = 'XXX经销商';
  @State company: string = '特变电新疆新能源股份有限公司';
  @StorageLink('topHeight') topHeight: number = 0

  build() {
    Column() {
      // 顶部个人信息区域

      Scroll() {
        Column() {
          Row() {
            Column() {
              Row() {
                Image($r('app.media.avatar'))
                  .width(50)
                  .height(50)
                  .borderRadius(25)
                  .margin({ right: 15 })

                Column() {
                  Text(this.username)
                    .fontSize(18)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Color.White)
                    .margin({ bottom: 5 })

                  Text(this.company)
                    .fontSize(14)
                    .fontColor(Color.White)
                    .opacity(0.9)
                }
                .alignItems(HorizontalAlign.Start)
                .flexGrow(1)
              }
              .width('100%')
              .padding({
                left: 20,
                right: 20,
                top: 20,
                bottom: 20
              })
            }
            .width('100%')
            .backgroundColor('#4d7ada')
            .borderRadius(5)
          }

          // 菜单项列表
          Column() {
            this.buildMenuItem($r('app.media.icon_done'), '我的已办', () => {
              router.pushUrl({ url: 'pages/MyDone' });
            })

            this.buildMenuItem($r('app.media.icon_password'), '修改密码', () => {
              router.pushUrl({ url: 'pages/ChangePassword' });
            })

            this.buildMenuItem($r('app.media.icon_agreement'), '用户协议', () => {
              router.pushUrl({ url: 'pages/UserAgreement' });
            })

            this.buildMenuItem($r('app.media.icon_privacy'), '隐私政策', () => {
              router.pushUrl({ url: 'pages/PrivacyPolicy' });
            })

            this.buildMenuItem($r('app.media.icon_info'), '当前版本', () => {
              router.pushUrl({ url: 'pages/VersionInfo' });
            })

            this.buildMenuItem($r('app.media.icon_logout'), '注销', () => {
              router.pushUrl({ url: 'pages/Logout' });
            })
          }
          .width('100%')
          .margin({ top: 10 })

          // 底部退出登录按钮
          Button('退出登录')
            .width('100%')
            .height(50)
            .backgroundColor('#4d7ada')
            .fontColor(Color.White)
            .fontSize(16)
            .margin({ top: 30 })
            .onClick(() => {
              // 清除token
              AppStorage.setOrCreate('token', '');
              // 跳转到登录页面
              router.replaceUrl({ url: 'pages/Login/LoginIndexPage' });
            })
        }
      }.scrollBar(BarState.Auto)
      .padding({ left: 10, right: 10 })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .padding({ top: this.topHeight })
  }

  @Builder
  buildMenuItem(icon: Resource, title: string, onClick: () => void) {
    Row() {
      Row() {
        Image(icon)
          .width(22)
          .height(22)
          .margin({ right: 15 })
          .objectFit(ImageFit.Contain)

        Text(title)
          .fontSize(16)
          .fontColor('#333333')
      }
      .width('85%')
      .alignItems(VerticalAlign.Center)

      Image($r('app.media.icon_arrow_right'))
        .width(16)
        .height(16)
        .objectFit(ImageFit.Contain)
    }
    .height(55)
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(8)
    .padding({ left: 15, right: 15 })
    .margin({ top: 10 })
    .onClick(onClick)
  }
}