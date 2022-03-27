import 'dart:io';

import 'command_interface.dart';

class HelpCommand implements CommandInterface {
  @override
  Future<void> execute() async {
    stdout.writeln('Help Command in console');

    exit(0);
  }
}
