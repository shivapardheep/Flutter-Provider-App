import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../classes/movies_object_class.dart';

class MoviesProvider extends ChangeNotifier {
  List<MoviesObject> movieList = List.generate(
      50,
      (index) => MoviesObject(
          title: "Movie $index",
          time: "${(Random().nextInt(200) + 60).toString()} min",
          isfav: false));

  List<MoviesObject> myCardList = [];

  List<MoviesObject> get getMoviesList => movieList;
  List<MoviesObject> get getMyCardList => myCardList;

  void addToFav(MoviesObject obj) {
    obj.isfav = true;
    myCardList.add(obj);
    notifyListeners();
  }

  void removeMyCard(MoviesObject obj) {
    obj.isfav = false;
    myCardList.remove(obj);
    notifyListeners();
  }
}
