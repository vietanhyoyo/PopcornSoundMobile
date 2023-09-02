/// Define response

class EpisodeResponse {
  String? name;
  String? slug;
  String? releaseDate;
  String? description;
  String? code;
  int? soundtrackCount;

  EpisodeResponse(
      {this.name,
      this.slug,
      this.releaseDate,
      this.soundtrackCount,
      this.description,
      this.code});

  EpisodeResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    releaseDate = json['release_date'];
    soundtrackCount = json['soundtrack_count'];
    description = json['description'];
    code = json['code'];
  }

  static List<EpisodeResponse> listFormJson(List list) {
    List<EpisodeResponse> dataList = [];
    for (var item in list) {
      dataList.add(EpisodeResponse.fromJson(item));
    }
    return dataList;
  }
}
