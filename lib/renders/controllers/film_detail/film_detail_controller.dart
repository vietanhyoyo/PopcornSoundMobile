// ignore_for_file: unnecessary_null_comparison

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/services/repository/film_detail_repository.dart';
import 'package:popcorn_sound_mobile/services/response/episode_response.dart';
import 'package:popcorn_sound_mobile/services/response/film_response.dart';
import 'package:popcorn_sound_mobile/services/response/season_response.dart';
import 'package:popcorn_sound_mobile/services/response/song_response.dart';

class FilmDetailController extends GetxController {
  //Api define
  final FilmDetailRepository filmDetailRepository =
      Get.find<FilmDetailRepository>();

  //Data
  RxList<SongResponse> songList = RxList([]);
  RxList<EpisodeResponse> episodeList = RxList([]);
  Rx<EpisodeResponse> episodeSelect = Rx(EpisodeResponse());
  RxList<SeasonResponse> seasonList = RxList([]);
  Rx<SeasonResponse> seasonSelect = Rx(SeasonResponse());
  Rx<FilmResponse> film = Rx(FilmResponse(
      id: 1,
      slug: "",
      thumbnail: "",
      name: "",
      backdrop: "",
      soundtrackCount: 0));

  //Control
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final arguments = Get.arguments;
  RxBool isLoading = RxBool(true);
  RxBool isSongLoading = RxBool(false);
  late AudioPlayer player;

  @override
  void onInit() async {
    isLoading.value = true;
    if (arguments != null) {
      film.value = arguments[0];
      getList(arguments[0].slug);

      analytics.setAnalyticsCollectionEnabled(true);
      analytics.logEvent(name: "app_detail_film", parameters: {
        "film": arguments[0].slug,
      });
    } else {
      analytics.logEvent(name: "app_detail_film", parameters: {
        "film": "No data",
      });
    }

    super.onInit();
  }

  void getList(String slug) async {
    player = AudioPlayer();

    try {
      var res = await filmDetailRepository.getSoundTrackOfPlaylist(slug);
      List data = res;

      if (data.isNotEmpty) {
        List<SongResponse> array = SongResponse.listFormJson(data);
        songList.value = array;
      } else {
        var res = await filmDetailRepository.getSeasons(slug);
        List<SeasonResponse> data = SeasonResponse.listFormJson(res);

        if (data.isNotEmpty) {
          seasonList.value = data;
          seasonSelect.value = data[0];
          var res = await filmDetailRepository.getEpisodes(slug, data[0].slug ?? "");
          List<EpisodeResponse> epis = EpisodeResponse.listFormJson(res);
          if(epis.isNotEmpty){
            episodeList.value = epis;
            episodeSelect.value = epis[0];
            await getSoundTrack(epis[0].slug ?? "");
          }
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getSoundTrack(String episode) async {
    isSongLoading.value = true;
    try {
      var res = await filmDetailRepository.getSoundByEp(film.value.slug ?? "", episode);
      List<SongResponse> data = SongResponse.listFormJson(res);
      songList.value = data;
    } catch (e) {
      print(e);
    } finally {
      isSongLoading.value = false;
    }
  }

  Future<void> getEpBySeason(String season) async {
    isLoading.value = true;
    try {
      var res = await filmDetailRepository.getEpisodes(film.value.slug ?? "", season);
      List<EpisodeResponse> data = EpisodeResponse.listFormJson(res);
      if(data.isNotEmpty){
        episodeList.value = data;
        episodeSelect.value = data[0];
        await getSoundTrack(data[0].slug ?? "");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose(){
    if(player == null){
      return;
    }
      player.dispose();
    super.dispose();
  }

  @override
  void onClose(){
    if(player == null){
      return;
    }
      player.dispose();
    super.onClose();
  }

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }
}
