import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/models/breadcrumb.dart';
import 'package:testing_provider/provider/breadCrumb_provider.dart';

class NewBreadCrumbScreen extends StatefulWidget {
  const NewBreadCrumbScreen({super.key});
  static const routeName='/new';
  @override
  State<NewBreadCrumbScreen> createState() => _NewBreadCrumbScreenState();
}

class _NewBreadCrumbScreenState extends State<NewBreadCrumbScreen> 
{
  late final _controller;
  @override
  void initState() 
  {
    super.initState();
    _controller=TextEditingController();
  }

  @override
  void dispose() 
  {
    super.dispose();
    _controller.dispose;  
  }

  @override
  Widget build(BuildContext context) 
  {
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          leading: const BackButton(),
          centerTitle: true,
          title: const Text('Add New BreadCrumb'),
        ),
        body: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: 
          [
            TextField
            (
              controller: _controller,
              decoration: const InputDecoration
              (
                hintText: 'Enter a new BreadCrumb'
              ),
            ),
            TextButton
            (
              onPressed: ()
              {
                final text=_controller.text;
                if(text.isNotEmpty)
                {
                  final bread=BreadCrumb
                  (
                    name: text, 
                    isActive: false
                  );
                  context.read<BreadCrumbProvider>().add(bread);
                }
                Navigator.of(context).pop();
              }, 
              child: const Text('Add')
            )
          ],
        ),
      )
    );
  }
}