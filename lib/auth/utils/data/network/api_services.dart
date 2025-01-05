import 'package:flutter/cupertino.dart';

import '../../../modules/home/model/common_model.dart';
import '../../../modules/home/model/post_model.dart';
import 'api_constants.dart';
import 'api_helper.dart';

class ApiServices {
  BuildContext mContext;
  final ApiHelper _helper = ApiHelper();

  ApiServices(this.mContext);

  CommonModel? commonParse(dynamic response) {
    try {
      var apiResponse = CommonModel.fromJson(response);
      return apiResponse;
    } catch (e) {
      print('error on parsing common');
      return null;
    }
  }

  Future<dynamic> getPostList() async {
    try {
      String url = ApiConstants.getPosts;
      var response = await _helper.get(mContext, url);
      return response.map<PostModel>((data) => PostModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint('ApiService ===> GetPostException :: $e');
    }
  }
}
