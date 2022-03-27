import 'dart:async';

abstract class CommandInterface {
  FutureOr<void> execute();
}
