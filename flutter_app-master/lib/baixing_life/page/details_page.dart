import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../page_index.dart';
import '../index.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  final GoodsProvider provider;

  DetailsPage(this.id, {Key key, this.provider}) : super(key: key);

  @override
  createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  GoodsInfo goods;

  int goods_number = 0;

  double navAlpha = 0;
  double headerHeight;
  ScrollController scrollController = ScrollController();

  TabController controller;
  List<Tab> titleTabs;

  int currentIndex = 0;

  Color c = Colors.grey;

  @override
  void initState() {
    super.initState();

    titleTabs = <Tab>[Tab(text: '详情'), Tab(text: "评论")];

    controller = TabController(length: titleTabs.length, vsync: this)
      ..addListener(() {
        // 监听滑动/点选位置
        if (controller.index.toDouble() == controller.animation.value) {
          setState(() => currentIndex = controller.index);
        }
      });

    headerHeight = Utils.width;

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() => navAlpha = 0);
        }
      } else if (offset < headerHeight) {
        if (headerHeight - offset <= Utils.navigationBarHeight) {
          setState(() => c = Colors.white);
        } else {
          c = Colors.grey;
        }
        setState(() => navAlpha = 1 - (headerHeight - offset) / headerHeight);
      } else if (navAlpha != 1) {
        setState(() => navAlpha = 1);
      }
    });

    getGoodsInfo();
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: goods == null
            ? getLoadingWidget()
            : Column(children: <Widget>[_buildBodyView(), _buildBottomView()]));
  }

  Widget _buildBodyView() {
    return Expanded(
      child: CustomScrollView(controller: scrollController, slivers: <Widget>[
        /// 头部banner
        _buildSliverAppBar(goods.goodInfo.pics),

        /// 简介
        _buildInfoView(goods.goodInfo),

        _buildTabBar(),

        _buildDetails()
      ]),
    );
  }

  Widget _buildBottomView() {
    return Row(children: <Widget>[
      Expanded(
          child: GestureDetector(
              onTap: () {
                Toast.show(context, '加入购物车');
                addCart();
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 48.0,
                  child: Text('加入购物车', style: TextStyle(color: Colors.white)),
                  color: Colors.orange))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                /// TODO 立即购买
                Toast.show(context, '立即购买');
              },
              child: Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: Text('立即购买', style: TextStyle(color: Colors.white)),
                  color: Colors.red)))
    ]);
  }

  void getGoodsInfo() async {
    goods = await ApiService.getBaixingGoodsDetailData(widget.id);

    bool isExist = await widget.provider?.isExist(widget.id);
    if (isExist) {
      goods_number = await widget.provider?.goodsAmount(widget.id);
    }

    setState(() {});
  }

  void addCart() async {
    goods.goodInfo.isChecked = 0;
    goods_number += 1;
    goods.goodInfo.amount = goods_number;
    setState(() {});
    widget.provider?.insertOrReplaceToDB(goods.goodInfo);
  }

  Widget _buildSliverAppBar(List<String> pics) {
    return SliverAppBar(
        title: Text('${goods?.goodInfo?.goodsName}',
            style: TextStyle(
                color:
                    Color.fromARGB((navAlpha * 255).toInt(), 255, 255, 255))),
        pinned: true,
        expandedHeight: headerHeight - Utils.topSafeHeight,
        leading: IconButton(
            icon: Icon(CustomIcon.back, color: c),
            onPressed: () => Navigator.pop(context)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart, color: c),
              onPressed: () => pushReplacementName(context, '/shopCart'))
        ],
        flexibleSpace: FlexibleSpaceBar(
            background: Swiper(
                pagination: SwiperPagination(
                    builder: SwiperPagination.fraction,
                    alignment: Alignment.bottomRight),
                autoplay: pics.length > 1,
                itemCount: pics.length,
                itemBuilder: (BuildContext context, int index) => Hero(
                    tag: widget.id,
                    child: ImageLoadView('${pics[index].toString()}',
                        fit: BoxFit.fill,
                        height: headerHeight,
                        width: Utils.width)))));
  }

  Widget _buildInfoView(Goods goodInfo) {
    return SliverToBoxAdapter(
      child: Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(children: <Widget>[
              Text('${goods.goodInfo.goodsName}',
                  style: TextStyle(color: Colors.black, fontSize: 22.0)),
              Gaps.vGap8,
              Text('编号：${goods.goodInfo.goodsSerialNumber}',
                  style: TextStyle(color: Colors.grey[500], fontSize: 14.0)),
              Gaps.vGap8,
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('￥${goods.goodInfo.presentPrice}',
                        style: TextStyle(color: Colors.red, fontSize: 16.0)),
                    Gaps.hGap40,
                    Text('市场价：￥${goods.goodInfo.oriPrice}',
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 14.0))
                  ])
            ], crossAxisAlignment: CrossAxisAlignment.start)),
        Container(
            width: Utils.width,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.white,
            child: Text('说明 > 极速送达 > 正品保证',
                style: TextStyle(color: Colors.redAccent)))
      ]),
    );
  }

  Widget _buildTabBar() {
    return SliverPersistentHeader(
        delegate: SliverAppBarDelegate(TabBar(
            tabs: titleTabs,
            labelColor: Colors.pinkAccent,
            unselectedLabelColor: Colors.grey,
            controller: controller,
            isScrollable: false,
            indicatorColor: Colors.pinkAccent)),
        pinned: true);
  }

  Widget _buildDetails() {
    List<Widget> children = [];

    Widget adWidget = Image.network(goods.advertesPicture.pictureAddress);

    if (currentIndex == 0) {
      children
        ..add(Html(
            data: goods.goodInfo.goodsDetail,
            defaultTextStyle: TextStyle(fontSize: 18.0),
            padding: EdgeInsets.all(8.0),
            blockSpacing: 2.0))
        ..add(adWidget);
    }
    if (currentIndex == 1) {
      if (goods.goodComments.isNotEmpty) {
        goods.goodComments.forEach((comment) {
          children.add(Container(
              child: Text('${comment.toString()}'),
              alignment: Alignment.center,
              height: 100.0));
        });
      } else {
        children.add(Container(
            child: Text('暂无评论'), alignment: Alignment.center, height: 100.0));
      }
      children.add(adWidget);
    }
    return SliverList(delegate: SliverChildListDelegate(children));
  }
}
