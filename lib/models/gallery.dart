class Gallery {
  final int id;
  final String title;
  final String content;
  final String type;
  final String image;
  final List<String> media;

  const Gallery({
    this.id = 0,
    this.title = '',
    this.content = '',
    this.type = '',
    this.image = '',
    this.media = const <String>[],
  });

  factory Gallery.fromJson(Map<String, dynamic> map) {
    return Gallery(
        id: map['id'] ?? 0,
        title: map['title'] ?? '',
        content: map['content'] ?? '',
        type: map['type'] ?? '',
        image: map['image'] ?? '',
        media: List<String>.from(map['media'] ?? <String>[]));
  }
}
