import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickServiceImages extends StatefulWidget {
  const PickServiceImages({Key? key}) : super(key: key);

  @override
  _PickServiceImagesState createState() => _PickServiceImagesState();
}

class _PickServiceImagesState extends State<PickServiceImages> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFiles = [];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // const Text("add images for your services"),
      Container(
          child: imageFiles.isNotEmpty
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: imageFiles.map((image) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Badge(
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                              padding: const EdgeInsets.all(1.0),
                              child: Image.file(File(image.path)),
                            ),
                            badgeColor: Colors.transparent,
                            elevation: 0,
                            ignorePointer: false,
                            badgeContent: IconButton(
                                onPressed: () {
                                  imageFiles.remove(image);
                                  print("removed");
                                  setState(() {});
                                },
                                icon: const Icon(Icons.cancel))),
                      );
                    }).toList(),
                  ))
              : TextButton.icon(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.0), side: const BorderSide(color: Colors.purple)))),
                  onPressed: () {
                    openImages();
                  },
                  icon: const Icon(Icons.photo_camera),
                  label: const Text("add images for your services"))),


      imageFiles.isNotEmpty
          ? TextButton.icon(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.0), side: const BorderSide(color: Colors.purple)))),
              onPressed: () {
                openImages();
              },
              icon: const Icon(Icons.photo_camera),
              label: const Text("more images"))
          : Text("${imageFiles.length} images added")
    ]);
  }

  openImages() async {
    try {
      var pickedFiles = await imagePicker.pickMultiImage();
      if (pickedFiles != null) {
        // print(pickedFiles);
        print("picked files $pickedFiles ");

        // if (imageFiles!.isEmpty) {
        //   imageFiles = pickedFiles;
        // } else {
        //   imageFiles!.addAll(pickedFiles);
        // }

        if (imageFiles == null) {
          imageFiles = pickedFiles;
        } else {
          imageFiles.addAll(pickedFiles);
        }

        print(imageFiles);

        setState(() {
          print("image files");
          print(imageFiles);
        });
      } else {
        print("no image is selected");
      }
    } catch (e) {
      print("error while picking image");
    }
  }
}
