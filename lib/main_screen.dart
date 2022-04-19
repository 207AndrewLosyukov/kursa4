import 'package:flutter/material.dart';
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
  openPodcastPage() => setState(() => currentTab = 1);
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
        color: Colors.orange[100],
        // child: AnimatedSwitcher(
        //   duration: const Duration(milliseconds: 200),
        //   child: <Widget>[
        //     // const HomePage(),
        //     // const PodcastPage(),
        //     // const ProfilePage(),
        //   ][currentTab],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int i) {
          setState(() => currentTab = i);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: iconSize,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: iconSize,
            ),
            label: 'Podcast',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: iconSize,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
