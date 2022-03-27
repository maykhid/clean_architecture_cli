import 'dart:io';

import 'command_interface.dart';

class GenerateCommand implements CommandInterface {

  @override
  Future<void> execute() async{
    stdout.writeln('Generate Command in console');

    exit(0);
  }
}