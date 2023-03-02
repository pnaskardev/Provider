import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testing_provider/models/breadcrumb.dart';

class BreadCrumbWidget extends StatelessWidget 
{
  final UnmodifiableListView<BreadCrumb> breadcrumbs;
  const BreadCrumbWidget({super.key,required this.breadcrumbs});

  @override
  Widget build(BuildContext context) {
    return Wrap
    (
      children: breadcrumbs.map((e)
      {
        return Text
        (
          e.getTitle,
          style: TextStyle
          (
            color: e.isActive? Colors.blue :Colors.black
          ),
        );
      }).toList() 
    );
  }
}