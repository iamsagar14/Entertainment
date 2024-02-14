import 'package:flutter/material.dart';
import 'package:ratamata/change_language.dart';
import 'package:ratamata/profileview.dart';
import 'package:ratamata/youtubeplayerpage.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;
  List<Widget> body = [
    const ChangeLanguage(),
    const YoutubePage(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Youtube',
            icon: Icon(
              Icons.youtube_searched_for,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
            ),
          )
        ],
      ),
      body: body[_currentIndex],
    );
  }
}
