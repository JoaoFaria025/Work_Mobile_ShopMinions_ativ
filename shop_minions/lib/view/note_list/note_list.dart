import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_minions/logic/monitor_db/monitor_db_state.dart';
import 'package:shop_minions/logic/monitor_db/montior_db_bloc.dart';
import 'package:shop_minions/model/login.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  List colorLocation = [Colors.red, Colors.blue, Colors.yellow];
  List iconLocation = [
    Icons.error_outline,
    Icons.settings_cell,
    Icons.network_check_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      return getLoginListView(state.noteList, state.idList);
    });
  }

  ListView getLoginListView(noteList, idList) {
    return ListView.builder(
      itemCount: noteList.length,
      itemBuilder: (context, position) {
        return Card(
          color: colorLocation[noteList[position].dataLocation],
          elevation: 5,
          child: ListTile(
            leading: Icon(iconLocation[noteList[position].dataLocation]),
            title: Text(noteList[position].email),
            subtitle: Text(noteList[position].senha),
            onTap: () {},
            trailing: GestureDetector(onTap: () {}, child: Icon(Icons.delete)),
          ),
        );
      },
    );
  }
}
