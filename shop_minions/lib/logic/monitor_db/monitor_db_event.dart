import 'package:shop_minions/model/login.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<Login> noteList;
  List<int> idList;
  UpdateList({this.noteList, this.idList});
}
