import 'package:details_of_provider/model/cheap_object.dart';
import 'package:details_of_provider/provider/object_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({super.key});

  @override
  Widget build(BuildContext context) 
  {
    final cheapObject=context.select<ObjectProvider,CheapObject>
    (
      (provider)=>provider.cheapObject
    );
    return Container
    (
      height: 100,
      color: Colors.green,
      child: Column
      (
        children: 
        [
          const Text('CheapObject'),
          const Text('Last Updated'),
          Text(cheapObject.lastUpdated),
        ],
      ),
    );
  }
}