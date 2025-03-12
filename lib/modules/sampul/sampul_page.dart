import 'dart:ui';

import 'package:card_raya/constants/app_images.dart';
import 'package:card_raya/constants/sampul_data.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SampulPage extends StatefulWidget {
  final SampulData sampulData;
  const SampulPage({super.key, required this.sampulData});

  @override
  SampulPageState createState() => SampulPageState();
}

class SampulPageState extends State<SampulPage> {
  final ConfettiController _controller =
      ConfettiController(duration: const Duration(seconds: 5));

  @override
  void initState() {
    super.initState();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context), // Close action
                child: Image.asset(
                  AppImages.closeKetupat.path,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                )
                    .animate(
                      onPlay: (controller) =>
                          controller.repeat(reverse: true, period: 1.seconds),
                    )
                    .rotate(
                      begin: -0.1,
                      end: 0.1,
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.sampulData.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              widget.sampulData.image,
            ).animate().slideY(
                begin: 1.0,
                end: 0.38,
                duration: 1.seconds,
                curve: Curves.easeOut),
          ),
        ],
      ),
    );
  }
}
