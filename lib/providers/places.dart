import 'package:flutter/material.dart';
import '../models/great_places.dart';

class Places with ChangeNotifier{

   List <GreatPlaces> _places =[];

   List<GreatPlaces>  get places{
     // return a copy of places (privacy change only from class )
     return [..._places];
   }



}