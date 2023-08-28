import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/response/app_response.dart';

class FilmDetailRepository {
  final ApiHelper _apiHelper;

  FilmDetailRepository(this._apiHelper);

  Future<dynamic> getSoundTrackOfPlaylist(String playListSlug) async {
    final data = await _apiHelper.getSoundTrackOfPlaylist(playListSlug);
    return AppResponse.getResponse(data);
  }
}
