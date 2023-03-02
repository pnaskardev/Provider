import 'package:uuid/uuid.dart';

class BreadCrumb
{
  final String uuid;
  final String name;
  bool isActive;

  BreadCrumb({required this.name,required this.isActive})
  :uuid= const Uuid().v4() ;

  void activate()
  {
    isActive=true;
  }

  String get getTitle=>name+(isActive? ' > ':'');

  bool operator == (covariant BreadCrumb other)=>uuid==other.uuid;

  @override
  int get hashCode => uuid.hashCode;

}