

import 'package:details_of_provider/provider/object_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ObjectProviderWidget extends StatelessWidget 
{
  const ObjectProviderWidget({super.key});

  @override
  Widget build(BuildContext context) 
  {
    final provider=context.watch<ObjectProvider>();
    return Container
    (
      height: 100,
      color: Colors.purple,
      child: Column
      (
        children: 
        [
          const Text('Object provider Widget'),
          const Text('ID'),
          Text(provider.id),
        ],
      ),
    );
  }
}