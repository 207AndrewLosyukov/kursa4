import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/article.dart';
import 'package:courses_app/models/item.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:courses_app/network_api_reccomend.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Item> courseList = []; //DUMMY_DATA;
  List<Item> resList = []; //DUMMY_DATA;

  // (await NetworkApiReccomendPodsystem().searchCourse('Взгляни', '[]', '1')).body
  @override
  void initState() {
    super.initState();
    Dependencies.instance.courses.sort((a, b) => a.id.compareTo(b.id));
    onChanged('');
  }

  NetworkApiReccomendPodsystem rec = NetworkApiReccomendPodsystem();

  TextEditingController searchController = TextEditingController();

  void onChanged(e) async {
    List<int> t = [];
    var ids = (await rec.searchCourse(e, '[]', '1')).body.toString();
    print(ids);
    for (var i = 0; i < ids.length; i++) {
      if (ids[i].toString() == '0' ||
          ids[i].toString() == '1' ||
          ids[i].toString() == '2' ||
          ids[i].toString() == '3' ||
          ids[i].toString() == '4' ||
          ids[i].toString() == '5' ||
          ids[i].toString() == '6' ||
          ids[i].toString() == '7' ||
          ids[i].toString() == '8' ||
          ids[i].toString() == '9') {
        t.add(int.parse(ids[i]));
      }
    }

    var y = Dependencies.instance.courses;

    List<Item> o = [];

    for (var i in t) {
      o.add(y[int.parse(i.toString()) - 1]);
    }

    for (var i in o) {
      print(i.toString());
    }

    setState(() {
      courseList = o;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: TextField(
                controller: searchController,
                onChanged: onChanged,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Введите запрос',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEC407A)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                //keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 20, 0),
              child: TabBar(
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(22, 0, 2, 10),
                labelColor: Color(0xFFEC407A),
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFEC407A)),
                    borderRadius: BorderRadius.circular(28)),
                tabs: const [
                  Tab(text: 'Искать курсы'),
                  Tab(text: 'Искать статьи'),
                ],
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  final tabController = DefaultTabController.of(context);
                  if (tabController == null) {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                  return AnimatedBuilder(
                    animation: tabController,
                    builder: (context, i) {
                      final currentTab = tabController.index;
                      if (currentTab == 0 && courseList != null) {
                        return buildTab(courseList /*, bloc*/);
                      } else {
                        return buildTab(resList /*, bloc*/);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab(List<Item> products /*, HomeBloc bloc*/) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 1,
        childAspectRatio: 4 / 4,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
            child: PresentationWidget(products[i], i),
            onTap: () {
              if (products[i].runtimeType == Article) {
                /*return bloc.inEvent.add(OnPressContentItemAction(
                      article: products[i] as Article));*/
              } else {
                /*return bloc.inEvent.add(
                      OnPressCourseItemAction(course: products[i] as Course));*/
              }
            });
      },
    );
  }
}
