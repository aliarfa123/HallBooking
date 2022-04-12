import 'package:flutter/material.dart';

class LikeProvider extends ChangeNotifier {
  bool like;
  LikeProvider({
    this.like = false,
  });

  void changeLike(bool newLike) {
    like = !newLike;
    notifyListeners();
  }
}
