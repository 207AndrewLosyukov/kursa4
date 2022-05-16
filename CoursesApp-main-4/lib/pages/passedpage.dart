import 'package:courses_app/models/item.dart';
import 'package:courses_app/models/widgets/present_article.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';

class PassedPage extends StatefulWidget {
  const PassedPage({Key? key}) : super(key: key);

  @override
  State<PassedPage> createState() => _PassedPageState();
}

class _PassedPageState extends State<PassedPage> {
  // List<Item> resList = DUMMY_DATA;
  List<Item> resList = Dependencies.instance.courses;
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
                'Вы прошли',
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
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return GestureDetector(
                      child: PresentationWidget(resList[i], i),
                      onTap: () {
                        //bloc.inEvent
                        //.add(OnPressContentItemAction(article: products[i])));
                      });
                  //=> bloc.inEvent
                  //.add(OnPressContentItemAction(article: products[i])));
                },
                childCount: 2,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: 4 / 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
