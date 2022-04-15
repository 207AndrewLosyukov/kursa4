import 'package:flutter/widgets.dart';
import 'package:kursa4/main_screen.dart';

class Navigator {
  
  // Глобальный навигатор
  static final navigatorKey = GlobalKey<NavigatorState>();
  // Локальный навигатор для главного экрана для переключения нижней менюшки
  static final bottomBarKey = GlobalKey<MainScreenState>();

  openMainPage() => bottomBarKey.currentState?.openMainPage();
  openPodcastPage() => bottomBarKey.currentState?.openPodcastPage();
  openProfilePage() => bottomBarKey.currentState?.openProfilePage();
}