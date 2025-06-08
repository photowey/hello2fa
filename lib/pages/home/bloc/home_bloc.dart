import 'dart:async';

import 'package:hello2fa/core/bloc/bloc_provider.dart';
import 'package:hello2fa/core/enums/screen.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  final StreamController<String> _titleController = BehaviorSubject<String>();
  final StreamController<Screen> _screenController = BehaviorSubject<Screen>();

  Stream<String> get title => _titleController.stream;

  Stream<Screen> get screens => _screenController.stream;

  @override
  void dispose() {
    _titleController.close();
    _screenController.close();
  }

  void updateTitle(String title) {
    _titleController.sink.add(title);
  }

  void updateScreen(Screen screenType) {
    _screenController.sink.add(screenType);
  }
}
