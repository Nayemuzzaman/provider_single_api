import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/notify/data_notify.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenPager extends StatefulWidget {
  const ScreenPager({Key? key}) : super(key: key);

  @override
  State<ScreenPager> createState() => _ScreenPagerState();
}

class _ScreenPagerState extends State<ScreenPager> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataNotify>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataNotify>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter api model"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: postModel.loading
            ? Center(
                child: Container(
                  child: SpinKitThreeBounce(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        postModel.post?.title ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(postModel.post?.body ?? ""),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
