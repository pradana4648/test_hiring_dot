class Place {
  final int id;
  final String title;
  final String content;
  final String type;
  final String image;
  final List<String> media;

  const Place({
    this.id = 0,
    this.title = '',
    this.content = '',
    this.type = '',
    this.image = '',
    this.media = const <String>[],
  });

  factory Place.fromJson(Map<String, dynamic> map) {
    return Place(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      type: map['type'] ?? '',
      image: map['image'] ?? '',
      media: List<String>.from(map['media'] ?? <String>[]),
    );
  }
}
