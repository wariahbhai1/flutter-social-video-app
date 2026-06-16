import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/navigation_controller.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/search_screen.dart';
import 'views/screens/create_screen.dart';
import 'views/screens/dashboard_screen.dart';
import 'views/screens/profile_screen.dart';
import 'constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationController()),
      ],
      child: MaterialApp(
        title: 'Social Video App',
        theme: AppTheme.darkTheme,
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

/// Main App Shell with Bottom Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Listen to navigation changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NavigationController>().addListener(() {
        _pageController.jumpToPage(
          context.read<NavigationController>().currentIndex,
        );
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationController>(
        builder: (context, navController, _) {
          return Stack(
            children: [
              // Page View for Screens
              PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const HomeScreen();
                    case 1:
                      return const SearchScreen();
                    case 2:
                      return const CreateScreen();
                    case 3:
                      return const DashboardScreen();
                    case 4:
                      return const ProfileScreen();
                    default:
                      return const HomeScreen();
                  }
                },
              ),
              // Floating Bottom Navigation Bar
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: _buildFloatingNavBar(context),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Build Translucent Floating Bottom Navigation Bar
  Widget _buildFloatingNavBar(BuildContext context) {
    final navController = context.watch<NavigationController>();
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.7),
        border: Border.all(
          color: AppTheme.neonCyan.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.neonPurple.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Home Tab
          _navBarItem(
            icon: Icons.home_rounded,
            label: 'Home',
            isActive: navController.currentIndex == 0,
            onTap: () => navController.setIndex(0),
          ),
          // Search Tab
          _navBarItem(
            icon: Icons.search_rounded,
            label: 'Search',
            isActive: navController.currentIndex == 1,
            onTap: () => navController.setIndex(1),
          ),
          // Create Tab (Center - Larger)
          GestureDetector(
            onTap: () => navController.setIndex(2),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppTheme.neonPurple, AppTheme.neonCyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.neonPurple.withOpacity(0.6),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          // Dashboard Tab
          _navBarItem(
            icon: Icons.analytics_rounded,
            label: 'Dashboard',
            isActive: navController.currentIndex == 3,
            onTap: () => navController.setIndex(3),
          ),
          // Profile Tab
          _navBarItem(
            icon: Icons.person_rounded,
            label: 'Profile',
            isActive: navController.currentIndex == 4,
            onTap: () => navController.setIndex(4),
          ),
        ],
      ),
    );
  }

  /// Navigation Bar Item Widget
  Widget _navBarItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? AppTheme.neonCyan : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isActive ? AppTheme.neonCyan : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
