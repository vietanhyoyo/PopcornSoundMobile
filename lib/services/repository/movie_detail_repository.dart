import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/response/app_response.dart';

class MovieDetailRepository {
  final ApiHelper _apiHelper;

  MovieDetailRepository(this._apiHelper);

  Future<dynamic> getPlaylists(String playListSlug) async {
    final data = await _apiHelper.getSoundTrackOfPlaylist(playListSlug);
    return AppResponse.getResponse(data);
  }
}
