import 'package:popcorn_sound_mobile/services/api_helper.dart';
import 'package:popcorn_sound_mobile/services/response/app_response.dart';

class FilmDetailRepository {
  final ApiHelper _apiHelper;

  FilmDetailRepository(this._apiHelper);

  Future<dynamic> getSoundTrackOfPlaylist(String playListSlug) async {
    final data = await _apiHelper.getSoundTrackOfPlaylist(playListSlug);
    return AppResponse.getResponse(data);
  }

  Future<dynamic> getSeasons(String playListSlug) async {
    final data = await _apiHelper.getSeasons(playListSlug);
    return AppResponse.getResponse(data);
  }

  Future<dynamic> getEpisodes(String playListSlug, String season) async {
    final data = await _apiHelper.getEpisodes(playListSlug, season);
    return AppResponse.getResponse(data);
  }

  Future<dynamic> getSoundByEp(String playListSlug, String episode) async {
    final data = await _apiHelper.getSoundByEp(playListSlug, episode);
    return AppResponse.getResponse(data);
  }
}
