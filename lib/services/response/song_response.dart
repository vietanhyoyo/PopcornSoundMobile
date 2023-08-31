/// Define response

class SongResponse {
  int? id;
  String? slug;
  String? description;
  String? name;
  String? artist;
  String? ituneLink;
  String? amazonLink;
  String? appleLink;
  String? spotifyLink;
  String? youtubeLink;
  int? isPlay;

  SongResponse({
    this.amazonLink,
    this.appleLink,
    this.spotifyLink,
    this.youtubeLink,
    this.isPlay,
    this.slug,
    this.description,
    this.ituneLink,
    this.id,
    this.name,
    this.artist,
  });

  SongResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    description = json['description'];
    artist = json['artist'];
    ituneLink = json['itune_link'];
    amazonLink = json['amazon_link'];
    appleLink = json['apple_link'];
    youtubeLink = json['youtube_link'];
    spotifyLink = json['spotify_link'];
    isPlay = json['isPlay'];
  }

  static List<SongResponse> listFormJson(List list) {
    List<SongResponse> dataList = [];
    for (var item in list) {
      dataList.add(SongResponse.fromJson(item));
    }
    return dataList;
  }
}
