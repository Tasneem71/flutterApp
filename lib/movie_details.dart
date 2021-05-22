import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'Movie.dart';


class MovieDetails extends StatefulWidget {

  @override
  _State createState() => _State();

  MovieResult movieDetails;
  MovieDetails.movieObject(this.movieDetails){
    this.movieDetails = movieDetails;
  }
}

class _State extends State<MovieDetails> {

  bool _isFavorite = false;
  AppDatabase database = AppDatabase();

   //List<MovieResult> favorite = [];

  @override
  Widget build(BuildContext context) {
   // favorite = database.getFavoriteData();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.70,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Hero(
                  tag: widget.movieDetails.posterPath,
                  child: Image.network(
                      "https://image.tmdb.org/t/p/w200${
                          widget.movieDetails.posterPath
                      }"),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.movieDetails.originalTitle,
                          style: TextStyle(
                              fontSize: 22,
                              decoration: TextDecoration.none,
                              color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),

                        new Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(right: 16),
                          child: Container(
                            width: 24,
                            height: 24,
                            child: IconButton(
                                onPressed: () { setState(() {
                                  _isFavorite = !_isFavorite;
                                  insertData(_isFavorite);
                                }); },
                                 icon: Icon(Icons.favorite,
                                   color: _isFavorite?Colors.red:Colors.grey ,),
                            ),
                          ),
                        ),
                      ],

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
                        itemBuilder: (context, _) =>
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                        itemSize: 18,
                        // onRatingUpdate: (_) {  },
                      ),
                      Padding(padding: EdgeInsets.only(left: 16),),
                      Text("${widget.movieDetails.voteAverage}k rating",
                        style: TextStyle(fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 4),),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 4),),
                      Icon(Icons.timer, color: Colors.grey, size: 16,),
                      Padding(padding: EdgeInsets.only(left: 4),),
                      Text("2h 41m",
                        style: TextStyle(fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey),
                      ),
                    ],
                  ),


                  Padding(padding: EdgeInsets.only(top: 8),),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 4),),
                      Icon(Icons.date_range, color: Colors.grey, size: 16,),
                      Padding(padding: EdgeInsets.only(left: 4),),
                      Text(widget.movieDetails.releaseDate,
                        style: TextStyle(fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey),
                      ),
                    ],
                  ),


                  Padding(padding: EdgeInsets.only(top: 8, left: 4),
                    child: Text(widget.movieDetails.overview,
                      style: TextStyle(fontSize: 16,
                        decoration: TextDecoration.none,
                        color: Colors.white70,),
                    ),),

                ],
              ),
            )
          ],
        ),
      ),
    );
    //throw UnimplementedError();
  }

  void insertData(bool isFavorite) {

    if(_isFavorite){
      widget.movieDetails.isFavorite = 1;
      database.insertMovie(widget.movieDetails);
    }else{
      widget.movieDetails.isFavorite = 0;
      database.insertMovie(widget.movieDetails);
    }
  }
}
