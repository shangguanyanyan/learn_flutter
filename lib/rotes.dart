import 'package:flutter/material.dart';
import 'package:learn_flutter/custom_scroll_view/list_page.dart';
import 'package:learn_flutter/infinity_list_view/infinity_list_view.dart';
import 'package:learn_flutter/main.dart';


class Rotes{
  static const homePage = "/";
  static const customList= "customList";
  static const infinityListView = "infinityListView";
  static Map<String,WidgetBuilder> routes = {
    homePage:(context){
      return MyHomePage(title: "learn flutter");
    },
    customList:(context){
      return ListPage();
    },
    infinityListView:(context){
      return InfinityListView();
    }
  };
}