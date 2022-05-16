import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_app/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({Key? key}) : super(key: key);
  final audioPlayer = AudioPlayer();
  bool isPlaying = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  void initState() {
    super.initState();

    setAudio();

    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          widget.isPlaying = state == PlayerState.PLAYING;
        });
      }
    });

    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          widget.duration = newDuration;
        });
      }
    });

    widget.audioPlayer.onAudioPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          widget.position = newPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    widget.audioPlayer.dispose();
    super.dispose();
  }

  Future setAudio() async {
    widget.audioPlayer.setReleaseMode(ReleaseMode.STOP);

    String url =
        'https://ds.mzmdl.com/get/cuts/44/a4/44a4bc468e1bfb412c462fccc447a966/47828831/PHARAOH_Boulevard_Depo_-_Louis_Vuitton_Kiss_b128f0d258.mp3';
    widget.audioPlayer.play(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Dependencies.instance.navigator.pop();
            }),
        /*actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () => null,
          ),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://images.pexels.com/photos/4587959/pexels-photo-4587959.jpeg?cs=srgb&dl=pexels-anna-shvets-4587959.jpg&fm=jpg',
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Все о жизни кошек',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Студия кошечек',
              style: TextStyle(
                fontSize: 12,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              min: 0,
              max: widget.duration.inSeconds.toDouble(),
              value: widget.position.inSeconds.toDouble(),
              onChanged: (value) async {
                await widget.audioPlayer.pause();
                final position = Duration(seconds: value.toInt());
                await widget.audioPlayer.seek(position);
              },
              onChangeEnd: (value) async {
                await widget.audioPlayer.resume();
              },
              activeColor: Colors.black,
              thumbColor: Colors.black,
              inactiveColor: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(widget.position)),
                  Text(formatTime(widget.duration)),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.black,
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  widget.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: () async {
                  if (widget.isPlaying) {
                    await widget.audioPlayer.pause();
                  } else {
                    await widget.audioPlayer.resume();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
