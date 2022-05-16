import 'dart:async';
import 'package:courses_app/bloc_architecture/bloc_auth/auth_handle_action_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_events.dart';

class AuthBloc extends BlocBase with AuthHandleActionEvent {
  // данные Bloc-а

  final StreamController<AuthBlocEvent> _eventController =
      StreamController<AuthBlocEvent>();

  Sink<AuthBlocEvent> get inEvent => _eventController.sink;
  Stream<AuthBlocEvent> get _outEvent => _eventController.stream;

  AuthBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
  }

  void _handleEvent(AuthBlocEvent event) {
    switch (event.runtimeType) {
      case OnClickStart:
        handleOnClickStartEvent();
        break;
      case OnClickCreate:
        handleOnClickCreateEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }
}
