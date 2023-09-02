/// Define response

class SeasonResponse {
  String? name;
  String? slug;
  String? releaseDate;
  String? soundtrackCount;
  String? episodesCount;

  SeasonResponse(
      {this.name,
        this.slug,
        this.releaseDate,
        this.soundtrackCount,
        this.episodesCount,});

  SeasonResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    releaseDate = json['release_date'];
    soundtrackCount = json['soundtrack_count'];
    episodesCount = json['episodes_count'];
  }

  static List<SeasonResponse> listFormJson(List list) {
    List<SeasonResponse> dataList = [];
    for (var item in list) {
      dataList.add(SeasonResponse.fromJson(item));
    }
    return dataList;
  }
}
