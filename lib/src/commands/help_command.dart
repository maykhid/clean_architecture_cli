import 'dart:io';

import 'command_interface.dart';

class HelpCommand implements CommandInterface {
  @override
  Future<void> execute() async {
    stdout.writeln('Usage: clean_architecture_cli <command>\n');

    stdout.writeln('Available commands:');
    stdout.writeln(
      'create        Create folder and file structure for Fluter Apps. ',
    );

    exit(0);
  }
}
