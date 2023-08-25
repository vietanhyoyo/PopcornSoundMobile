import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/renders/controllers/home/home_controller.dart';
import 'package:popcorn_sound_mobile/services/repository/movie_detail_repository.dart';

class MovieDetailController extends GetxController {
  //Api define
  final MovieDetailRepository movieDetailRepository =
      Get.find<MovieDetailRepository>();

  //Data
  RxList<Song> songList = RxList([]);
  Rx<Movie> movie = Rx(Movie(
      id: "1",
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

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }

  void getList(String slug) {
    player = AudioPlayer();

    movieDetailRepository.getPlaylists(slug).then((res) {
      List data = res;
      List<Song> array = [];

      data.forEach((item) {
        final Song newSong = Song(
          id: item["id"].toString(),
          slug: item["slug"].toString(),
          name: item["name"],
          description: item["description"],
          artist: item["artist"],
          ituneLink: item["itune_link"],
          amazonLink: item["amazon_link"],
          appleLink: item["apple_link"],
          spotifyLink: item["spotify_link"],
          youtubeLink: item["youtube_link"],
          isPlay: item["isPlay"],
        );

        array.add(newSong);
      });

      songList.value = array;
      isLoading.value = false;
    }).catchError((e) {
      isLoading.value = false;
    });
  }

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }


}

class Song {
  final String id;
  final String slug;
  final String? description;
  final String name;
  final String artist;
  final String? ituneLink;
  final String? amazonLink;
  final String? appleLink;
  final String? spotifyLink;
  final String? youtubeLink;
  final int? isPlay;

  Song({
    this.amazonLink,
    this.appleLink,
    this.spotifyLink,
    this.youtubeLink,
    this.isPlay,
    required this.slug,
    this.description,
    this.ituneLink,
    required this.id,
    required this.name,
    required this.artist,
  });
}
