import 'dart:io';

import 'create_structure/creator_interfaces.dart';

class CleanArchitectureCreatorImpl
    implements CleanArchitectureCreatorInterface {
  final DirectoryCreatorInterface directoryCreator;

  CleanArchitectureCreatorImpl({required this.directoryCreator});

  @override
  Future<void> create() async{
   final result = await directoryCreator.createDirectories();

   if(result) {
     stderr.writeln('Folders generated!');
   } else {
     stderr.writeln('Folders creation failed!');
   }
  }
}
