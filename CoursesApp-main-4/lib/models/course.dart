import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/item.dart';

import 'lesson.dart';

class Course extends Item {
  final List<Lesson> lessons;
  Course(
    String id,
    String title,
    String section,
    String text,
    String author,
    List<String> tags,
    String coverImage,
    this.lessons,
  ) : super(id, title, section, text, author, tags, coverImage);

  static parse(DocumentSnapshot<Map<String, dynamic>> data) {
    // mock
    // if (data.hasError) {
    //   return Text("Something went wrong");
    // }

    // if (snapshot.hasData && !snapshot.data!.exists) {
    //   return Text("Document does not exist");
    // }

    // if (snapshot.connectionState == ConnectionState.done) {
    //   Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    //   return Text("Full Name: ${data['full_name']} ${data['last_name']}");
    // }

    // return Text("loading");
    return Course(data['id'], data['title'], data['section'], data['text'],
        data['author'], data['tags'], data['coverImage'], Lesson.parseAll(data['lessons']));
  }

  static List<Course> parseAll(QuerySnapshot querySnapshot) {
    final List<Course> articles = [];
    for (var data in querySnapshot.docs) {
      articles.add(Course(
        data['id'],
        data['title'],
        data['section'],
        data['text'],
        data['author'],
        (data['tags'] as List).map((item) => item as String).toList(),
        data['coverImage'],
        // to do!
        Lesson.parseAll(data['lessons']),
      ));
    }
    return articles;
  }
}
