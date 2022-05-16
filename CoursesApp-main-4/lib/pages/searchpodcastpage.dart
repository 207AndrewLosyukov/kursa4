
import 'package:courses_app/dependencies.dart';
import 'package:courses_app/models/item.dart';
import 'package:courses_app/models/widgets/present_podcast.dart';
import 'package:flutter/material.dart';

class SearchPodcastPage extends StatefulWidget {
  const SearchPodcastPage({Key? key}) : super(key: key);

  @override
  State<SearchPodcastPage> createState() => _SearchPodcastPageState();
}

class _SearchPodcastPageState extends State<SearchPodcastPage> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: TextField(
                controller: searchController,
                autofocus: true,
                decoration: InputDecoration(
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
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 38),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  crossAxisCount: 1,
                  childAspectRatio: 4 / 4,
                ),
                itemCount: Dependencies.instance.podcasts.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                      child: PresentPodcast(Dependencies.instance.podcasts[i], 230, 300, i),
                      onTap: () {});
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
