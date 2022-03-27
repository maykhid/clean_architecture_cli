import 'dart:io';

import '../creator_interfaces.dart';

class DirectoryCreatorImpl implements DirectoryCreatorInterface {
  final _core = 'core';
  final _feature = 'feature';

  late final String basePath;

  @override
  Directory get coreDir => Directory('$basePath/$_core');

  @override
  Directory get featuresDir => Directory('$basePath/$_feature');

  @override
  Future<bool> createDirectories() async {
    try {
      final libDir = Directory('lib');

      if (await libDir.exists()) {
        basePath = libDir.absolute.path;
      } else {
        final res = await Directory('lib').create(recursive: true);
        basePath = res.absolute.path;
      }

      final absCorePath = coreDir.absolute.path;
      final absFeaturePath = featuresDir.absolute.path;

      print('creating directories...\n');

      // core directory
      print('creating core directory...');
      await Directory(absCorePath).create();
      // await Directory('$absCorePath/$_core').create();

      // feature directory
      print('creating feature directory...');
      await Directory(absFeaturePath).create();

      return true;
    } catch (e, s) {
      return false;
    }
  }
}
