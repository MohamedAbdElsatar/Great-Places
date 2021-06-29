import 'package:flutter/material.dart';
import 'package:great_places/providers/places.dart';
import 'package:great_places/screens/add_place.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlace.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context).fetchAndSetData(),
        builder: (ctx, snShotData) => snShotData.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Places>(
                child: Center(
                  child: const Text('Got no places yet, start adding some!'),
                ),
                builder: (ctx, placeData, ch) => placeData.places.length <= 0
                    ? ch!
                    : ListView.builder(
                        itemCount: placeData.places.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              placeData.places[i].image,
                            ),
                          ),
                          title: Text(placeData.places[i].title),
                          onTap: () {
                            // Go to detail page ...
                          },
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete_forever,
                              size: 25,
                            ),
                            color: Theme.of(context).errorColor,
                            onPressed: () {
                              //delete Place ...
                            },
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
