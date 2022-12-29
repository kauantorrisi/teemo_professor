import 'package:dio/dio.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/models/ranked.model.dart';

class ScoreboardService {
  final Dio dio = Dio();

  Future<RankedModel> getRankedChallengerSoloQInfo() async {
    RankedModel rankedChallengerSoloQInfo;
    Response response = await dio.get(LOL_RANKEDCHALLENGERSOLOQINFO,
        options: Options(headers: {'X-Riot-Token': API_KEY}));
    Map<String, dynamic> result = response.data;
    rankedChallengerSoloQInfo = RankedModel.fromMap(result);
    return rankedChallengerSoloQInfo;
  }
}
