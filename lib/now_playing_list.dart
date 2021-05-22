
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database_model.dart';
import 'package:flutter_app/fetch_movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:provider/provider.dart';

import 'Movie.dart';
import 'movie_details.dart';

class MovieNowPlaying extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    Provider.of<FetchMovieList>(context,listen: false).fetchMovies("now_playing");
    return Consumer<FetchMovieList>(
      builder: (BuildContext context, value, Widget child) {
        return Container(
            color: Colors.black,
            child: FutureBuilder(
                future: null,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.error != null){
                    return Center(child: Text((snapshot.error as Exception).toString(),));
                  }
                  return ListView.builder(
                      itemCount: value.movies.length,
                      itemBuilder: (BuildContext context,int index){
                        MovieResult movieDetails = value.movies[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder:(_) => MovieDetails.movieObject(movieDetails)));
                          },
                          child: Row(children: <Widget>[
                            Container(
                              width: 150,
                              height: 150,
                              child:  Padding(padding: EdgeInsets.all(4),
                                child: Hero(
                                  tag: movieDetails.posterPath,
                                  child: Image.network("https://image.tmdb.org/t/p/w200${
                                      movieDetails.posterPath
                                  }"
                                    ,
                                    fit: BoxFit.fill,),
                                ),),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  child: Text(
                                    movieDetails.originalTitle,
                                    style: TextStyle(
                                        fontSize: 22,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  margin: EdgeInsets.only(left: 4),
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 4, top: 32),),
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
                                      // onRatingUpdate: (_) {  },
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 16),),
                                    Text("${movieDetails.voteAverage}k rating",
                                      style: TextStyle(fontSize: 14,
                                          decoration: TextDecoration.none,
                                          color: Colors.grey) ,
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 4),),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 4),),
                                    Icon(Icons.timer,color: Colors.grey,size: 16,),
                                    Padding(padding: EdgeInsets.only(left: 4),),
                                    Text("2h 41m",
                                      style: TextStyle(fontSize: 14,
                                          decoration: TextDecoration.none,
                                          color: Colors.grey) ,
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 8),),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 4),),
                                    Icon(Icons.date_range,color: Colors.grey,size: 16,),
                                    Padding(padding: EdgeInsets.only(left: 4),),
                                    Text(movieDetails.releaseDate,
                                      style: TextStyle(fontSize: 14,
                                          decoration: TextDecoration.none,
                                          color: Colors.grey) ,
                                    ),
                                  ],
                                ),
                              ],
                            )

                          ],),
                        );
                      });
                }
            ),

        );
      },

    );
  }

}

class PopularMovies extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    Provider.of<FetchMovieList>(context,listen: false).fetchMovies("popular");
    return Consumer<FetchMovieList>(
      builder: (BuildContext context, value, Widget child) {
        return Container(
          color: Colors.black,
          child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.error != null){
                  return Center(child: Text((snapshot.error as Exception).toString(),));
                }
                return ListView.builder(
                    itemCount: value.movies.length,
                    itemBuilder: (BuildContext context,int index){
                      MovieResult movieDetails = value.movies[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:(_) => MovieDetails.movieObject(movieDetails)));
                        },
                        child: Row(children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            child:  Padding(padding: EdgeInsets.all(4),
                              child: Hero(
                                tag: movieDetails.posterPath,
                                child: Image.network("https://image.tmdb.org/t/p/w200${
                                    movieDetails.posterPath
                                }"
                                  ,
                                  fit: BoxFit.fill,),
                              ),),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 200,
                                child: Text(
                                  movieDetails.originalTitle,
                                  style: TextStyle(
                                      fontSize: 22,
                                      decoration: TextDecoration.none,
                                      color: Colors.grey),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                margin: EdgeInsets.only(left: 4),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4, top: 32),),
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
                                    // onRatingUpdate: (_) {  },
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 16),),
                                  Text("${movieDetails.voteAverage}k rating",
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 4),),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Icon(Icons.timer,color: Colors.grey,size: 16,),
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Text("2h 41m",
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 8),),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Icon(Icons.date_range,color: Colors.grey,size: 16,),
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Text(movieDetails.releaseDate,
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  ),
                                ],
                              ),
                            ],
                          )

                        ],),
                      );
                    });
              }
          ),

        );
      },

    );
  }

}

