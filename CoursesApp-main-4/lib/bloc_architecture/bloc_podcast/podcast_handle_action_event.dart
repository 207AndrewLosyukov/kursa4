import 'package:courses_app/dependencies.dart';

mixin PodcastHandleActionEvent {
  void handleOnClickPodcastEvent() {
    Dependencies.instance.navigator.openPlayerPage();
  }

  void handleOnClickSearchPodcastEvent() {
    Dependencies.instance.navigator.openSearchPodcastPage();
  }
}
