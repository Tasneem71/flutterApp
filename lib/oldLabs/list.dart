import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model.dart';
import 'movie_datails.dart';


void main() {
  runApp(TabBarexampl());
}

Future<List<Results>> getMovies(String list) async {
  List<Results> movies = [];
  final response = await Dio().get(
      'https://api.themoviedb.org/3/movie/'+list+'?api_key=f55fbda0cb73b855629e676e54ab6d8e&language=en-US&page=1');
  print(response.data);
  if (response.statusCode == 200) {
    for (var item in response.data["results"]) {
      movies.add(Results.fromJson(item));
      print(item);
    }
    return movies;
  } else {
    throw Exception('Failed to load movie');
  }
}
class TabBarexampl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading:Icon(Icons.home),
            bottom: TabBar(
              tabs: [
                Tab(child:Text("Now Playing")),
                Tab(child:Text("Popular")),
                Tab(child:Text("Upcoming")),
                Tab(child:Text("Top Rated")),
              ],
            ),
            title: Text('Movie App'),
          ),
          body: TabBarView(
            children: [
              Container(
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
              Container(
                color: Colors.blueGrey,
                child: FutureBuilder(
                    future: getMovies("popular"),
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
              Container(
                color: Colors.blueGrey,
                child: FutureBuilder(
                    future: getMovies("upcoming"),
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
              Container(
                color: Colors.blueGrey,
                child: FutureBuilder(
                    future: getMovies("top_rated"),
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
            ],
          ),
        ),
      ),
    );
  }
}