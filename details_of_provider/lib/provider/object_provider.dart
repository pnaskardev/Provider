import 'dart:async';
import 'package:details_of_provider/model/cheap_object.dart';
import 'package:details_of_provider/model/expensive_object.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ObjectProvider extends ChangeNotifier
{
  late String id;
  late CheapObject _cheapObject;
  late ExpensiveObject _expensiveObject;

  late StreamSubscription _cheapObjectStreamSubs;
  late StreamSubscription _expensiveObjectStreamSubs;

  CheapObject get cheapObject=>_cheapObject;
  ExpensiveObject get expensiveObject=>_expensiveObject;


  ObjectProvider():
    id=const Uuid().v4(),
    _cheapObject=CheapObject(),
    _expensiveObject=ExpensiveObject()
    {
      start();
    }

  @override
  void notifyListeners()
  {
    id=const Uuid().v4();
    super.notifyListeners();
  }
  
  void start()
  {
    _cheapObjectStreamSubs=Stream.periodic
    (
      const Duration(seconds: 1)
    ).listen((_) 
    {
      _cheapObject=CheapObject();
      notifyListeners();
    });


    _expensiveObjectStreamSubs=Stream.periodic
    (
      const Duration(seconds: 10)
    ).listen((_) 
    {
      _expensiveObject=ExpensiveObject();
      notifyListeners();
    });
  }

  void stop()
  {
    _cheapObjectStreamSubs.cancel();
    _expensiveObjectStreamSubs.cancel();
  }


}