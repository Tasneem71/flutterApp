import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model.dart';
import 'movie_datails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Now Playing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<Results> movies = [];

  Future<List<Results>> getMovies(String link) async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/'+link+'?api_key=f55fbda0cb73b855629e676e54ab6d8e&language=en-US&page=1');
    print(response.data);
    if (response.statusCode == 200) {
      for (var item in response.data["results"]) {
        movies.add(Results.fromJson(item));
        print(item);
      }
      return movies;
    } else {
      throw Exception('Failed to load album');
    }
  }




  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: FutureBuilder(
            future: getMovies("now_playing"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              print(snapshot.data);
              if (snapshot.hasError) print(snapshot.error);
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Results movie = snapshot.data[index];
                    return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MovieDetails(movie)));
                        },
                        title: Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: ClipRRect(
                                  child: Hero(
                                    tag: movie.id,
                                  child: Image.network(
                                      "https://image.tmdb.org/t/p/w200" +
                                          movie.posterPath),),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movie.title),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      itemSize: 18,
                                      onRatingUpdate: (_) {},
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            padding: new EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Icon(
                                              Icons.alarm,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                        Container(
                                          padding: new EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: Text(
                                            "3h 35m",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            padding: new EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                        Container(
                                          padding: new EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: Text(
                                            movie.releaseDate,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
                  });
            }),
      ),
    );
  }
}


/*child: FutureBuilder(
            future: getMovies("now_playing"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              print(snapshot.data);
              if (snapshot.hasError) print(snapshot.error);
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Results movie = snapshot.data[index];
                    return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MovieDetails(movie)));
                        },
                        title: Row(
                          children: [
                            SizedBox(
                                width: 100,
                                child: ClipRRect(
                                  child: Hero(
                                    tag: "pic",
                                  child: Image.network(
                                      "https://image.tmdb.org/t/p/w200" +
                                          movie.posterPath),),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movie.title),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      itemSize: 18,
                                      onRatingUpdate: (_) {},
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            padding: new EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Icon(
                                              Icons.alarm,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                        Container(
                                          padding: new EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: Text(
                                            "3h 35m",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            padding: new EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                        Container(
                                          padding: new EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: Text(
                                            movie.releaseDate,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
                  });
            })
 */
