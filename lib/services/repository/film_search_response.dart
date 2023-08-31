import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/response/app_response.dart';

class FilmSearchRepository {
  final ApiHelper _apiHelper;

  FilmSearchRepository(this._apiHelper);

  Future<dynamic> searchByName(String name) async {
    final data = await _apiHelper.searchByName(name);
    return AppResponse.getResponse(data);
  }
}
