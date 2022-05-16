import 'dart:async';
import 'package:courses_app/bloc_architecture/bloc_register/register_handle_action_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_events.dart';

class RegisterBloc extends BlocBase with RegisterHandleActionEvent {
  // данные Bloc-а

  final StreamController<RegisterBlocEvent> _eventController =
      StreamController<RegisterBlocEvent>();

  Sink<RegisterBlocEvent> get inEvent => _eventController.sink;
  Stream<RegisterBlocEvent> get _outEvent => _eventController.stream;

  RegisterBloc() : super(null) {
    // подписываемся на поток
    // здесь обрабатываются события, пришедшие со стороны UI
    _outEvent.listen(_handleEvent);
  }

  @override
  void dispose() {
    // здесь мы закрываем открытые контроллеры
    _eventController.close();
  }

  void _handleEvent(RegisterBlocEvent event) {
    switch (event.runtimeType) {
      case OnSendClick:
        handleOnSendClickEvent();
        break;
      default:
        // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
        assert(false, "Should never reach there");
        break;
    }
  }
}
