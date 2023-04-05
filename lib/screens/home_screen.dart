import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: SizedBox(
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Tìm kiếm',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.grey,
              ),
            ),
          ),
          leading: Container(
            child: Image.asset(
              'assets/images/pure_tuber_icon.png',
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const TabBar(isScrollable: true, tabs: <Widget>[
                Tab(
                  child: Text('Đặc tính'),
                ),
                Tab(
                  child: Text('Xu hướng'),
                ),
                Tab(
                  child: Text('Âm nhạc'),
                ),
                Tab(
                  child: Text('Trò chơi'),
                ),
                Tab(
                  child: Text('Phim ảnh'),
                ),
              ]),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
            selectedIndex: _currentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => _currentPage = index);
            },
            items: <BottomBarItem>[
              BottomBarItem(
                icon: Icon(Icons.home),
                activeColor: Color(0xFF2bc849),
                title: Text('TRANG CHỦ'),
              ),
              BottomBarItem(
                icon: Icon(Icons.video_library),
                activeColor: Color(0xFF2bc849),
                title: Text('VIDEO CỦA TÔI'),
              ),
              BottomBarItem(
                icon: Icon(Icons.account_circle),
                activeColor: Color(0xFF2bc849),
                title: Text('TÔI'),
              ),
            ]),
      ),
    );
  }
}
