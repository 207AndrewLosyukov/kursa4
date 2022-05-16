import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/item.dart';

class Article extends Item {
  Article(String id, String title, String section, String text, String author,
      List<String> tags, String coverImage)
      : super(id, title, section, text, author, tags, coverImage);

  static Article parse(DocumentSnapshot<Map<String, dynamic>> data) {
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
    return Article(data['id'], data['title'], data['section'], data['text'],
        data['author'], data['tags'], data['coverImage']);
  }

  static List<Article> parseAll(QuerySnapshot querySnapshot) {
    final List<Article> articles = [];
    for (var data in querySnapshot.docs) {
      articles.add(Article(
          data['id'],
          data['title'],
          data['section'],
          data['text'],
          data['author'],
          (data['tags'] as List).map((item) => item as String).toList(),
          data['coverImage']));
    }
    return articles;
  }
}
