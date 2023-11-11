import 'package:flutter/material.dart';
import 'package:movies_app/UserInterface/Fragment/HomeView.dart';
import 'package:movies_app/UserInterface/Browse/Browse.dart';
import 'package:movies_app/UserInterface/Search/Search.dart';
import 'package:movies_app/UserInterface/WatchList/WatchList.dart';

enum Page {
  home,
  search,
  browse,
  watchlist,
}

class HomePage extends StatefulWidget {
  static const String routeName = "Homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Page currentPage = Page.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentPage = Page.values[index];
          });
        },
        currentIndex: currentPage.index,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.movie),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.bookmark),
            label: 'Watchlist',
          ),
        ],
      ),
      body: _buildPage(currentPage),
    );
  }

  Widget _buildPage(Page page) {
    switch (page) {
      case Page.home:
        return HomeTab();
      case Page.search:
        return Search();
      case Page.browse:
        return Browse();
      case Page.watchlist:
        return WatchList();
      default:
        return HomeTab();
    }
  }
}
