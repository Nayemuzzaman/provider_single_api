import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/notify/data_notify.dart';
import 'package:provider_api/screeens/screenpager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataNotify(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenPager(),
      ),
    );
  }
}
