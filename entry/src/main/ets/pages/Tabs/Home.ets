import { router } from '@kit.ArkUI'


@Component
export struct Home {
  @StorageLink('topHeight') topHeight: number = 0

  build() {

    Column() {
      Scroll() {
        Column() {
          HomeHeader()
          StatisticsTab()
          IconGridPage()
          NewsSection()
        }
      }
      .scrollBar(BarState.Auto)
      .padding({ left: 10, right: 10 })
    }
    .padding({ top: this.topHeight })
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')

  }
}

@Component
struct HomeHeader {
  build() {
    Column() {
      // 日期显示在右上角
      Stack({ alignContent: Alignment.TopEnd }) {
        Row().width('100%').height(1) // 占位元素
        Text('2024/03/21')
          .fontSize(12)
          .fontColor(Color.White)
          .margin({ top: 10, right: 16 })
      }

      // 公司信息区域
      Row() {
        Image($r('app.media.avatar'))
          .width(64)
          .height(64)
          .borderRadius(32)
          .margin({ left: 16 })

        Column() {
          Text('安庆市博嘉伟新能源科技有限公司')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .margin({ bottom: 4 })

          Text('特变电工新疆新能源股份有限公司')
            .fontSize(14)
            .fontColor(Color.White)
            .opacity(0.9)
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 16 })
      }
      .width('100%')
      .margin({ top: 10 })

      // 统计数据区域
      Row() {
        Column() {
          Text('5')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)

          Text('总点站量')
            .fontSize(14)
            .fontColor(Color.White)
            .opacity(0.9)
        }
        .justifyContent(FlexAlign.Center)
        .layoutWeight(1)

        Column() {
          Text('19')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)

          Text('总容量 (万kW)')
            .fontSize(14)
            .fontColor(Color.White)
            .opacity(0.9)
        }
        .justifyContent(FlexAlign.Center)
        .layoutWeight(1)
      }
      .width('90%')
      .backgroundColor('#33ffffff')
      .margin({ top: 10, bottom: 10 })
    }
    .width('100%')
    .borderRadius(16)
    .linearGradient({
      angle: 90,
      colors: [['#5580f7', 0.0], ['#4573bc', 1]]
    })
    .shadow({
      offsetX: 0,
      offsetY: 2,
      radius: 16,
      color: '#BBE4E4E4',
    })
  }
}

interface StatItem {
  title: string; // 统计项标题
  count: number; // 数量
  unit: string; // 单位（户）
  capacity: number; // 容量数值
  capacityUnit: string; // 容量单位
}

@Component
struct StatisticsTab {
  @State currentTab: number = 0;
  private tabs: string[] = ['今日', '当月', '本年', '全部'];
  @State statisticsData: StatItem[] = [
    {
      title: '电站签约',
      count: 21,
      unit: '户',
      capacity: 155.12,
      capacityUnit: '万(kW)'
    },
    {
      title: '勘察设计',
      count: 8,
      unit: '户',
      capacity: 73.18,
      capacityUnit: '万(kW)'
    },
    {
      title: '采购申请',
      count: 6,
      unit: '户',
      capacity: 60.18,
      capacityUnit: '万(kW)'
    },
    {
      title: '领料完成',
      count: 5,
      unit: '户',
      capacity: 50.18,
      capacityUnit: '万(kW)'
    },
    {
      title: '完工量',
      count: 5,
      unit: '户',
      capacity: 50.18,
      capacityUnit: '万(kW)'
    },
    {
      title: '并网量',
      count: 2,
      unit: '户',
      capacity: 26.12,
      capacityUnit: '万(kW)'
    },
    {
      title: '竣工量',
      count: 1,
      unit: '户',
      capacity: 10.11,
      capacityUnit: '万(kW)'
    },
  ];

