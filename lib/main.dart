import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place.dart';
import '../providers/places.dart';
import './screens/places_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Places(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            primarySwatch: Colors.indigo, accentColor: Colors.lightBlueAccent),
        home: PlacesListScreen(),
        routes: {
          AddPlace.routeName: (context) => AddPlace(),
        },
      ),
    );
  }
}
