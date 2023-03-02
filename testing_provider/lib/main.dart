import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/features/NewBreadCrumb/screens/newbread_crumb.dart';
import 'package:testing_provider/features/home/screens/home_page.dart';
import 'package:testing_provider/provider/breadCrumb_provider.dart';

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
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp
      (
        theme: ThemeData
        (
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.deepPurple,
          useMaterial3: true
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: 
        {
          NewBreadCrumbScreen.routeName:(context) => const NewBreadCrumbScreen()
        },
      ),
    );
  }
}



