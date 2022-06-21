class Gallery {
  final String id;
  final String title;
  final String content;
  final String type;
  final String image;
  final List<String> media;

  const Gallery({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.image,
    required this.media,
  });

  factory Gallery.fromJson(Map<String, dynamic> map) {
    return Gallery(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      type: map['type'] ?? '',
      image: map['image'] ?? '',
      media: map['media'] ?? <String>[],
    );
  }
}
