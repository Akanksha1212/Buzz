import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class AudioPost extends StatefulWidget {
  @override
  _AudioPostState createState() => _AudioPostState();
}

class _AudioPostState extends State<AudioPost> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration maxLength = new Duration();

  Widget slider() {
    return Container(
        width: 250,
        child: Slider.adaptive(
          activeColor: Color(0xff7ccccc),
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: maxLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          },
        ));
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
    _player.durationHandler = (d) {
      setState(() {
        maxLength = d;
      });
    };
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 400.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        slider(),
                        Text(
                          "${maxLength.inMinutes}:${maxLength.inSeconds.remainder(60)}",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff7ccccc),
                        child: IconButton(
                          iconSize: 45.0,
                          color: Colors.white,
                          onPressed: () {
                            if (!playing) {
                              cache.play("gg.mp3");
                              setState(() {
                                playBtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player.pause();
                              setState(() {
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                          icon: Icon(
                            playBtn,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
