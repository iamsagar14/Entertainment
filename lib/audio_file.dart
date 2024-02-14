// ignore_for_file: unused_field

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioFilePage extends StatefulWidget {
  final AudioPlayer advancePlayer;
  const AudioFilePage({super.key, required this.advancePlayer});

  @override
  State<AudioFilePage> createState() => _AudioFilePageState();
}

class _AudioFilePageState extends State<AudioFilePage> {
  bool isPlaying = false;
  bool isPause = false;
  bool isLoop = false;
  final String path =
      'https://st.bslmeiyu.com/uploads/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85SBS%E7%B3%BB%E5%88%97/%E6%9C%97%E6%96%87%E5%9B%BD%E9%99%85%E8%8B%B1%E8%AF%AD%E6%95%99%E7%A8%8B%E7%AC%AC1%E5%86%8C_V2/%E5%AD%A6%E7%94%9F%E7%94%A8%E4%B9%A6/P150_Chapter%2016_1Model%20Conversation.mp3';
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.play_circle_filled
  ];
  @override
  void initState() {
    super.initState();
    widget.advancePlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    widget.advancePlayer.onDurationChanged.listen((newDuuration) {
      setState(() {
        _duration = newDuuration;
      });
    });
    widget.advancePlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        _position = newPosition;
      });
    });
    widget.advancePlayer.setSourceUrl(path);
  }

  Widget startButton() {
    return IconButton(
        onPressed: () {
          widget.advancePlayer.play(UrlSource(path));
        },
        icon: Icon(
          _icons[0],
          color: Colors.black,
        ));
  }

  Widget loadButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: startButton(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AudioFilePage')),
      body: Column(
        children: [loadButton()],
      ),
    );
  }
}
