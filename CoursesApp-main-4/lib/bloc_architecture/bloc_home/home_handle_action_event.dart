import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/article.dart';
import 'package:courses_app/network/user_network.dart';

import '../../models/course.dart';

mixin HomeHandleActionEvent {
  void handleContentItemActionEvent(Article article) {
    Dependencies.instance.navigator.openArticlePage(article);
  }

  void handleCourseItemActionEvent(Course course) {
    Dependencies.instance.navigator.openCoursePage(course);
  }

  void handleSearchEvent() {
    print("lol");
    Dependencies.instance.navigator.openSearchPage();
  }

  void handleOnSelectFilterActionEvent() {}

  void handleOnClickProfileActionEvent() {
    Dependencies.instance.navigator.openProfilePage();
  }

  void handleLoadContentActionEvent() {}
}
