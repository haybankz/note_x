import 'package:flutter/material.dart';
import 'package:note_x/models/category_model.dart';
import 'package:note_x/util/margin.dart';
import 'package:note_x/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
//  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
          child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              brightness: Brightness.light,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//          MenuButton(),
              YMargin(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'NoteX',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30.0),
                ),
              ),
              YMargin(10),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  child: Consumer<CategoryModel>(
                    builder: (context, model, widget) => FutureBuilder(
                      builder: (context, projectSnap) {
                        if (projectSnap.connectionState == ConnectionState.none &&
                            projectSnap.hasData == null) {
                          //print('project snapshot data is: ${projectSnap.data}');
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            children: <Widget>[
                              for (var category in model.category)
                                CustomCard(
                                  title: '${category.name}',
                                  category: category,
                                ),
                            ],
                          );
                        }
                      },
                      future: model.getCategorie(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class Header