class TopRatingMovies extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    Provider.of<FetchMovieList>(context,listen: false).fetchMovies("top_rated");
    return Consumer<FetchMovieList>(
      builder: (BuildContext context, value, Widget child) {
        return Container(
          color: Colors.black,
          child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.error != null){
                  return Center(child: Text((snapshot.error as Exception).toString(),));
                }
                return ListView.builder(
                    itemCount: value.movies.length,
                    itemBuilder: (BuildContext context,int index){
                      MovieResult movieDetails = value.movies[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:(_) => MovieDetails.movieObject(movieDetails)));
                        },
                        child: Row(children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            child:  Padding(padding: EdgeInsets.all(4),
                              child: Hero(
                                tag: movieDetails.posterPath,
                                child: Image.network("https://image.tmdb.org/t/p/w200${
                                    movieDetails.posterPath
                                }"
                                  ,
                                  fit: BoxFit.fill,),
                              ),),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 200,
                                child: Text(
                                  movieDetails.originalTitle,
                                  style: TextStyle(
                                      fontSize: 22,
                                      decoration: TextDecoration.none,
                                      color: Colors.grey),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                margin: EdgeInsets.only(left: 4),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4, top: 32),),
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
                                    // onRatingUpdate: (_) {  },
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 16),),
                                  Text("${movieDetails.voteAverage}k rating",
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 4),),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Icon(Icons.timer,color: Colors.grey,size: 16,),
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Text("2h 41m",
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 8),),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Icon(Icons.date_range,color: Colors.grey,size: 16,),
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Text(movieDetails.releaseDate,
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  ),
                                ],
                              ),
                            ],
                          )

                        ],),
                      );
                    });
              }
          ),

        );
      },

    );
  }

}

class UpcomingMovies extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    Provider.of<FetchMovieList>(context,listen: false).fetchMovies("upcoming");
    return Consumer<FetchMovieList>(
      builder: (BuildContext context, value, Widget child) {
        return Container(
          color: Colors.black,
          child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.error != null){
                  return Center(child: Text((snapshot.error as Exception).toString(),));
                }
                return ListView.builder(
                    itemCount: value.movies.length,
                    itemBuilder: (BuildContext context,int index){
                      MovieResult movieDetails = value.movies[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:(_) => MovieDetails.movieObject(movieDetails)));
                        },
                        child: Row(children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            child:  Padding(padding: EdgeInsets.all(4),
                              child: Hero(
                                tag: movieDetails.posterPath,
                                child: Image.network("https://image.tmdb.org/t/p/w200${
                                    movieDetails.posterPath
                                }"
                                  ,
                                  fit: BoxFit.fill,),
                              ),),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 200,
                                child: Text(
                                  movieDetails.originalTitle,
                                  style: TextStyle(
                                      fontSize: 22,
                                      decoration: TextDecoration.none,
                                      color: Colors.grey),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                margin: EdgeInsets.only(left: 4),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4, top: 32),),
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
                                    // onRatingUpdate: (_) {  },
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 16),),
                                  Text("${movieDetails.voteAverage}k rating",
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 4),),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Icon(Icons.timer,color: Colors.grey,size: 16,),
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Text("2h 41m",
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 8),),
                              Row(
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Icon(Icons.date_range,color: Colors.grey,size: 16,),
                                  Padding(padding: EdgeInsets.only(left: 4),),
                                  Text(movieDetails.releaseDate,
                                    style: TextStyle(fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey) ,
                                  ),
                                ],
                              ),
                            ],
                          )

                        ],),
                      );
                    });
              }
          ),

        );
      },

    );
  }

}

