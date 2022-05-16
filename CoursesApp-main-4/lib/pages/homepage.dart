import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/bloc_architecture/bloc_home/home_bloc.dart';
import 'package:courses_app/bloc_architecture/bloc_home/home_events.dart';
import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/item.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/course.dart';

final styleTags = [
  'Тело',
  'Медитация',
  'Общество',
  'Здоровье',
  'Отношения',
  'Отдых',
  'Буратино',
  'Дельфины',
  'Пионеры',
  'Подкасты',
  'Статьи'
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> resList = Dependencies.instance.articles;
  List<Item> courseList = Dependencies.instance.courses;

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22,
                        top: 6,
                        bottom: 6,
                      ),
                      child: CircleAvatar(
                          backgroundColor: Color(0xFFEC407A),
                          radius: 36,
                          child: ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: Ink.image(
                                image: CachedNetworkImageProvider(Dependencies
                                    .instance.actualUser.coverImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text(
                              "Добрый день, ${Dependencies.instance.actualUser.name}!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  bloc.inEvent.add(OnClickProfileAction()),
                              child: const Text.rich(
                                TextSpan(
                                  text: 'Перейти в профиль',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFEC407A),
                                    //fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 24,
                      icon: Icon(Icons.search),
                      color: Color(0xFFEC407A),
                      onPressed: () {
                        bloc.inEvent.add(OnPressSearchAction());
                      },
                      // label: const Text('Поиск'),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 19),
              child: Container(
                height: 67.0,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: styleTags.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Material(
                          child: InkWell(
                              //onTap: () {},
                              child: Stack(
                            children: [
                              GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border:
                                        Border.all(color: Color(0xFFEC407A)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.home,
                                        color: Color(0xFFEC407A),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              /*child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFFEC407A),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              
                              /*child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                ),
                              ),*/
                            ),*/
                              ),
                        );
                      } else {
                        return Material(
                          child: InkWell(
                            //onTap: () {},
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(color: Color(0xFFEC407A)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(styleTags[index - 1],
                                      style: const TextStyle(
                                        color: Color(0xFFEC407A),
                                        fontSize: 14,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0, top: 20, bottom: 10),
                child: Container(
                  child: const Text.rich(
                    TextSpan(
                      text: 'Рекомендованные статьи и курсы',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 180,
                          //padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Dependencies.instance.articles.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: PresentationWidget(
                                      resList[index], index + 100),
                                  onTap: () {
                                    if (resList[index].runtimeType == Article) {
                                      return bloc.inEvent.add(
                                          OnPressContentItemAction(
                                              article:
                                                  resList[index] as Article));
                                    } else {
                                      return bloc.inEvent.add(
                                          OnPressCourseItemAction(
                                              course:
                                                  resList[index] as Course));
                                    }
                                  },
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
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
                      return buildTab(courseList, bloc);
                    } else if (currentTab == 1) {
                      return buildTab(resList, bloc);
                    } else {
                      return buildTab(resList, bloc);
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

  Widget buildTab(List<Item> products, HomeBloc bloc) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return GestureDetector(
              child: PresentationWidget(products[i], i),
              onTap: () {
                if (products[i].runtimeType == Article) {
                  return bloc.inEvent.add(OnPressContentItemAction(
                      article: products[i] as Article));
                } else {
                  return bloc.inEvent.add(
                      OnPressCourseItemAction(course: products[i] as Course));
                }
              });
        },
        childCount: products.length,
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
