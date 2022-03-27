import 'dart:io';

import 'package:clean_architecture_cli/src/create_structure/file_creator/file_creator_impl.dart';

import '../clean_arc_creator_impl.dart';
import '../create_structure/directory_creator/directory_creator_impl.dart';

import 'command_interface.dart';

class GenerateCommand implements CommandInterface {
  @override
  Future<void> execute() async {
    stdout.writeln('Generating...');

    final directoryCreator = DirectoryCreatorImpl();
    final fileCreator = FileCreatorImpl(directoryCreator);

    final creator =
        CleanArchitectureCreatorImpl(directoryCreator: directoryCreator, fileCreator: fileCreator);

    return creator.create();
  }
}
