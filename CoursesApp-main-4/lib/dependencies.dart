// import 'package:redux/redux.dart';
// import 'package:shop_flutter_app/data_api/auth_dao.dart';
// import 'package:shop_flutter_app/data_api/database_dao.dart';
// import 'package:shop_flutter_app/database/cart_dao.dart';
// import 'package:shop_flutter_app/database/init_hive.dart';
// import 'package:shop_flutter_app/network/dao.dart';
// import 'package:shop_flutter_app/redux/state.dart';
// import 'package:shop_flutter_app/redux/store.dart';
// import 'package:shop_flutter_app/screens/navigator.dart';

// import 'data_api/network_dao.dart';
// import 'database/auth_dao.dart';

import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/podcast.dart';
import 'package:courses_app/models/user.dart';
import 'package:courses_app/network/article_network.dart';
import 'package:courses_app/network/course_network.dart';
import 'package:courses_app/network/podcast_network.dart';
import 'package:courses_app/network/user_network.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/course.dart';
import 'navigator_panel/navigator.dart';

class Dependencies {
  // final ProductApiDao productsApi;
  // late final Store<GlobalState> store = MyStoreBuilder.build();
  final AppNavigator navigator;
  User actualUser;
  List<Article> articles;
  List<Podcast> podcasts;
  List<Course> courses;
  // final CartProductDao cartProductDao;
  // final AuthDao authDao;

  static late Dependencies _instance;
  Dependencies._(
    this.navigator,
    this.actualUser,
    this.articles,
    this.podcasts,
    this.courses,
    // , this.productsApi, this.cartProductDao, this.authDao
  );

  static Future<Dependencies> init() async {
    // final hiveBuilder = await HiveBuilder.build();
    // final cartProductDao = DatabaseApi(database: hiveBuilder.cartBox);
    // final authDao = AuthDaoApi(database: hiveBuilder.userBox);

    // ref = await FirebaseStorage.instance
    //     .ref()
    //     .child('IMG_0773.PNG')
    //     .getDownloadURL();
    return _instance = Dependencies._(
      AppNavigator(),

      await UserNetwork().getUserFromDb("1"),
      await ArticleNetwork().getAllArticlesFromDb(),
      await PodcastNetwork().getAllPodcastsFromDb(),
      await CourseNetwork().getAllCoursesFromDb(),
      // NetworkApi(),
      // cartProductDao,
      // authDao,
    );
  }

  // void initUser(String id) async {
  //   actualUser =
  // }

  static Dependencies get instance => _instance;
}
