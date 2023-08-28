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

  // Test Post method
  Future<Response> getDataDemo(Map<String, dynamic> dataRequest) {
    return post('posts/1', dataRequest);
  }

  // Test Get method
  Future<Response> getDataDemo2() {
    return get('posts/1');
  }

  // // Get movie list for pagination
  // Future<Response> getPlayLists(int pageIndex) {
  //   return get('/api/playlists?type=movies&page=$pageIndex');
  // }

  // Get movie list for pagination
  Future<Response> getPlayLists(int pageIndex) {
    return get('/api/playlists?page=$pageIndex');
  }

  // Get movie list for pagination
  Future<Response> getSoundTrackOfPlaylist(String playListSlug) {
    return get('/api/soundtrack?playlists=$playListSlug');
  }

  // Get movie list for pagination
  Future<Response> getHotFilms() {
    return get('/api/playlists?type=movies&page=1');
  }
}
