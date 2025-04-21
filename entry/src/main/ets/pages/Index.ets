import { themeManager } from '../manager';
import { router } from '@kit.ArkUI'
import { Home } from './Tabs/Home'
import { TodoList } from './Tabs//TodoList'
import { My } from './Tabs/My'


@Entry
@Component
struct Index {
  @Provide currentIndex: number = 0
  @StorageLink('bottomHeight') bottomHeight: number = 0
  @StorageLink('token') token: string = '';

  onPageShow() {
    themeManager.enableFullScreen()


    // if (!this.token) {
    //   router.replaceUrl({ url: "pages/Login/LoginIndexPage", params: null });
    // }
  }

  onPageHide() {
    themeManager.disableFullScreen()
  }

  @Builder
  TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg).width(20).aspectRatio(1)
      Text(title)
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.brand') : $r('app.color.font'))
        .margin({ top: 4 })
    }
    .width('100%')
    .height(56)
    .border({ width: { top: 1 }, color: '#eee' })
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex
    })
  }

  build() {
    Tabs({ index: this.currentIndex, barPosition: BarPosition.End }) {
      TabContent() {
        Home()
      }
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.ic_home_select'), $r('app.media.ic_my')))

      TabContent() {
        TodoList()
      }.tabBar(this.TabBuilder('待办', 1, $r('app.media.ic_todoList_select'), $r('app.media.ic_todoList')))

      TabContent() {
        My()
      }.tabBar(this.TabBuilder('我的', 2, $r('app.media.ic_my_select'), $r('app.media.ic_my')))
    }.barMode(BarMode.Fixed) // 默认值 Fixed
    .scrollable(false) // 限制滑动
    .padding({ bottom: this.bottomHeight })
  }
}