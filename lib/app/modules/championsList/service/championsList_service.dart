import 'package:dio/dio.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/models/champion.model.dart';

class ChampionsListService {
  final Dio dio = Dio();

  Future<List<ChampionModel>> fetchCharacters() async {
    List<ChampionModel> championsList = [];
    Response response = await dio.get(URL_CHAMPIONSLIST);
    Map results = response.data["data"];
    results.forEach((key, value) {
      championsList.add(ChampionModel.fromMap(value));
    });
    return championsList;
  }

  Future<ChampionModel> getChampion({required String id}) async {
    ChampionModel champion;
    Response response = await dio.get('$URL_CHAMPION$id.json');
    Map<String, dynamic> result = response.data["data"][id];
    champion = ChampionModel.fromMap(result);
    return champion;
  }
}
