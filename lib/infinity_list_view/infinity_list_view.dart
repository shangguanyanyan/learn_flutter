import 'package:flutter/material.dart';

import 'card_item.dart';
import 'mock_data.dart';
import 'person.dart';

class InfinityListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InfinityListViewState();
  }

}

class _InfinityListViewState extends State<InfinityListView>{
  ScrollController scrollController;
  double maxOffset = 40.0;
  List<Person> persons = [];
  @override
  void initState() {
    super.initState();
    persons.addAll(mockData);
    scrollController = ScrollController();
    scrollController.addListener(() {
      var maxScroll = scrollController.position.maxScrollExtent;
      if(maxScroll - maxOffset < scrollController.offset){
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            persons.addAll(mockData);
          });
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("哪都通员工联系手册"),
        ),
        body: Center(
          child: ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index) {
              return index >= persons.length
                  ? bottomLoader()
                  : CardItem(persons[index]);
            },
            itemCount: persons.length + 1,
          ),
        ));
  }

  Widget bottomLoader() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "加载中。。。",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}