import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/course.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:courses_app/pages/articlepage.dart';
import 'package:courses_app/pages/coursepage.dart';
import 'package:courses_app/pages/favoritespage.dart';
import 'package:courses_app/pages/mockpage.dart';
import 'package:courses_app/pages/passedpage.dart';
import 'package:courses_app/pages/playerpage.dart';
import 'package:courses_app/pages/podcastpage.dart';
import 'package:courses_app/pages/profilepage.dart';
import 'package:courses_app/pages/registerpage.dart';
import 'package:courses_app/pages/searchpage.dart';
import 'package:courses_app/pages/searchpodcastpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:courses_app/navigator_panel/main_panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_architecture/bloc_profile/profile_bloc.dart';
import '../bloc_architecture/bloc_register/register_bloc.dart';
import '../pages/coursepage.dart';

class AppNavigator {
  // Глобальный навигатор
  static final navigatorKey = GlobalKey<NavigatorState>();

  // Локальный навигатор для главного экрана для переключения нижней менюшки
  static final bottomBarKey = GlobalKey<MainScreenState>();

  // Локальный навигатор - методы
  openHomePage() => bottomBarKey.currentState?.openHomePage();
  openPodcastsPage() => bottomBarKey.currentState?.openPodcastsPage();
  openProfilePage() => bottomBarKey.currentState?.openProfilePage();

  // Глобальный навигатор - методы

  // метод ошибки
  // openErrorPage() => navigatorKey.currentState
  //         ?.pushReplacement(MaterialPageRoute(builder: (context) {
  //       return const ErrDaoNoConnection();
  //     }));

  // openAuthPage() => navigatorKey.currentState?.push(MaterialPageRoute(
  //       builder: (context) => const AuthScreen(),
  //     ));

  openPlayerPage() => navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => PlayerPage(), fullscreenDialog: true));

  openCoursePage(Course course) =>
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => CoursePage(
          course: course,
        ),
      ));

  openPodcastPage() => navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => const PodcastPage(),
      ));

  openArticlePage(Article article) =>
      navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => ArticlePage(
          article: article,
        ),
      ));

  // openArticlePage() => navigatorKey.currentState?.push(MaterialPageRoute(
  // builder: (context) => PresentationWidget(),
  // ));

  // вроде костыльный метод для открытия главной страницы
  // replaceMainPage() {
  //   navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
  //     builder: (context) => const MainScreen(),
  //   ));
  // }

  // для открытия меню поиска
  // openSearch() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const SearchScreen(),
  //   ));
  // }

  // для открытия курса
  // openCourse() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const CourseScreen(),
  //   ));
  // }

  // для открытия подкаста
  // openPodcast() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const PodcastScreen(),
  //   ));
  // }

  // для открытия статьи
  // openArticle() {
  //   navigatorKey.currentState?.push(MaterialPageRoute(
  //     builder: (context) => const ArticleScreen(),
  //   ));
  // }

  pop() {
    return navigatorKey.currentState?.pop();
  }

  void openSearchPage() {
    navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) => const SearchPage(),
    ));
  }

  void openSearchPodcastPage() {}

  void openFavoritePage() => navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => const FavoritesPages(),
        fullscreenDialog: true,
      ));

  void openPassedPage() {}

  void openCodePage() {}

  void openMainScreen() => navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => const MainScreen(),
        fullscreenDialog: true,
      ));

  void openRegisterPage() => navigatorKey.currentState?.push(MaterialPageRoute(
        builder: (context) => BlocProvider(
          child: CreateScreen(),
          create: (BuildContext context) => RegisterBloc(),
        ),
        fullscreenDialog: true,
      ));
}
