import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/services/repository/film_detail_repository.dart';
import 'package:popcorn_sound_mobile/services/response/film_response.dart';
import 'package:popcorn_sound_mobile/services/response/song_response.dart';

class FilmDetailController extends GetxController {
  //Api define
  final FilmDetailRepository filmDetailRepository =
      Get.find<FilmDetailRepository>();

  //Data
  RxList<SongResponse> songList = RxList([]);
  Rx<FilmResponse> movie = Rx(FilmResponse(
      id: 1,
      slug: "",
      thumbnail: "",
      name: "",
      backdrop: "",
      soundtrackCount: 0));

  //Control
  RxBool isLoading = RxBool(true);
  var player;

  @override
  void onInit() async {
    // await player.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview123/v4/04/bd/34/04bd3447-b442-3120-8c57-e703ca07f3fd/mzaf_17159154013500109701.plus.aac.p.m4a'));
    isLoading.value = true;
    final arguments = Get.arguments;
    if (arguments != null) {
      movie.value = arguments[0];
      getList(arguments[0].slug);
    }

    super.onInit();
  }

  void getList(String slug) {
    player = AudioPlayer();

    filmDetailRepository.getSoundTrackOfPlaylist(slug).then((res) {
      List data = res;
      List<SongResponse> array = SongResponse.listFormJson(data);

      songList.value = array;
      isLoading.value = false;
    }).catchError((e) {
      print(e);
      isLoading.value = false;
    });
  }

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }
}