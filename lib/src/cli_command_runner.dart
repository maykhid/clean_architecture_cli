import 'dart:io';

import 'package:args/args.dart';
import 'package:clean_architecture_cli/src/commands/command_interface.dart';

import 'commands/generate_command.dart';
import 'commands/help_command.dart';

class CliCommandRunner {
  void run(List<String> arguments) {
    final parser = ArgParser();
    parser.addCommand('help');
    parser.addCommand('generate');

    final results = parser.parse(arguments);

    if (results.command == null) {
      print('No command specified');
      return;
    }

    final commandName = results.command!.name;
    CommandInterface? command;

    switch (commandName) {
      case 'help':
        command = HelpCommand();
        break;
      case 'generate':
        command = GenerateCommand();
        break;
      default:
        _errorAndExit(commandName);
    }
    command!.execute();
  }
}

void _errorAndExit([String? command]) {
  stderr.writeln('Command not available!');
  stderr.writeln('try help');
  exit(2);
}
