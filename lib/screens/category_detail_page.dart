import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_x/models/category_model.dart';
import 'package:note_x/models/note_model.dart';
import 'package:note_x/screens/new_note_page.dart';
import 'package:note_x/util/margin.dart';
import 'package:note_x/widgets/custom_card.dart';
import 'package:note_x/widgets/no_note_page.dart';
import 'package:note_x/widgets/note_card.dart';
import 'package:provider/provider.dart';

// class CategoryDetailPage extends StatefulWidget {
//   @override
//   _CategoryDetailPageState createState() => _CategoryDetailPageState();
// }

// class _CategoryDetailPageState extends State<CategoryDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      body: CustomScrollView(
//        slivers: <Widget>[
//          SliverAppBar(
//            expandedHeight: 200,
//            pinned: true,
//            flexibleSpace: FlexibleSpaceBar(
//              title: Text('FilledStacks'),
////              background: Image.asset(
////                '022.jpg', // <===   Add your own image to assets or use a .network image instead.
////                fit: BoxFit.cover,
////              ),
//            ),
//          ),
//
//        ],
//      ),
//    );

//     return FlexibleAppBar();
//   }
// }

class CategoryDetailPage extends StatefulWidget {
  final Category category;
  CategoryDetailPage({@required this.category});

  @override
  _CategoryDetailPageState createState() =>
      _CategoryDetailPageState(category: category);
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  Category category;

  _CategoryDetailPageState({@required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: Consumer<NoteModel>(
            builder: (context, model, widget) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewNotePage(
                      category: category,
                    ),
                  ),
                );
              },
              elevation: 6,
            ),
          ),
          body: NestedScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.lightBlue[400],
                  expandedHeight: 220.0,
                  brightness: Brightness.light,
                  floating: false,
                  pinned: true,

                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    collapseMode: CollapseMode.pin,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Text(
                        category.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    background: Container(
                      color: Colors.lightBlue[400],
                      padding: EdgeInsets.fromLTRB(48.0, 48, 48, 48),
                      child: SvgPicture.asset(
                        'assets/${category.name.toLowerCase()}.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(0.0),
                  //     bottomRight: Radius.circular(0.0),
                  //   ),
                  // ),
                ),
              ];
            },
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
//            margin: EdgeInsets.all(5.0),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Consumer<NoteModel>(
                  builder: (context, model, widget) => FutureBuilder(
                    builder: (context, projectSnap) {
                      if (model.notes.length < 1 ) {
                        return NoNotePage();
                      } else {
                        return GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          children: <Widget>[
                            for (var note in model.notes)
                              NoteCard(
                                note: note,
                                category: category,
                              ),
                          ],
                        );
                      }
                    },
                    future: model.getNotes(category.id),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//                           itemCount: projectSnap.data?.length ?? 0,
//                           itemBuilder: (context, index) => Card(
//                             color: Colors.white,
//                             elevation: 3,
//                             margin: EdgeInsets.all(5.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10.0),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 10, top: 20, bottom: 20),
//                               child: Text(projectSnap.data[index].title),
//                             ),
//                           ),
//                         );

// class FlexibleAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
//       onPressed: (){}, elevation: 6,),
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               backgroundColor: Colors.grey[300],
//               expandedHeight: 180.0,
//               brightness: Brightness.light,
//               floating: false,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: false,
//                 collapseMode: CollapseMode.parallax,
//                 title: Text("Family",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                     )),
//                 background: Icon(
//                   Icons.delete,
//                   color: Colors.grey,
//                   size: screenWidth(context, percent: 0.3),
//                 ),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(0.0),
//                   bottomRight: Radius.circular(0.0),
//                 ),
//               ),
//             ),
//           ];

//         },
//         body: Container(

//           color: Colors.white,
//           padding: EdgeInsets.only(top: 5),
// //            margin: EdgeInsets.all(5.0),
//           child: MediaQuery.removePadding(
//             context: context,
//             removeTop: true,
//             child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) => Card(
//                 color: Colors.white,
//                 elevation: 3,
//                 margin: EdgeInsets.all(5.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10.0),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
//                   child: Text('Test'),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DemoLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(0),
//         child: AppBar(
//           elevation: 0,
//           backgroundColor: Color(0xfffdfdfd),
//           brightness: Brightness.light,
//         ),
//       ),
// //      bottomNavigationBar: BottomNavigationBar(items: [
// //        BottomNavigationBarItem(icon: Icon(Icons.add, color: Colors.white,), title: Text("add", ),),
// //        BottomNavigationBarItem(icon: Icon(Icons.send, color: Colors.white,),title: Text("send")),
// //        BottomNavigationBarItem(icon: Icon(Icons.event_note, color: Colors.white,),title: Text("event note")),
// //
// //      ],
// //      backgroundColor: Colors.blue[200],),
//       body: Column(
// //        mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.stretch,

//         children: <Widget>[
// //          Flexible(
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30.0),
//                     bottomRight: Radius.circular(30.0)),
// //                boxShadow: [
// //                  new BoxShadow(
// //                    offset: Offset(0, -1),
// //                    spreadRadius: -15,
// //                    color: Colors.black.withOpacity(0.08),
// //                    blurRadius: 21,
// //                  ),
// //                ],
//               ),
//               child: Text('Text'),
//             ),
//           ),

//           Expanded(
//             flex: 6,
//             child: Container(
//               color: Colors.white,
//               child: Text('Text'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
