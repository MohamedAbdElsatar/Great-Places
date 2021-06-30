import 'package:flutter/material.dart';
import 'package:great_places/helper/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  

  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    dynamic staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
       locData.latitude!,
     locData.longitude!,
    );

    print(staticMapImageUrl);
    // setState(() {
    //   _previewImageUrl = staticMapImageUrl ;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: _previewImageUrl != null
              ? 
               Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                ):Text('No Location Selected ', textAlign: TextAlign.center)
              
          ,decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
          ),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text('Select On Map'))
          ],
        )
      ],
    );
  }
}
