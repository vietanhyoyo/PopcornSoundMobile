import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/response/app_response.dart';

class HomeRepository {
  final ApiHelper _apiHelper;

  HomeRepository(this._apiHelper);

  Future<dynamic> getPlayLists(int pageIndex) async {
    final data = await _apiHelper.getPlayLists(pageIndex);
    return AppResponse.getResponse(data);
  }

  Future<dynamic> getHotFilms() async {
    final data = await _apiHelper.getHotFilms();
    return AppResponse.getResponse(data);
  }
}
