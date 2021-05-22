
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';

import 'Movie.dart';

class AppDatabase {
  static final instance = AppDatabase._internal();

  Database database;

  factory AppDatabase(){
    return instance;
  }
  AppDatabase._internal(){
    print("create database");
    createDatabase();
  }

  createDatabase() async{
   database = await openDatabase(
     join(await getDatabasesPath(), 'movies.db'),
     onCreate: (db, version){
       print("inside onCreate");
       db.execute('CREATE TABLE movies (id INTEGER PRIMARY KEY, movieName TEXT, image TEXT, favorite INTEGER)',
       );
     },
     version: 1
   );
  }
  insertMovie(MovieResult movie) async{
    return await database.insert("movies", movie.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MovieResult>> getFavoriteData() async{
    print("getFavoriteData");
    List<Map< String, dynamic>> maps = await database.query("movies");
    print("${maps.length}");
    return List.generate(maps.length, (index) =>
        MovieResult.fromMap(maps[index]));

  }

}