import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final TextEditingController? _titleController = TextEditingController();

  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController!.text.isEmpty || _pickedImage == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Can not add place!'),
                content: Text('Title or Image could be Empty please check it'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'))
                ],
              ));
      return;
    }

    Provider.of<Places>(context, listen: false)
        .addPlace(_titleController!.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'title'),
                    ),
                    SizedBox(height: 10),
                    ImageInput(_selectImage),
                   SizedBox(height: 10),
                   LocationInput(),

                  ],
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('add'),
            style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Theme.of(context).accentColor,
                primary: Colors.white),
          )
        ],
      ),
    );
  }
}
