
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sqldatabase.dart';
import 'favorite.dart';
import 'getMovies.dart';
import 'Lists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FetchMovieList>(
            create: (_) => FetchMovieList(),
          ),
          ChangeNotifierProvider<DatabaseNotifier >(
            create: (_) => DatabaseNotifier() ,
          ),
        ],
        child: MaterialApp(
          title: 'Movie Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),

        )
    );
  }

}


class HomePage extends StatelessWidget {
   HomePage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Now Playing",),
              Tab(text: "Popular",),
              Tab(text: "Top Rating",),
              Tab(text: "Upcoming",),

            ],
          ),
          leading: Icon(Icons.home),
          actions: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:(_) => FavoriteScreen()));
              },
              child: Center(child: Padding(padding: EdgeInsets.only(right: 4),child:
              Text("Favorite"),)),
            )
          ],
          title: Center(child: Text("Movie App")),
          backgroundColor: Colors.black,
        ),
        body: TabBarView(
          children: <Widget>[
            Now(),
            Popular(),
            TopRating(),
            Upcoming(),
          ],
        ),
      ),
    );
  }
}
