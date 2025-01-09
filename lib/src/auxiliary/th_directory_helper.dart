import 'dart:io';

import 'package:mapiah/src/definitions/th_definitions.dart';
import 'package:path_provider/path_provider.dart';

class ThDirectoryHelper {
  static Directory _rootDirectory = Directory('');
  static bool _rootDirectorySet = false;

  static Future<Directory> get rootDirectory async {
    if (!_rootDirectorySet) {
      _rootDirectory = await getApplicationDocumentsDirectory();
      _rootDirectorySet = true;
    }
    return _rootDirectory;
  }

  static Future<Directory> config() async {
    final Directory rootDir = await rootDirectory;
    final Directory configDirectory =
        Directory('${rootDir.path}/$thMainDirectory/$thConfigDirectory/');

    await configDirectory.create(recursive: true);

    return configDirectory;
  }

  static Future<Directory> main() async {
    final Directory rootDir = await rootDirectory;
    final Directory mainDirectory =
        Directory('${rootDir.path}/$thMainDirectory/');

    await mainDirectory.create(recursive: true);

    return mainDirectory;
  }

  static Future<Directory> projects() async {
    final Directory rootDir = await rootDirectory;
    final Directory projectsDirectory =
        Directory('${rootDir.path}/$thMainDirectory/$thProjectsDirectory/');

    await projectsDirectory.create(recursive: true);

    return projectsDirectory;
  }
}
