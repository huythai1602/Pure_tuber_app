import 'package:flutter/material.dart';
import 'package:pure_tuber_app/screens/home_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:pure_tuber_app/screens/dumb_data.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  const VideoPlayerScreen({super.key, required this.data});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late List<Map> videoData;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.data['videoId'],
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => {},
          ),
          builder: (context, player) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                player,
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.data['videoTitle'],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.playlist_add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const Text(
                            'Thêm vào',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.headphones,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const Text(
                            'Nền',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.featured_video,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const Text(
                            'Trình phát nổi',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const Text(
                            'Chia sẻ',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFFe2e2e3)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(widget.data['authorImage'])),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.data['author'],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFFe2e2e3)),
                ),
              ],
            );
          }),
    );
  }
}
