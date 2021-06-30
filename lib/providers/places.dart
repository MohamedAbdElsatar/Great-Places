import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helper/db_helper.dart';
import '../models/place_model.dart';

class Places with ChangeNotifier {
  List<PlaceModel> _places = [];

  List<PlaceModel> get places {
    // return a copy of places (privacy change only from class )
    return [..._places];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = PlaceModel(
        id: DateTime.now().toString(),
        title: pickedTitle,
        image: pickedImage,
        location: null);

    _places.add(newPlace);
    notifyListeners();

    DBHelper.insert("user_place", {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetData() async {
    final data = await DBHelper.getData('user_place');

    _places = data
        .map((item) => PlaceModel(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null))
        .toList();

    notifyListeners();
  }

  void deletePlace(String id) {
    DBHelper.deleteData('user_place', id);
    notifyListeners();
  }
}
