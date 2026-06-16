import 'package:flutter/foundation.dart';
import '../models/video_model.dart';

/// Video Controller for managing video state and playback
class VideoController extends ChangeNotifier {
  int _currentIndex = 0;
  late List<VideoModel> _videos;

  VideoController() {
    _initializeVideos();
  }

  int get currentIndex => _currentIndex;
  List<VideoModel> get videos => _videos;

  /// Initialize mock video data
  void _initializeVideos() {
    _videos = List.generate(
      10,
      (index) => VideoModel(
        id: 'video_$index',
        title: 'Amazing Content ${index + 1}',
        creator: 'Creator ${index + 1}',
        creatorHandle: '@creator_${index + 1}',
        creatorAvatar: _getAvatar(index),
        videoUrl: '',
        thumbnailUrl: '',
        likes: (index + 1) * 1000 + 500,
        comments: (index + 1) * 200 + 50,
        shares: (index + 1) * 150 + 30,
        views: (index + 1) * 50000 + 10000,
        isLiked: false,
        isSaved: false,
        description: 'This is an amazing video with lots of great content to watch and enjoy!',
        hashtags: [
          '#trending',
          '#viral',
          '#reels',
          '#awesome',
          '#must_watch',
        ],
        uploadedAt: DateTime.now().subtract(Duration(days: index)),
      ),
    );
  }

  /// Get emoji avatar for creator
  String _getAvatar(int index) {
    final avatars = ['🎬', '🎵', '💪', '🎨', '🍕', '✈️', '📸', '🎮', '📚', '🏋️'];
    return avatars[index % avatars.length];
  }

  /// Set current page index
  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  /// Toggle like on video
  void toggleLike(int index) {
    if (index >= 0 && index < _videos.length) {
      final video = _videos[index];
      _videos[index] = video.copyWith(
        isLiked: !video.isLiked,
        likes: video.isLiked ? video.likes - 1 : video.likes + 1,
      );
      notifyListeners();
    }
  }

  /// Toggle save on video
  void toggleSave(int index) {
    if (index >= 0 && index < _videos.length) {
      final video = _videos[index];
      _videos[index] = video.copyWith(
        isSaved: !video.isSaved,
      );
      notifyListeners();
    }
  }

  /// Play video at index
  void playVideo(int index) {
    if (index >= 0 && index < _videos.length) {
      // Video play logic will be integrated with video_player plugin
      debugPrint('Playing video at index: $index');
    }
  }

  /// Pause video at index
  void pauseVideo(int index) {
    if (index >= 0 && index < _videos.length) {
      // Video pause logic will be integrated with video_player plugin
      debugPrint('Pausing video at index: $index');
    }
  }

  /// Add new video to feed
  void addVideo(VideoModel video) {
    _videos.insert(0, video);
    notifyListeners();
  }

  /// Remove video from feed
  void removeVideo(int index) {
    if (index >= 0 && index < _videos.length) {
      _videos.removeAt(index);
      notifyListeners();
    }
  }

  /// Get video by ID
  VideoModel? getVideoById(String id) {
    try {
      return _videos.firstWhere((video) => video.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Update video
  void updateVideo(int index, VideoModel video) {
    if (index >= 0 && index < _videos.length) {
      _videos[index] = video;
      notifyListeners();
    }
  }

  /// Reset controller
  void reset() {
    _currentIndex = 0;
    _initializeVideos();
    notifyListeners();
  }
}
