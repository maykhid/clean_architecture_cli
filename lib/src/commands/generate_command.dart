import 'dart:io';

import 'command_interface.dart';

class GenerateCommand implements CommandInterface {

  @override
  Future<void> execute() async{
    stdout.write('GenerateCommand');

    exit(0);
  }
}