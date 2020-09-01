import 'package:flutter/material.dart';
import 'package:learn_flutter/custom_scroll_view/tab_page.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = ["tab1", "tab2"];
  /// 利用自定义的controller来代替nestedScrollView内部controller的滑动控制
  ScrollController scrollController1;
  ScrollController scrollController2;
  double start = 0;

  @override
  void initState() {
    super.initState();
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();
    scrollController2.addListener(() {
      if ((scrollController2.offset - start).abs() > 3) {
        scrollController1.jumpTo(scrollController2.offset);
        start = scrollController2.offset;
      }
    });

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: scrollController1,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('Books'),
                  // This is the title in the app bar.
                  pinned: true,
                  expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              TabPage(
                scrollController: scrollController2,
              ),
              TabPage(
                scrollController: scrollController2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
