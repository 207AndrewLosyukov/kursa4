import 'package:courses_app/bloc_architecture/bloc_home/home_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_podcast/podcast_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_bloc.dart';
import 'package:courses_app/pages/homepage.dart';
import 'package:courses_app/pages/podcastpage.dart';
import 'package:courses_app/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop_flutter_app/screens/main/home_page.dart';
// import 'package:shop_flutter_app/screens/main/podcast_page.dart';
// import 'package:shop_flutter_app/screens/main/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  // текущий выбор в нижней менюшке
  int currentTab = 0;

  // Открытие главной страницы
  openHomePage() => setState(() => currentTab = 0);
  // Подкасты
  openPodcastsPage() => setState(() => currentTab = 1);
  // Профиль
  openProfilePage() => setState(() => currentTab = 2);

  @override
  Widget build(BuildContext context) {
    const iconSize = 28.0;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TabBar Widget'),
      // ),
      body: Container(
        color: Colors.white,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: <Widget>[
            BlocProvider(
              child: const HomePage(),
              create: (BuildContext context) => HomeBloc(),
            ),
            BlocProvider(
              child: const PodcastPage(),
              create: (BuildContext context) => PodcastBloc(),
            ),
            BlocProvider(
              child: const ProfilePage(),
              create: (BuildContext context) => ProfileBloc(),
            )
            // const PodcastPage(),
            // const ProfilePage(),
          ][currentTab],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(0xFFEC407A),
        currentIndex: currentTab,
        onTap: (int i) {
          setState(() => currentTab = i);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: iconSize,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.headphones_outlined,
              size: iconSize,
            ),
            label: 'Podcast',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: iconSize,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
