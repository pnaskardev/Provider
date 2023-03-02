import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/features/home/widgets/breadcrumb_widget.dart';
import 'package:testing_provider/provider/breadCrumb_provider.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    // when you want to watch specifin changes 
    // in the provider
    // if the aspect changes the widget automatically 
    // REBUILDS
    // context.select((value) => value.aspect);
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          centerTitle: true,
          title: const Text('BreadCrumb'),
          elevation: 5,
        ),
        body: Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
            [
              Consumer<BreadCrumbProvider>
              (
                builder: ((context, value, child) 
                {
                  return BreadCrumbWidget(breadcrumbs: value.getItem);  
                })
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: 
          [
            Flexible(
              child: ElevatedButton
              (
                onPressed: ()
                {
                  Navigator.of(context).pushNamed('/new');
                }, 
                child: const Text('Add new BreadCrumb')
              ),
            ),
            Flexible(
              child: ElevatedButton
              (
                onPressed: ()
                {
                  // read is used when you wanna communicate something
                  // to the provider
                  // Don't use read when you expect to change the value dynamically
                  // should be inside a call back 
                  //doesnt has to be inside a build function
                  //
                  
                  context.read<BreadCrumbProvider>().reset();

                  // watch and listen to changes 
                  // watches any changes 
                  // 
                  context.watch<BreadCrumbProvider>(); 
                  
                  // If we are outside the build method we should use
                  // Provider.of(context)
                }, 
                child: const Text('Reset')
              ),
            )
          ],
        ),
      ),
    );
  }
}