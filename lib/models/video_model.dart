/// Model class for Video data
class VideoModel {
  final String id;
  final String title;
  final String creator;
  final String creatorHandle;
  final String creatorAvatar;
  final String videoUrl;
  final String thumbnailUrl;
  final int likes;
  final int comments;
  final int shares;
  final int views;
  final bool isLiked;
  final bool isSaved;
  final String description;
  final List<String> hashtags;
  final DateTime uploadedAt;

  VideoModel({
    required this.id,
    required this.title,
    required this.creator,
    required this.creatorHandle,
    required this.creatorAvatar,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.views,
    this.isLiked = false,
    this.isSaved = false,
    required this.description,
    required this.hashtags,
    required this.uploadedAt,
  });

  /// Copy with method for immutable updates
  VideoModel copyWith({
    String? id,
    String? title,
    String? creator,
    String? creatorHandle,
    String? creatorAvatar,
    String? videoUrl,
    String? thumbnailUrl,
    int? likes,
    int? comments,
    int? shares,
    int? views,
    bool? isLiked,
    bool? isSaved,
    String? description,
    List<String>? hashtags,
    DateTime? uploadedAt,
  }) {
    return VideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      creator: creator ?? this.creator,
      creatorHandle: creatorHandle ?? this.creatorHandle,
      creatorAvatar: creatorAvatar ?? this.creatorAvatar,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      shares: shares ?? this.shares,
      views: views ?? this.views,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      description: description ?? this.description,
      hashtags: hashtags ?? this.hashtags,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'creator': creator,
      'creatorHandle': creatorHandle,
      'creatorAvatar': creatorAvatar,
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'views': views,
      'isLiked': isLiked,
      'isSaved': isSaved,
      'description': description,
      'hashtags': hashtags,
      'uploadedAt': uploadedAt.toIso8601String(),
    };
  }

  /// Create from JSON
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      creator: json['creator'] ?? '',
      creatorHandle: json['creatorHandle'] ?? '',
      creatorAvatar: json['creatorAvatar'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      shares: json['shares'] ?? 0,
      views: json['views'] ?? 0,
      isLiked: json['isLiked'] ?? false,
      isSaved: json['isSaved'] ?? false,
      description: json['description'] ?? '',
      hashtags: List<String>.from(json['hashtags'] ?? []),
      uploadedAt: json['uploadedAt'] != null
          ? DateTime.parse(json['uploadedAt'])
          : DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'VideoModel(id: $id, title: $title, creator: $creator, likes: $likes, views: $views)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
