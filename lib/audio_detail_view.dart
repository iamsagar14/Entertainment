import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ratamata/app_Colors.dart' as appColors;
import 'package:ratamata/audio_file.dart';

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  late AudioPlayer advancePlayer;

  @override
  void initState() {
    advancePlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Get.height;
    final double screenWidth = Get.width; // Use Get.width for screen width
    return Scaffold(
      backgroundColor: appColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: screenHeight * 0.36,
            child: Container(
              color: Colors.purple,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: const Icon(Icons.arrow_back_ios),
              actions: const [Icon(Icons.search)],
            ),
          ),
          Positioned(
            top: screenHeight * 0.2,
            right: 0,
            left: 0,
            height: screenHeight * 0.5, // Adjusted height
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Hey There ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hey There ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    // AudioFilePage(
                    //   advancePlayer: advancePlayer,
                    // )
                  ]),
            ),
          ),
          Positioned(
            top: screenHeight * 0.12,
            right: (screenWidth - 150) / 2,
            left: (screenWidth - 150) / 2,
            height: screenHeight * 0.18,
            child: Container(
              decoration: BoxDecoration(
                color: appColors.audioGreyBackground,
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/pic-1.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
