import 'package:courses_app/dependencies.dart';

mixin AuthHandleActionEvent {
  void handleOnClickStartEvent() {
    Dependencies.instance.navigator.openMainScreen();
    print('d');
  }

  void handleOnClickCreateEvent() {
    Dependencies.instance.navigator.openRegisterPage();
  }
}
