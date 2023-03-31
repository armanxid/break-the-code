import 'dart:ffi';

import 'package:breakthecode/model/postmodel.dart';
import 'package:breakthecode/services/service.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var getPosts = <PostModel>[].obs;
  Services services = Services();
  var postLoading = true.obs;

  @override
  void onInit() {
    callPostMethod();
    super.onInit();
  }

  callPostMethod() async {
    try {
      postLoading.value = true;
      var result = await services.getAllPosts();
      if (result != null) {
        getPosts.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }
}
