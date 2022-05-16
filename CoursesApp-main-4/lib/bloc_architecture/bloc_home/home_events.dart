import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/course.dart';

import '../../models/course.dart';

abstract class HomeBlocEvent {}

class OnPressContentItemAction extends HomeBlocEvent {
  final Article article;
  OnPressContentItemAction({required this.article});
}

class OnPressCourseItemAction extends HomeBlocEvent {
  final Course course;
  OnPressCourseItemAction({required this.course});
}

class OnSelectFilterAction extends HomeBlocEvent {
  final String filter;
  OnSelectFilterAction({required this.filter});
}

class OnClickProfileAction extends HomeBlocEvent {
  OnClickProfileAction();
}

class OnPressSearchAction extends HomeBlocEvent {
  OnPressSearchAction();
}

class LoadContentAction extends HomeBlocEvent {
  LoadContentAction();
}

class LoadUserInfoAction extends HomeBlocEvent {
  LoadUserInfoAction();
}