  build() {
    Column() {
      // 顶部选项卡
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(this.tabs, (tabName: string, index: number) => {
          Text(tabName)
            .fontSize(14)
            .fontWeight(this.currentTab === index ? FontWeight.Medium : FontWeight.Normal)
            .fontColor(this.currentTab === index ? Color.White : '#333333')
            .backgroundColor(this.currentTab === index ? '#4D6FE5' : Color.White)
            .borderRadius(4)
            .width(80)
            .height(36)
            .textAlign(TextAlign.Center)// 动态设置右边距：非最后一项时添加 marginRight
              // .margin({
              //   right: (index < this.tabs.length - 1) ? 8 : 0,
              //   bottom: 8 // 添加底部间距防止换行后粘连
              // })
            .onClick(() => {
              this.currentTab = index;
            })
            .borderStyle(BorderStyle.Solid)
            .position({ x: '', y: '' })
            .align(Alignment.Start)
        })
      }
      .width('100%')
      .padding({ top: 10, bottom: 10 })
      .backgroundImageSize(ImageSize.Auto)
      .backgroundImagePosition(Alignment.Top)
      .grayscale(0)

      // 统计项网格
      Grid() {
        ForEach(this.statisticsData, (item: StatItem, index: number) => {
          GridItem() {
            Column() {
              // 标题
              Text(item.title)
                .fontSize(12)
                .fontColor('#333333')
                .margin({ bottom: 10 })

              // 数量
              Row() {
                Text(item.count.toString())
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333333')

                Text(item.unit)
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 2 })
              }

              // 容量
              Row() {
                Circle()
                  .width(4)
                  .height(4)
                  .fill('#4CAF50')
                  .margin({ right: 2 })

                Text(item.capacity.toString() + item.capacityUnit)
                  .fontSize(8)
                  .fontColor('#666666')
              }
              .margin({ top: 4 })
            }
            .alignItems(HorizontalAlign.Start)
            .width('100%')
            .padding(12)
            .backgroundColor(Color.White)
            .borderRadius(4)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsGap(12)
      .columnsGap(12)
      .padding({ bottom: 10 })
    }
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}

interface GridItem {
  icon?: Resource;
  label: string;
  color: string;
}

@Component
struct IconGridPage {
  @State gridData: Array<GridItem> = [
    {
      icon: $r('app.media.icon_1'),
      label: '用户登记信息',
      color: '#5B7FFF'
    },
    {
      icon: $r('app.media.icon_2'),
      label: '信息使用授权书',
      color: '#6CD0A3'
    },
    {
      icon: $r('app.media.icon_3'),
      label: '用户签约',
      color: '#F5935E'
    },
    {
      icon: $r('app.media.icon_4'),
      label: '完工确认',
      color: '#7B78F5'
    },
    {
      icon: $r('app.media.icon_5'),
      label: '并网验收',
      color: '#5B7FFF'
    },
    {
      icon: $r('app.media.icon_6'),
      label: '序列号扫描',
      color: '#6388F5'
    },
    {
      icon: $r('app.media.icon_7'),
      label: '勘查设计',
      color: '#6CD0A3'
    },
    {
      icon: $r('app.media.icon_8'),
      label: '完工信息变更',
      color: '#F5935E'
    }
  ]

  build() {
    Column() {
      Grid() {
        ForEach(this.gridData, (item: GridItem, index) => {
          GridItem() {
            Column() {
              // Icon container with rounded background
              Stack({ alignContent: Alignment.Center }) {
                Rect()
                  .width(64)
                  .height(64)
                  .radius(16)
                  .fill(item.color)

                Image(item.icon)
                  .width(32)
                  .height(32)
                  .objectFit(ImageFit.Contain)
              }

              // Label below icon
              Text(item.label)
                .fontSize(14)
                .margin({ top: 10 })
                .textAlign(TextAlign.Center)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .alignItems(HorizontalAlign.Center)
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .onClick(() => {
              console.info(`Clicked on ${item.label}`);
              // Add navigation or action handling here
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(16)
      .rowsGap(20)
      .width('100%')
      .height(200)
    }
    .width('100%')
  }
}


// 首先定义一个数据模型接口
interface ApprovalItem {
  nodeType: string; // 节点类型，如"工程负责人"
  stationCode: string; // 电站编号
  ownerName: string; // 业主姓名
  status: string; // 状态，如"完工确认"
}

// 封装为独立组件
@Component
export struct ApprovalItemCard {
  item: ApprovalItem = {} as ApprovalItem; // 使用默认空对象，实际使用时会传入数据

  build() {
    Column() {
      Row() {
        Row() {
          // 蓝色圆形头像
          Stack() {
            Circle()
              .width(40)
              .height(40)
              .fill('#4D6FE5')

            Image($r('app.media.icon_notify'))
              .width(24)
              .height(24)
              .fillColor(Color.White)
          }

          // 项目信息
          Column() {
            Row() {
              Text('审批节点：')
                .fontSize(14)
                .fontColor('#333333')

              Text(this.item.nodeType)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
            }
            .margin({ bottom: 10 })

            Row() {
              Text('电站编号：')
                .fontSize(14)
                .fontColor('#666666')

              Text(this.item.stationCode)
                .fontSize(14)
                .fontColor('#4D6FE5')
            }
            .margin({ bottom: 10 })

            Row() {
              Text('业主姓名：')
                .fontSize(14)
                .fontColor('#666666')

              Text(this.item.ownerName)
                .fontSize(14)
                .fontColor('#333333')
            }
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 12 })
        }

        // 状态标签
        Text(this.item.status)
          .fontSize(14)
          .fontColor('#DA9526')
          .backgroundColor('#FFF2DE')
          .borderRadius(4)
          .padding({
            left: 12,
            right: 12,
            top: 6,
            bottom: 6
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding(16)
    .borderRadius(8)
    .backgroundColor(Color.White)
    .margin({ bottom: 12 })
  }
}

// 示例：在父组件中使用
@Component
struct NewsSection {
  // 示例数据
  @State approvalList: ApprovalItem[] = [
    {
      nodeType: '工程负责人',
      stationCode: '365768798909',
      ownerName: '张三',
      status: '完工确认'
    },
    {
      nodeType: '检验员',
      stationCode: '365768798910',
      ownerName: '李四',
      status: '审核中'
    }
  // 可以添加更多数据项
  ]

  build() {
    Column() {
      // 标题栏
      Row() {
        Row() {
          Image($r('app.media.icon_telephone'))
            .width(16)
            .height(16)
            .margin({ right: 4 })

          Text('最新消息')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#333333')
        }

        Row() {
          Text('更多')
            .fontSize(14)
            .fontColor('#4D6FE5')

          Image($r('app.media.icon_more'))
            .width(16)
            .height(16)
            .margin({ left: 4 })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        top: 12,
        bottom: 12
      })


      // 循环展示审批项
      Column() {
        ForEach(this.approvalList, (item: ApprovalItem) => {
          ApprovalItemCard({ item: item })
        })
      }
    }
    .width('100%')
  }
}
