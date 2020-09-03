import 'dart:async';
import 'dart:io';
import 'package:flutter_workshop/model/team.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


class Api {
  Future<List<Team>> getTeams() async {
    var response = await http.get(
        "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=Italian%20serie%20a");

    if (response.statusCode == HttpStatus.ok) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse == null || jsonResponse["teams"] == null) {
        return null;
      }

      var rawTeam = jsonResponse["teams"];
      var teams = rawTeam.map<Team>((team) => Team.fromJson(team)).toList();

      return teams;
    } else {
      return null;
    }
  }
}
