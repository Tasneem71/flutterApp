import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

import 'Movie.dart';
import 'database.dart';



class DatabaseModel extends ChangeNotifier{

  AppDatabase database = AppDatabase();
  List<MovieResult> _favoriteList = [];

 List<MovieResult> get favorite => _favoriteList;

   getFavoriteList() {
    print("getFavoriteList");
     database.getFavoriteData().then((value){
       _favoriteList = value;
     });

    notifyListeners();
  }


}