import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/response/app_response.dart';

class FilmListRepository {
  final ApiHelper _apiHelper;

  FilmListRepository(this._apiHelper);

  Future<dynamic> getPlayListByType(String type, int pageIndex) async {
    final data = await _apiHelper.getPlayListByType(type, pageIndex);
    return AppResponse.getResponse(data);
  }
}
