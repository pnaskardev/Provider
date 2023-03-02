
// ignore_for_file: file_names

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testing_provider/models/breadcrumb.dart';

class BreadCrumbProvider with ChangeNotifier
{
  final List<BreadCrumb> _item=[];

  UnmodifiableListView<BreadCrumb> get getItem =>UnmodifiableListView(_item);

  void add(BreadCrumb breadCrumb)
  {
    for(final item in _item)
    {
      item.activate();
    }
    _item.add(breadCrumb);
    notifyListeners();
  }


  void reset()
  {
    _item.clear();
    notifyListeners();
  }

}