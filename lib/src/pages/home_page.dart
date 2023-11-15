import 'package:mapiah/src/pages/th2_file_display_page.dart';
import 'package:mapiah/src/th_file_aux/th_file_parser.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapiah'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_open_outlined),
            onPressed: () => _pickTh2File(context),
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Mapiah!'),
      ),
    );
  }

  void _pickTh2File(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select a TH2 file',
        type: FileType.custom,
        allowedExtensions: ['th2'],
      );

      if (result != null) {
        // Use the file
        String? pickedFilePath = result.files.single.path;
        if (pickedFilePath == null) {
          return;
        }
        Get.to(() => TH2FileDisplayPage(filename: pickedFilePath));
      } else {
        // User canceled the picker
        print('No file selected.');
      }
    } catch (e) {
      print('Error picking file: $e');
      // Optionally, handle the error for the user
    }
  }

  void _showAboutDialog(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final version = packageInfo.version;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About Mapiah'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Version: $version'),
                SizedBox(height: 16),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
