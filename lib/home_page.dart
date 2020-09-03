import 'dart:math';

import 'package:flutter/material.dart';
import 'list_item.dart';
import 'model/team.dart';
import 'service/api.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var teams = List<Team>();
  var isLoading = false;

  void _fetchTeam() async {
    setState(() {
      isLoading = true;
    });

    var tempTeams = await Api().getTeams();
    // print(tempTeams);

    setState(() {
      teams = tempTeams;
      isLoading = false;
    });
  }

  Widget _getItem(String title, Color borderColor, String logo) {
    return ListItem(borderColor, title, logo);
  }

  Color _getColor() {
    var random = Random().nextInt(Colors.primaries.length - 1);
    return Colors.primaries[random];
  }

  // List<Widget> _getMoreItem() {
  //   var items = List<Widget>();
  //   for (var i = 0; i < 100; i++) {
  //     items.add(_getItem("${i + 1}", _getColor()));k
  //   }
  //   return items;
  // }

  List<Widget> _getTeamItem() {
    var items = List<Widget>();
    for (var i = 0; i < teams.length; i++) {
      items.add(_getItem(teams[i].teamName, _getColor(), teams[i].teamBadge));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Jika isLoading == true make tampilkan CircularProgressIndicator
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: _getTeamItem(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchTeam,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
