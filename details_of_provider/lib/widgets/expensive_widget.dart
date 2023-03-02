import 'package:details_of_provider/model/expensive_object.dart';
import 'package:details_of_provider/provider/object_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) 
  {
    final expensiveObject=context.select<ObjectProvider,ExpensiveObject>
    (
      (provider)=>provider.expensiveObject
    );
    return Container
    (
      height: 100,
      color: Colors.blue,
      child: Column
      (
        children: 
        [
          const Text('ExpensiveObject'),
          const Text('Last Updated'),
          Text(expensiveObject.lastUpdated),
        ],
      ),
    );
  }
}