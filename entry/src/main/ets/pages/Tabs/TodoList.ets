import { IBestSearch } from "@ibestservices/ibest-ui";

@Component
export struct TodoList {
  @StorageLink('topHeight') topHeight: number = 0

  build() {

    Column() {
      Scroll() {
        Column() {
          SearchBar()
          RenderCard()
        }
      }
      .scrollBar(BarState.Auto)
      .padding({ left: 10, right: 10 })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .padding({ top: this.topHeight })

  }
}


@Component
struct SearchBar {
  @State value: string = ""

  @Builder
  customBtn() {
    Text("搜索")
      .height("100%")
      .padding({ left: 10, right: 10 })
      .backgroundColor("#eee")
  }

  build() {
    Column({ space: 20 }) {
      IBestSearch({
        value: $value,

        customRightButton: (): void => this.customBtn()
      })
    }
  }
}


// 定义数据类型
interface SearchResult {
  auditPoint: string;
  flowName: string;
  policyType?: string;
  policyDocName?: string;
  dealer?: string;
  isIncrease?: string;
  verificationCode?: string;
  warrantyCode?: string;
  submitTime: string;
}


@Component
struct RenderCard {
  @Builder
  ResultCard(result: SearchResult) {
    Column() {
      Row() {
        Text('审批节点：')
          .fontSize(16)
          .fontColor('#666666')
        Text(result.auditPoint)
          .fontSize(16)
          .fontColor('#333333')
      }
      .width('100%')
      .margin({ top: 10 })
      .alignItems(VerticalAlign.Center)

      Row() {
        Text('流程名称：')
          .fontSize(16)
          .fontColor('#666666')
        Text(result.flowName)
          .fontSize(16)
          .fontColor('#E74C3C')
      }
      .width('100%')
      .margin({ top: 5 })
      .alignItems(VerticalAlign.Center)

      if (result.policyType) {
        Row() {
          Text('政策维护类型：')
            .fontSize(16)
            .fontColor('#666666')
          Text(result.policyType)
            .fontSize(16)
            .fontColor('#333333')
        }
        .width('100%')
        .margin({ top: 5 })
        .alignItems(VerticalAlign.Center)
      }

      if (result.policyDocName) {
        Row() {
          Text('政策文件名称：')
            .fontSize(16)
            .fontColor('#666666')
          Text(result.policyDocName)
            .fontSize(16)
            .fontColor('#333333')
        }
        .width('100%')
        .margin({ top: 5 })
        .alignItems(VerticalAlign.Center)
      }

      if (result.dealer) {
        Row() {
          Text('经销商：')
            .fontSize(16)
            .fontColor('#666666')
          Text(result.dealer)
            .fontSize(16)
            .fontColor('#333333')
        }
        .width('100%')
        .margin({ top: 5 })
        .alignItems(VerticalAlign.Center)
      }

      if (result.isIncrease) {
        Row() {
          Text('是否增减：')
            .fontSize(16)
            .fontColor('#666666')
          Text(result.isIncrease)
            .fontSize(16)
            .fontColor('#333333')
        }
        .width('100%')
        .margin({ top: 5 })
        .alignItems(VerticalAlign.Center)
      }

      if (result.verificationCode) {
        Row() {
          Text('竣工编号：')
            .fontSize(16)
            .fontColor('#666666')
          Text(result.verificationCode)
            .fontSize(16)
            .fontColor('#333333')
        }
        .width('100%')
        .margin({ top: 5 })
        .alignItems(VerticalAlign.Center)
      }

      if (result.warrantyCode) {
        Row() {
          Text('出质保单号：')
            .fontSize(16)
            .fontColor('#666666')
          Text(result.warrantyCode)
            .fontSize(16)
            .fontColor('#333333')
        }
        .width('100%')
        .margin({ top: 5 })
        .alignItems(VerticalAlign.Center)
      }

      Row() {
        Text('提交时间：')
          .fontSize(16)
          .fontColor('#666666')
        Text(result.submitTime)
          .fontSize(16)
          .fontColor('#333333')
      }
      .width('100%')
      .margin({ top: 5, bottom: 10 })
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(8)
    .padding(16)
    .margin({ top: 10 })
  }

  @State searchResults: SearchResult[] = [
    {
      auditPoint: '安质工程师',
      flowName: '政策维护',
      policyType: '付款比例维护',
      policyDocName: '46457685785',
      submitTime: '2022-11-18 12:21:11'
    },
    {
      auditPoint: '安质工程师',
      flowName: '经销商红杠比例',
      dealer: '湖北冠冠新能源有限公司',
      isIncrease: '增',
      submitTime: '2022-11-18 12:21:11'
    },
    {
      auditPoint: '安质工程师',
      flowName: '竣工验收',
      dealer: '湖北冠冠新能源有限公司',
      verificationCode: 'JGYS-2344418384561234',
      submitTime: '2022-11-18 12:21:11'
    },
    {
      auditPoint: '安质工程师',
      flowName: '出质保验收',
      dealer: '湖北冠冠新能源有限公司',
      warrantyCode: 'CZB-23444183845612234',
      submitTime: '2022-11-18 12:21:11'
    }
  ]

  build() {
    List() {
      ForEach(this.searchResults, (result: SearchResult) => {
        ListItem() {
          this.ResultCard(result)
        }
      })
    }
    .width('100%')
    .layoutWeight(1)
  }
}







