import 'package:flutter/foundation.dart';

/// Navigation Controller for Managing Bottom Navigation State
/// Uses Provider for state management
class NavigationController extends ChangeNotifier {
  int _currentIndex = 0;

  /// Get current selected tab index
  int get currentIndex => _currentIndex;

  /// Set tab index (0-4)
  void setIndex(int index) {
    if (index >= 0 && index <= 4) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  /// Go to Home tab
  void goToHome() {
    setIndex(0);
  }

  /// Go to Search tab
  void goToSearch() {
    setIndex(1);
  }

  /// Go to Create tab
  void goToCreate() {
    setIndex(2);
  }

  /// Go to Dashboard tab
  void goToDashboard() {
    setIndex(3);
  }

  /// Go to Profile tab
  void goToProfile() {
    setIndex(4);
  }

  /// Reset to Home
  void reset() {
    _currentIndex = 0;
    notifyListeners();
  }
}
