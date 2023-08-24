import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/response/app_response.dart';

class HomeRepository {
  final ApiHelper _apiHelper;

  HomeRepository(this._apiHelper);

  Future<dynamic> getPlaylists(int pageIndex) async {
    final data = await _apiHelper.getPlaylists(pageIndex);
    return AppResponse.getResponse(data);
  }
}
