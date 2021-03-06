import 'dart:io';

abstract class CleanArchitectureCreatorInterface {
  Future<void> create();
}

abstract class DirectoryCreatorInterface {
  Future<bool> createDirectories();

  Directory get coreDir;

  Directory get featuresDir;

  Directory get libDir;
}

abstract class FileCreatorInterface {
  Future<void> createNecessaryFiles();
}
