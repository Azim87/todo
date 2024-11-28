import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = TypeWriterController(
    repeat: false,
    text: 'Alma',
    duration: const Duration(milliseconds: 400),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF020e2a),
        body: Center(
          child: Stack(
            children: [
              TypeWriter(
                controller: _controller,
                builder: (c, v) => Text(
                  v.text,
                  style: const TextStyle(fontFamily: 'Lofty', fontSize: 130, color: Color(0xFFb2ffff), fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      );
}
