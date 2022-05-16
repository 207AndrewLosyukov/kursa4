import 'dart:async';
import 'package:courses_app/bloc_architecture/bloc_code/code_handle_action_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_events.dart';

class CodeBloc extends BlocBase with CodeHandleActionEvent {
  // данные Bloc-а

  final StreamController<CodeBlocEvent> _eventController =
      StreamController<CodeBlocEvent>();

  Sink<CodeBlocEvent> get inEvent => _eventController.sink;
  Stream<CodeBlocEvent> get _outEvent => _eventController.stream;

  CodeBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
  }

  void _handleEvent(CodeBlocEvent event) {
    switch (event.runtimeType) {
      case OnSendCodeClick:
        handleOnSendCodeClickEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }
}
