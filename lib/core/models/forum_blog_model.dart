class ForumBlogModel {
  final String title;
  final String description;
  final String authorName;
  final String authorAvatar;
  final DateTime datePosted;
  final int likes;
  final int comments;
  final String content;

  ForumBlogModel({
    required this.title,
    required this.description,
    required this.authorName,
    required this.authorAvatar,
    required this.datePosted,
    required this.likes,
    required this.comments,
    required this.content,
  });
}
