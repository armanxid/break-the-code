import 'dart:async';
import 'package:breakthecode/model/postmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Services {
  Future<List<PostModel>?> getAllPosts() async {
    try {
      var response = await http
          .get(Uri.parse("https://kontests.net/api/v1/all"))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection timeout try again!");
      });

      if (response.statusCode == 200) {
        List jsonresponse = convert.jsonDecode(response.body);
        print("Status kodenya ${jsonresponse}");
        return jsonresponse.map((e) => new PostModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response timeout");
    }
  }
}
