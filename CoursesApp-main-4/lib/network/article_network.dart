import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/article.dart';

class ArticleNetwork {
  ArticleNetwork();

  CollectionReference articles =
      FirebaseFirestore.instance.collection('articles');

  Future<void> addArticleToDb(Article article) {
    return articles
        .add({
          'author': article.id,
          'coverImage': article.coverImage,
          'id': article.id,
          'section': article.section,
          'text': article.text,
          'title': article.title,
        })
        .then((value) => print("Article Added"))
        .catchError((error) => print("Failed to add article: $error"));
  }

  Future<Article> getArticleFromDb(String id) async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection("articles")
        .doc(id)
        .get(); //get the data
    return Article.parse(data);
  }

  Future<List<Article>> getAllArticlesFromDb() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('articles').get();
    return Article.parseAll(querySnapshot);
  }
}
