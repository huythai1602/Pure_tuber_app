import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pure_tuber_app/screens/dumb_data.dart';
import 'package:pure_tuber_app/screens/video_play_screen.dart';

class TabBarViewYT extends StatefulWidget {
  final Map<String, dynamic> data;
  const TabBarViewYT({super.key, required this.data});

  @override
  State<TabBarViewYT> createState() => _TabBarViewYTState();
}

class _TabBarViewYTState extends State<TabBarViewYT> {
  String key = 'AIzaSyAqO8zii82u659wBcXJRxpDt_GsqEHW6-0';
  late List<Map> videoData;
  late String videoTitle;
  late String videoThumbs;

  @override
  void initState() {
    videoData = widget.data['listVideos'] as List<Map>;
    videoThumbs = widget.data['videoThumbs'];
    log(videoData.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(
                    data: videoData[index],
                  )),
        ),
        child: Column(
          children: [
            Container(
              child: Image.asset(videoData[index]['videoThumbs']),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoData[index]['videoTitle'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Text(
                    videoData[index]['author'],
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      itemCount: videoData.length,
    );
  }
}
