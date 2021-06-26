import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
 late File _selectImage;
  final _picker = ImagePicker();

  Future <void> _getImage()async{

    PickedFile? selectImage = await _picker.getImage(source: ImageSource.camera );
   _selectImage= File(selectImage!.path);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _selectImage != null
              ? Image.file(
                  _selectImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Token'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _getImage,
            icon: Icon(Icons.camera_alt_outlined),
            label: Text(
              'Take an image',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
