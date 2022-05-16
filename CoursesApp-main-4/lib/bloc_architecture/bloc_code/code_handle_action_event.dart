import 'package:courses_app/dependencies.dart';

mixin CodeHandleActionEvent {
  void handleOnSendCodeClickEvent() {
    Dependencies.instance.navigator.openMainScreen();
  }
}
