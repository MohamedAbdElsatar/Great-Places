const String GOOGLE_API_KEY ='AIzaSyAT_tZYA-kKuyE-Sh8fjdpEkUzH1C-KZ2c';

 class LocationHelper{

static String generateLocationPreviewImage(double latitude,  double longitude)  {

   return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }



 }

// 'https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap
// &markers=color:blue%7Clabel:S%7C 40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318
// &markers=color:red%7Clabel:C%7C40.718217,-73.998284
// &key=AIzaSyBQesMHl37CR0VFXEblL26lIfG2toDT794'