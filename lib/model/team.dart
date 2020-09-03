import 'package:meta/meta.dart';

class Team {
  final String teamName;
  final String teamBadge;

  // Pastikan teamname dan teambadge terisi (bukan null)
  Team(
      {@required this.teamName,
      @required this.teamBadge})
      : assert(teamName != null),
        assert(teamBadge != null);

  // Helper function (static) untuk memudahkan mengubah dari tipe data Map ke tipe data Team
  Team.fromJson(Map jsonMap)
      : teamName = jsonMap["strTeam"],
        teamBadge = jsonMap["strTeamBadge"];
}
