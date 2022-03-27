import 'dart:io';

import 'package:clean_architecture_cli/src/clean_arc_creator_impl.dart';
import 'package:clean_architecture_cli/src/create_structure/directory_creator/directory_creator_impl.dart';

import 'command_interface.dart';

class GenerateCommand implements CommandInterface {
  @override
  Future<void> execute() async {
    stdout.writeln('Generating...');

    final directoryCreator = DirectoryCreatorImpl();

    final creator =
        CleanArchitectureCreatorImpl(directoryCreator: directoryCreator);

    return creator.create();
  }
}
