import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pure_tuber_app/screens/my_account_screen.dart';
import 'package:pure_tuber_app/screens/my_videos_screen.dart';
import 'package:pure_tuber_app/widgets/tab_view_yt.dart';
import 'package:pure_tuber_app/screens/dumb_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List<Widget> bodies;
  late YoutubePlayerController controller;
  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void initState() {
    bodies = [
      _buildHomeTab(),
      const MyVideoScreen(),
      const MyAccountScreen(),
    ];
    super.initState();

    const url = 'https://www.youtube.com/watch?v=PzDbSVH-aMs';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
        hideControls: false,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: _selectedIndex == 2
            ? null
            : AppBar(
                backgroundColor: Colors.black,
                elevation: 0,
                title: SizedBox(
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 35 / 2),
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
                leadingWidth: 100,
                leading: Image.asset(
                  'assets/images/pure_tuber_icon.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
        body: bodies[_selectedIndex],
        bottomNavigationBar: BottomBar(
            backgroundColor: Colors.black,
            selectedIndex: _selectedIndex,
            onTap: (value) {
              return setState(() {
                _selectedIndex = value;
              });
            },
            items: const <BottomBarItem>[
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

  Widget _buildHomeTab() {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.green,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Đặc tính',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Xu hướng',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Âm nhạc',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Trò chơi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Phim ảnh',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              children: [
                TabBarViewYT(data: dataDumb[0]),
                TabBarViewYT(data: dataDumb[1]),
                TabBarViewYT(data: dataDumb[2]),
                TabBarViewYT(data: dataDumb[3]),
                TabBarViewYT(data: dataDumb[4]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
