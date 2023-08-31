/// Define response

class FilmResponse {
  int? id;
  String? slug;
  String? thumbnail;
  String? name;
  String? backdrop;
  int? soundtrackCount;

  FilmResponse(
      {this.id,
      this.thumbnail,
      this.name,
      this.slug,
      this.backdrop,
      this.soundtrackCount});

  FilmResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    name = json['name'];
    backdrop = json['backdrop'];
    soundtrackCount = json['soundtrack_count'];
  }

  static List<FilmResponse> listFormJson(List list) {
    List<FilmResponse> dataList = [];
    for (var item in list) {
      dataList.add(FilmResponse.fromJson(item));
    }
    return dataList;
  }
}
