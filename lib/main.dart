import 'package:flutter/material.dart';
import 'package:note_x/models/category_model.dart';
import 'package:note_x/models/note_model.dart';
import 'package:note_x/screens/category_detail_page.dart';
import 'package:note_x/screens/home_page.dart';
import 'package:note_x/screens/login_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     primaryColor: Color(0xff5886ff),

    //   ),
    //   home: HomePage(),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryModel>(create: (context) => CategoryModel()),
        ChangeNotifierProvider<NoteModel>(create: (context) => NoteModel()),
      ],
      child: MaterialApp(
        title: 'NoteX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff5886ff),
        ),

    //     initialRoute: "/home",
    //     routes: {
    // // When navigating to the "/" route, build the HomePage widget.
    // '/': (context) => HomePage(),
    // // When navigating to the "/second" route, build the SecondScreen widget.
    // '/second': (context) => CategoryDetailPage(),
  // },
        home: HomePage(),
        // home: LoginPage(),
      ),
    );
  }
}
