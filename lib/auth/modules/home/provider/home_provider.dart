import 'package:flutter/cupertino.dart';

import '../../../utils/data/network/api_services.dart';
import '../model/post_model.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = true;
  List<PostModel> postList = [];

  Future<void> initializePage(BuildContext context) async {
    postList = await ApiServices(context).getPostList();
    print("postList.length :: ${postList.length}");
    isLoading = false;
    notifyListeners();
  }
}