import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/utils/base_url.dart';

class ApiHelper extends GetConnect {

  ApiHelper();

  @override
  void onInit({String? url}) {
    allowAutoSignedCert = true;

    if (url != null) {
      httpClient.baseUrl = url;
    } else {
      httpClient.baseUrl = mainUrl;
    }

    httpClient.timeout = const Duration(seconds: 30);

    addRequestModifier();

    httpClient.addResponseModifier((request, response) {
      return response;
    });
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) async {
      // bool isHasToken = await _secureStorage.hasToken();
      // if (isHasToken) {
      //   String? token = await _secureStorage.getToken();
      //   request.headers['Authorization'] = "Bearer $token";
      // }
      request.headers['Accept'] = 'application/json; charset=utf-8';
      // request.headers['locale'] = gLanguageUser.value;

      return request;
    });
  }

  /// Test Post method
  Future<Response> getDataDemo(Map<String, dynamic> dataRequest) {
    return post('posts/1', dataRequest);
  }

  /// Test Get method
  Future<Response> getDataDemo2() {
    return get('posts/1');
  }

  /// Get movie list by type
  Future<Response> getPlayListByType(String type,int pageIndex) {
    return get('/api/playlists?type=${type}&page=$pageIndex');
  }

  /// Get movie list for pagination
  Future<Response> getPlayLists(int pageIndex) {
    return get('/api/playlists?page=$pageIndex');
  }

  /// Get sound track of the film
  Future<Response> getSoundTrackOfPlaylist(String playListSlug) {
    return get('/api/soundtrack?playlists=$playListSlug');
  }

  /// Get popular film
  Future<Response> getHotFilms() {
    return get('/api/playlists?type=movies&s=1');
  }

  /// Search film by name
  Future<Response> searchByName(String name) {
    return get('/api/playlists/search?name=${name}');
  }
}
