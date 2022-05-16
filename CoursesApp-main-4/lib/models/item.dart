class Item {
  final String id;
  final String title;
  final String section;
  final String author;
  final List<String> tags;
  final String text;
  final String coverImage;

  Item(this.id, this.title, this.section /*, this.tags*/, this.text,
      this.author, this.tags, this.coverImage);
}
