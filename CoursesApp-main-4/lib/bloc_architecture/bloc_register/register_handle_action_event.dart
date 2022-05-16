import 'package:courses_app/dependencies.dart';

mixin RegisterHandleActionEvent {
  void handleOnSendClickEvent() {
    Dependencies.instance.navigator.openCodePage();
  }
}
