import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model.dart';

class MovieDetails extends StatelessWidget {
      Results result1;
      MovieDetails(this.result1, {Key key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.70,
              child: FittedBox(
                fit: BoxFit.fill,
               child: Hero(
                 tag: result1.id,
                 child: Image.network(
                    "https://image.tmdb.org/t/p/w200"+result1.posterPath),
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
                    child: Text(
                      result1.title,
                      style: TextStyle(
                          fontSize: 22,
                          decoration: TextDecoration.none,
                          color: Colors.grey),
                      textAlign: TextAlign.start,
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
                      Text("1.6k rating",
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
                      Text("No time",
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
                      Text(result1.releaseDate,
                        style: TextStyle(fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey) ,
                      ),
                    ],
                  ),


                  Padding(padding: EdgeInsets.only(top: 8,left: 4),child:Text(result1.overview,
                    style: TextStyle(fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.white70,) ,
                  ), ),

                ],
              ),
            )
          ],
        ),
      ],
    );
    //throw UnimplementedError();
  }
}
