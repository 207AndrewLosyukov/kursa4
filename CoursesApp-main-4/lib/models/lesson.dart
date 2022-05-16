class Lesson {
  final String id;
  final String title;
  final String author;
  final String coverImage;
  final List<String> images;
  final List<String> videos;
  final List<String> texts;

  Lesson(this.id, this.title, this.author /*, this.tags*/, this.texts,
      this.images, this.videos, this.coverImage);

  static parseAll(Map<String, dynamic> data) {
    List<Lesson> lessons = [];
    for (var lesson in data.keys) {
      lessons.add(Lesson(
        data[lesson]!['id']!,
        data[lesson]!['title']!,
        data[lesson]!['author']!,
        (data[lesson]!['texts']! as List)
            .map((item) => item as String)
            .toList(),
        (data[lesson]!['images']! as List)
            .map((item) => item as String)
            .toList(),
        (data[lesson]!['videos']! as List)
            .map((item) => item as String)
            .toList(),
        data[lesson]!['coverImage']!,
      ));
    }
    return lessons;
  }
}
