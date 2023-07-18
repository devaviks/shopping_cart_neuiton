class Post {
  final String content;
  final String mediaUrl;
  final PostType type;
  final DateTime timestamp;
  int likes;
  bool isLiked;

  Post({
    required this.content,
    required this.mediaUrl,
    required this.type,
    required this.timestamp,
    this.likes = 0,
    this.isLiked = false,
  });
}

enum PostType {
  Text,
  Image,
  Video,
}