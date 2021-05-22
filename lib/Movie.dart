
class MovieResult{
  int movieId;
  String posterPath ;
  String originalTitle ;
  String overview ;
  String releaseDate ;
  num voteAverage ;
  num voteCount ;
  String tag;
  int isFavorite;

  MovieResult({this.movieId, this.posterPath, this.originalTitle, this.overview,
    this.releaseDate, this.voteAverage, this.voteCount,this.isFavorite });


  MovieResult.fromJson (Map<String, dynamic> map){
    movieId = map["id"];
    posterPath = map["poster_path"];
    originalTitle = map["original_title"];
    overview = map["overview"];
    releaseDate = map["release_date"];
    voteAverage = map["vote_average"];
    voteCount = map["vote_count"];
    isFavorite = map["favorite"];
  }

  MovieResult.fromMap (Map<String, dynamic> map){
    movieId = map["id"];
    posterPath = map["image"];
    originalTitle = map["movieName"];
    isFavorite = map["favorite"];
  }

  toMap()=>{
    "id": movieId,
    "image": posterPath,
    "movieName": originalTitle,
    "favorite": isFavorite,

  };
  @override
  String toString() {
    // TODO: implement toString
    return movieId.toString();
  }

}
