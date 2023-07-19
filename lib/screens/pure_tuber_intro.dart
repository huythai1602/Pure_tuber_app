import 'package:flutter/material.dart';
import 'package:pure_tuber_app/screens/home_screen.dart';
import 'package:pure_tuber_app/screens/intro_screen.dart';
import 'package:pure_tuber_app/screens/intro_screen_2.dart';
import 'package:pure_tuber_app/screens/intro_screen_3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PureTuberIntro extends StatefulWidget {
  const PureTuberIntro({super.key});

  @override
  State<PureTuberIntro> createState() => _PureTuberIntroState();
}

class _PureTuberIntroState extends State<PureTuberIntro> {
  final isFirst = true;
  late final SharedPreferences prefs;
  final _controller = PageController();
  String _labelButton = 'Tiếp theo';
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => prefs = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                if (value == 2) {
                  setState(() {
                    _labelButton = 'Bắt đầu';
                  });
                } else {
                  setState(() {
                    _labelButton = 'Tiếp theo';
                  });
                }
              },
              children: const [
                IntroScreen1(),
                IntroScreen2(),
                IntroScreen3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ScrollingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Color(0xFF4a4a4a),
                dotHeight: 8,
                dotWidth: 8),
          ),
          Container(
            height: 50,
            width: 240,
            margin: const EdgeInsets.only(top: 40),
            child: TextButton(
              onPressed: nextPage,
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0xFF2bc849)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              child: Text(
                _labelButton,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void nextPage() async {
    _controller.animateToPage(_controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    bool first = isFirst;
    await prefs.setBool('isFirst', isFirst);
    if (_controller.page!.toInt() + 1 > 2 && first == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    }
  }
}
