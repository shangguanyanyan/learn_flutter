import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  final ScrollController scrollController;

  TabPage({this.scrollController});

  @override
  State<StatefulWidget> createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController ?? ScrollController(),
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text("item:$index")),
              childCount: 50),
        )
      ],
    );
  }
}
