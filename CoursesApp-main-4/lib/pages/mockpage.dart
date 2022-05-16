import 'package:flutter/material.dart';

class MockPage extends StatefulWidget {
  const MockPage({Key? key}) : super(key: key);

  @override
  State<MockPage> createState() => _MockPageState();
}

class _MockPageState extends State<MockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 22,
          top: 6,
          bottom: 6,
        ),
        child: CircleAvatar(
          backgroundColor: const Color(0xFFEC407A),
          radius: 36,
          child: Image.network(
              "https://flomaster.club/uploads/posts/2021-11/1635833030_1-flomaster-club-p-narisovannii-yeltsin-krasivii-risunok-1.png"),
        ),
      ),
    );
  }
}
