import 'dart:async';

import 'package:shop_minions/data/local/local_database.dart';
import 'package:shop_minions/logic/monitor_db/monitor_db_event.dart';
import 'package:shop_minions/logic/monitor_db/monitor_db_state.dart';
import 'package:shop_minions/model/login.dart';
import 'package:bloc/bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _localSubscription;

  MonitorBloc() : super(MonitorState(noteList: [], idList: [])) {
    add(AskNewList());
    _localSubscription = DatabaseLocalServer.helper.stream.listen((response) {
      try {
        List<Login> localNoteList = response[0];
        List<int> localIdList = response[1];
        add(UpdateList(noteList: localNoteList, idList: localIdList));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      var response = await DatabaseLocalServer.helper.getLoginList();
      List<Login> localNoteList = response[0];
      List<int> localIdList = response[1];
      yield MonitorState(idList: localIdList, noteList: localNoteList);
    } else if (event is UpdateList) {
      yield MonitorState(idList: event.idList, noteList: event.noteList);
    }
  }

  close() {
    _localSubscription.cancel();
    return super.close();
  }
}
