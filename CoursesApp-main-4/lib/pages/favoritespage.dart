import 'package:courses_app/bloc_architecture/bloc_home/home_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_home/home_events.dart';
import 'package:courses_app/bloc_architecture/bloc_profile/profile_bloc.dart';
import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/course.dart';
import 'package:courses_app/models/item.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPages extends StatefulWidget {
  const FavoritesPages({Key? key}) : super(key: key);

  @override
  State<FavoritesPages> createState() => _FavoritesPagesState();
}

class _FavoritesPagesState extends State<FavoritesPages> {
  // List<Item> resList = DUMMY_DATA;
  // List<Item> courseList = MUMMY_DATA;
  List<Item> resList = Dependencies.instance.courses;
  List<Item> courseList = Dependencies.instance.courses;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'Вам понравилось',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    onPressed: () {
                      Dependencies.instance.navigator.pop();
                      ;
                    },
                  );
                },
              ),
            ),
            SliverAppBar(
              toolbarHeight: 16,
              pinned: true,
              backgroundColor: Colors.white,
              bottom: TabBar(
                // isScrollable: true,
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(22, 0, 2, 10),
                labelColor: Color(0xFFEC407A),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.circular(28)),
                tabs: [
                  Tab(text: 'Курсы'),
                  Tab(text: 'Статьи'),
                  Tab(text: 'Микс')
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              sliver: Builder(builder: (context) {
                final tabController = DefaultTabController.of(context);
                if (tabController == null) {
                  return const SliverToBoxAdapter(child: SizedBox());
                }
                return AnimatedBuilder(
                  animation: tabController,
                  builder: (context, i) {
                    final currentTab = tabController.index;
                    if (currentTab == 0) {
                      return buildTab(courseList);
                    } else if (currentTab == 1) {
                      return buildTab(resList);
                    } else {
                      return buildTab(resList);
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab(List<Item> products) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return GestureDetector(
              child: PresentationWidget(products[i], i), onTap: () {});
          //=> bloc.inEvent
          //.add(OnPressContentItemAction(article: products[i])));
        },
        childCount: 3,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 2,
        childAspectRatio: 4 / 4,
      ),
    );
  }
}
