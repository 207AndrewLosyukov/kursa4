import 'package:cloud_firestore/cloud_firestore.dart';

class Podcast {
  final String id;
  final String title;
  final String info;
  final String section;
  final String author;
  //final List<String> tags;
  //final String text;
  final String coverImage;
  final String audio;

  Podcast(this.id, this.title, this.info /*, this.tags*/, this.section,
     this.author, this.coverImage, this.audio);

  static parse(DocumentSnapshot<Map<String, dynamic>> data) {
    return Podcast(data['id'], data['title'], data['info'], data['section'],
        data['author'], data['coverImage'], data['audio']);
  }

  static List<Podcast> parseAll(QuerySnapshot querySnapshot) {
    final List<Podcast> podcasts = [];
    for (var data in querySnapshot.docs) {
      podcasts.add(Podcast(
          data['id'],
          data['title'],
          data['info'],
          data['section'],
          data['author'],
          data['coverImage'],
          data['audio']));
    }
    return podcasts;
  }
}
