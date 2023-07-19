import 'package:flutter/material.dart';

class MyVideoScreen extends StatefulWidget {
  const MyVideoScreen({super.key});

  @override
  State<MyVideoScreen> createState() => _MyVideoScreenState();
}

class _MyVideoScreenState extends State<MyVideoScreen> {
  int _selectedIndex = 0;
  late List<Widget> bodies;
  @override
  void initState() {
    bodies = [
      Container(),
      _buildMyVideoTab(),
      Container(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _buildMyVideoTab(),
      ),
    );
  }

  Widget _buildMyVideoTab() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lịch sử cục bộ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  DropdownButton(
                    dropdownColor: const Color(0xFF2d2d34),
                    icon: const Icon(Icons.more_vert),
                    value: null,
                    items: const [
                      DropdownMenuItem(
                        value: 'Xóa lịch sử cục bộ',
                        child: Text(
                          'Xóa lịch sử cục bộ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Tắt lịch sử cục bộ',
                        child: Text('Tắt lịch sử cục bộ',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                    onChanged: (value) {},
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 140,
                child: Column(
                  children: [
                    SizedBox(
                      width: 140,
                      height: 80,
                      child: Image.asset('assets/images/videos.png'),
                    ),
                    const SizedBox(
                      width: 140,
                      child: Text(
                        'Treasure - darari (다라리) (speed up)',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFe2e2e3)),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Row(
                  children: [
                    const Icon(
                      Icons.subscriptions,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Row(
                  children: [
                    const Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        child: const Text(
                          'Lịch sử',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        child: const Text(
                          'Xem sau',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Row(
                  children: [
                    const Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        child: const Text(
                          'Video đã thích',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(Icons.playlist_play,
                      color: Colors.white, size: 30),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Danh sách phát',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
