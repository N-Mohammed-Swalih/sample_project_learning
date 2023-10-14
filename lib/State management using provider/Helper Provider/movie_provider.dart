import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luminar_sample_project/State%20management%20using%20provider/Model/movies.dart';

final List<Movies> movieList = List.generate(
    100,
    (index) => Movies(
        title: "Movie : $index",
        time:
            "Time : ${Random().nextInt(100) + 60}")); //to generate random time for each movies Random Class

class MovieProvider extends ChangeNotifier {
  final List<Movies> _movies =
      movieList; //  _ used to create private variable in an class and we need to use get to access to another class

  List<Movies> get movies =>
      _movies; //values from _movie is accessable  through this get property

  final List<Movies> _wishlist =
      []; //movie will be added when we click on that movie
  List<Movies> get movieWishList => _wishlist;

  void addtoWishList(Movies movieFromMainPage) {
    _wishlist.add(movieFromMainPage);
    notifyListeners();
  }

//remove the movie from wish list
  void removefromWishList(Movies movieFromMainPage) {
    _wishlist.remove(movieFromMainPage);
    notifyListeners();
  }
}
