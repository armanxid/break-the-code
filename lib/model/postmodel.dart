import 'dart:convert';

List<PostModel> postmodelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
String postmodelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel(
      {required this.name,
      required this.url,
      required this.start_time,
      required this.end_time,
      required this.duration,
      required this.site,
      required this.in_24_hours,
      required this.status});
  String name;
  String url;
  String start_time;
  String end_time;
  String duration;
  String site;
  String in_24_hours;
  String status;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      name: json["name"],
      url: json["url"],
      start_time: json["start_time"],
      end_time: json["end_time"],
      duration: json["duration"],
      site: json["site"],
      in_24_hours: json['in_24_hours'],
      status: json['status']);
  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "start_time": start_time,
        "end_time": end_time,
        "duration": duration,
        "site": site,
        "in_24_hours": in_24_hours,
        "status": status,
      };
}
