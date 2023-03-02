import 'package:details_of_provider/provider/object_provider.dart';
import 'package:details_of_provider/widgets/cheapobject_widget.dart';
import 'package:details_of_provider/widgets/expensive_widget.dart';
import 'package:details_of_provider/widgets/object_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() 
{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget 
{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return ChangeNotifierProvider
    (
      create: (_)=>ObjectProvider(),
      child: MaterialApp
      (
        theme: ThemeData
        (
          primarySwatch: Colors.deepPurple
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage()
      ),
    );
  }
}


class HomePage extends StatelessWidget 
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return SafeArea
    (
      child: Scaffold
      (
        body: Center
        (
          child: Column
          (
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
            [
              Row
              (
                children: const 
                [
                  Expanded
                  (
                    child: CheapWidget()
                  ),
                  Expanded
                  (
                    child: ExpensiveWidget()
                  ),
                ],
              ),
              Row
              (
                children:const  
                [
                  Expanded
                  (
                    child: ObjectProviderWidget()
                  )
                ],
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
            TextButton
            (
              onPressed: ()
              {
                context.read<ObjectProvider>().start();
              }, 
              child: const Text('Start')
            ),
            TextButton
            (
              onPressed: ()
              {
                context.read<ObjectProvider>().stop();
              }, 
              child: const Text('Stop')
            )
          ],
        ),
      ),
    );
  }
}
