import 'package:courses_app/dependencies.dart';

mixin ProfileHandleActionEvent {
  void handleOnClickFavouriteEvent() {
    Dependencies.instance.navigator.openFavoritePage();
  }

  void handleOnClickPassedEvent() {
    Dependencies.instance.navigator.openPassedPage();
  }
}
