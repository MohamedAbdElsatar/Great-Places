import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  Future<void> _getImage() async {
    PickedFile? _pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _selectedImage = File(_pickedFile!.path);
    });

    // directory where can store app data
    final pathDir = await sysPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(_pickedFile!.path);
    print(pathDir);
    print(fileName);
    await _selectedImage!.copy('${pathDir.path}/$fileName');
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
          child: _selectedImage != null
              ? Image.file(
                  _selectedImage!,
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
