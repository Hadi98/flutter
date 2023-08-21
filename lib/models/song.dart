class Song {
  final int id;
  final String title;
  final String thumbnailUrl;

  Song({required this.id, required this.title, required this.thumbnailUrl});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
