import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItem {
  final String videoId;
  String title;
  String thumbnailUrl;

  VideoItem(this.videoId, this.title, this.thumbnailUrl);
}

class YoutubePage extends StatefulWidget {
  const YoutubePage({Key? key}) : super(key: key);

  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  final List<VideoItem> videos = [
    VideoItem('tQ79yKn7Q5k', '', ''),
    VideoItem('RBumgq5yVrA', '', ''),
    VideoItem('1aQTCPxZre8', '', ''),
    VideoItem('dTu5dTEzVM4', '', ''),
    VideoItem('DKOLynNhWxo', '', ''),
    VideoItem('wPwbf0vDqhc', '', ''),
    VideoItem('tThJdNt-_5I', '', ''),
    VideoItem('tQ79yKn7Q5k', '', ''),
    VideoItem('RBumgq5yVrA', '', ''),
    // Add more video items as needed
  ];

  Future<void> fetchVideoDetails() async {
    for (var video in videos) {
      final response = await http.get(Uri.parse(
          'https://www.googleapis.com/youtube/v3/videos?part=snippet&id=${video.videoId}&key=AIzaSyD6FAX7VIyNnwC4-qWoTOXfWC8_GqqF1Fs'));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        video.title = decoded['items'][0]['snippet']['title'];
        video.thumbnailUrl =
            decoded['items'][0]['snippet']['thumbnails']['medium']['url'];
      } else {
        throw Exception('Failed to load video');
      }
    }
    setState(() {});
  }

  void _playVideo(BuildContext context, String videoId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerPage(videoId),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchVideoDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YoutubePage')),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(videos[index].thumbnailUrl)),
              title: Text(
                videos[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              onTap: () {
                _playVideo(context, videos[index].videoId);
              },
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String videoId;

  const VideoPlayerPage(this.videoId, {Key? key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Youtube  Player')),
      body: Center(
        child: YoutubePlayer(
          bottomActions: const [
            Text(
              'Hey sagar how are you ',
              style: TextStyle(color: Colors.red),
            )
          ],
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.red,
          ),
          onReady: () {
            _controller.addListener(() {});
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
