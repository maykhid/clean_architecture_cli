import 'dart:io';

import 'package:clean_architecture_cli/src/create_structure/directory_creator/directory_creator_impl.dart';

import '../creator_interfaces.dart';

class FileCreatorImpl implements FileCreatorInterface {
  final DirectoryCreatorInterface directoryCreator;

  FileCreatorImpl(this.directoryCreator);

  @override
  Future<void> createNecessaryFiles() async {
    print('creating necessary files...');

    await _createFile(directoryCreator.libDir.path, 'dependency_injector');

    // create exceptions and failures
    await _createFile(
        directoryCreator.coreDir.path + '/${DirectoryCreatorImpl.error}',
        'exceptions');
    
     await _createFile(
        directoryCreator.coreDir.path + '/${DirectoryCreatorImpl.error}',
        'failures');

    // create network_info
    await _createFile(
        directoryCreator.coreDir.path + '/${DirectoryCreatorImpl.network}',
        'network_info');

    // create usecase
    await _createFile(
        directoryCreator.coreDir.path + '/${DirectoryCreatorImpl.usecases}',
        'usecase');
  }

  Future<void> _createFile(
    String basePath,
    String fileName, {
    String? content,
  }) async {
    try {
      final file = await File('$basePath/$fileName.dart').create();

      if (content != null) {
        final writer = file.openWrite();
        writer.write(content);
        writer.close();
      }
    } catch (_) {
      stderr.write('creating $fileName.dart failed!');
      exit(2);
    }
  }
}
