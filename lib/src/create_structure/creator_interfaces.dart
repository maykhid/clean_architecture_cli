import 'dart:io';

abstract class CleanArchitectureCreatorInterface {
  Future<void> create();
}

abstract class DirectoryCreatorInterface {
  Future<bool> createDirectories();

  Directory get coreDir;

  Directory get featuresDir;
}

abstract class FileCreatorInterface {
  Future<void> createNecessaryFiles();
}
