import 'dart:io';

import 'create_structure/creator_interfaces.dart';

class CleanArchitectureCreatorImpl
    implements CleanArchitectureCreatorInterface {
  final DirectoryCreatorInterface directoryCreator;
  final FileCreatorInterface fileCreator;

  CleanArchitectureCreatorImpl(
      {required this.directoryCreator, required this.fileCreator});

  @override
  Future<void> create() async {
    final result = await directoryCreator.createDirectories();

    if (result) {
      await fileCreator.createNecessaryFiles();
    } else {
      stderr.writeln('Folders creation failed!');
    }
  }
}
