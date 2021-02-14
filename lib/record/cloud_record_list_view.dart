import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class CloudRecordListView extends StatefulWidget {
  final List<Reference> references;
  const CloudRecordListView({
    Key key,
    @required this.references,
  }) : super(key: key);

  @override
  _CloudRecordListViewState createState() => _CloudRecordListViewState();
}

class _CloudRecordListViewState extends State<CloudRecordListView> {
  bool isPlaying;
  AudioPlayer audioPlayer;
  int selectedIndex;
  String _timeString;

  @override
  void initState() {
    super.initState();
    isPlaying = false;
    audioPlayer = AudioPlayer();
    selectedIndex = -1;
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      print(_timeString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.references.length,
      reverse: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 400,
          child: Card(
            color: Color(0xff7ccccc),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/happy.png',
                        height: 80,
                        width: 80,
                      ),
                      Text(
                        'Posted on ' + _timeString.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      color: Color(0xff7ccccc),
                      iconSize: 40,
                      icon: selectedIndex == index
                          ? Icon(Icons.pause)
                          : Icon(Icons.play_arrow),
                      onPressed: () => _onListTileButtonPressed(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onListTileButtonPressed(int index) async {
    setState(() {
      selectedIndex = index;
    });
    audioPlayer.play(await widget.references.elementAt(index).getDownloadURL(),
        isLocal: false);

    audioPlayer.onPlayerCompletion.listen((duration) {
      setState(() {
        selectedIndex = -1;
      });
    });
  }
}
