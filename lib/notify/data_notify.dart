import 'package:flutter/cupertino.dart';
import 'package:provider_api/api/service_api.dart';
import 'package:provider_api/model/data_model.dart';

class DataNotify extends ChangeNotifier {
  DataModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getSinglePostData());
    loading = false;

    //notify update data & UI
    notifyListeners();
  }
}
