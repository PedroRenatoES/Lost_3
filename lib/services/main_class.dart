class Comment {
  final String id;
  final String user; // ID del usuario
  final String post; // ID del post
  final String content;
  final String createdAt;

  Comment({
    required this.id,
    required this.user,
    required this.post,
    required this.content,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      post: json['post'] ?? '',
      content: json['content'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }
}

class LostItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final bool found;
  final String createdAt;

  LostItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.found,
    required this.createdAt,
  });

  factory LostItem.fromJson(Map<String, dynamic> json) {
    return LostItem(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      found: json['found'] ?? false,
      createdAt: json['createdAt'] ?? '',
    );
  }
}

class Post {
  final String id;
  final String user; // ID del usuario
  final LostItem lostItem;
  final String status;
  final String createdAt;

  Post({
    required this.id,
    required this.user,
    required this.lostItem,
    required this.status,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      lostItem: LostItem.fromJson(json['lostItem']),
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }
}
