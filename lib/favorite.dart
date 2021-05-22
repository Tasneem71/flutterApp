
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Movie.dart';
import 'sqldatabase.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<DatabaseNotifier>(context,listen: false).getFavoriteList();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    //AppDatabase database = AppDatabase();



    return Consumer<DatabaseNotifier>(

      builder: (BuildContext context, value, Widget child) {
        return Container(
          color: Colors.black,
          child: FutureBuilder(
              //future:database.getFavoriteData(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.error != null){
                  return Center(child: Text((snapshot.error as Exception).toString(),));
                }
                return ListView.builder(
                    itemCount: value.favorite.length,
                    itemBuilder: (BuildContext context,int index){
                      MovieResult movieDetails = value.favorite[index];
                      return GestureDetector(
                        // onTap: (){
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder:(_) => MovieDetails.movieObject(movieDetails)));
                        // },
                        child: Row(children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            child:  Padding(padding: EdgeInsets.all(4),
                              child: Image.network("https://image.tmdb.org/t/p/w200${
                                  movieDetails.posterPath
                              }"
                                ,
                                fit: BoxFit.fill,),),),
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

                            ],
                          )

                        ],),
                      );
                    });
              }
          ),
        ) ;
      },
    );
  }
}
