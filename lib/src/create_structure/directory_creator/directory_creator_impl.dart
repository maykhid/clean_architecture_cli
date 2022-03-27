import 'dart:io';

import '../creator_interfaces.dart';

class DirectoryCreatorImpl implements DirectoryCreatorInterface {
  // top folders names
  final _core = 'core';
  final _feature = 'feature';
  final _libDir = 'lib';
  

  // sub-folders
  static const error = 'error';
  static const network = 'network';
  static const usecases = 'usecases';
  static const util = 'util';

  late final String basePath;

  @override
  Directory get coreDir => Directory('$basePath/$_core');

  @override
  Directory get featuresDir => Directory('$basePath/$_feature');

  @override
  Directory get libDir => Directory(_libDir);

  // static get err => _error;
  // get network => _network;
  // get usecases => _usecases;
  // get util => _util;

  @override
  Future<bool> createDirectories() async {
    try {
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
      // create core sub-directories
      await Directory('$absCorePath/$error').create();
      await Directory('$absCorePath/$network').create();
      await Directory('$absCorePath/$usecases').create();
      await Directory('$absCorePath/$util').create();

      // feature directory
      print('creating feature directory...');
      await Directory(absFeaturePath).create();

      return true;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      return false;
    }
  }
}
