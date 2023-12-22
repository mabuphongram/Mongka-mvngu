import 'package:path_provider/path_provider.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/constants.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:share/share.dart';
import 'dart:io';

class Year2018 extends StatefulWidget {
  const Year2018({Key key}) : super(key: key);

  @override
  State<Year2018> createState() => _Year2018State();
}

class _Year2018State extends State<Year2018> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int counter = 1;
  Future<void> playMusic() async {
    final bytes = await rootBundle.load("assets/audio/year2018_1.m4a");
    await audioPlayer.playBytes(bytes.buffer.asUint8List());
    counter == 1;
  }

  @override
  void initState() {
    super.initState();
    playMusic();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    audioPlayer.onPlayerCompletion.listen((event) async {
      if (counter == 5) counter = 0;
      final bytes =
          await rootBundle.load("assets/audio/year2018_${counter + 1}.m4a");
      await audioPlayer.playBytes(bytes.buffer.asUint8List());
      counter++;
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  @override
  void dispose() {
    // player.dispose();
    super.dispose();
  }
  //song card
  Widget songsCard(String title, String img, int intValue, String songUrl) {
    return GestureDetector(
      onTap: () async {
        final bytes = await rootBundle.load(songUrl);
        await audioPlayer.playBytes(bytes.buffer.asUint8List());
        counter = intValue;
      },
      child: Column(
        
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(img),
                radius: 28,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       fontSize: 18,
                      //  fontFamily: 'text2'
                       ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
   
    // TODO: implement build
    return WillPopScope(
      onWillPop: ()async{
        await audioPlayer.pause();
        return true;
      },
      child: Scaffold(
        backgroundColor: cwhite_1,
        appBar: AppBar(
          backgroundColor: cblue,
          // bottomOpacity: 0,
          // elevation: 0,
          title: Text("2018 Nǿng Zilàngré Zaywarì",
                      style: TextStyle(
                        fontFamily: 'text1',
                        fontSize:22 ),),
        ),
        body: Column(
          children: [
           
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: EdgeInsets.fromLTRB(25, 10, 5, 3),
              
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  
                  songsCard(
                      "Track 01", music_theme, 1, "assets/audio/year2018_1.m4a"),
                  songsCard(
                      "Track 02", music_theme, 2, "assets/audio/year2018_2.m4a"),
                  songsCard(
                      "Track 03", music_theme, 3, "assets/audio/year2018_3.m4a"),
                  songsCard(
                      "Track 04", music_theme, 4, "assets/audio/year2018_4.m4a"),
                  songsCard(
                      "Track 05", music_theme, 5, "assets/audio/year2018_5.m4a"),
                 
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (counter < 10) ? "Track 0$counter" : "Track $counter",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                        width: 100,
                        height: 30,
                        child: (isPlaying)
                            ? Image.asset("assets/images/playing.gif")
                            : Image.asset("assets/images/stop.png")),
                  ],
                ),
                IconButton(
                    onPressed: () async {
                      final fileBytes = await rootBundle
                          .load("assets/audio/year2018_$counter.m4a");
                      final tempDir = await getTemporaryDirectory();
                      final tempFile = await File(
                              '${tempDir.path}/${"year2018_$counter.m4a"}')
                          .create();
                      tempFile.writeAsBytes(fileBytes.buffer.asUint8List(
                          fileBytes.offsetInBytes, fileBytes.lengthInBytes));
                      await Share.shareFiles([tempFile.path],
                          text: 'Check out this cool song!');
                    },
                    icon: Icon(Icons.share)),
              ],
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
                await audioPlayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  
                  // Text((counter<10)?"Track 0$counter": "Track $counter"),
                  // Container(
                  //   width: 90,
                  //   height: 30,
                  //   child: (isPlaying)?Image.asset("assets/images/playing.gif"):Image.asset("assets/images/stop.png")),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    if (counter == 1) counter = 6;
                    final bytes = await rootBundle
                        .load("assets/audio/year2018_${counter - 1}.m4a");
                    await audioPlayer.playBytes(bytes.buffer.asUint8List());
                    counter--;
                  },
                  icon: cbutton(previous),
                  iconSize: 80,
                ),
                IconButton(
                  icon: isPlaying ? cbutton(play) : cbutton(pause),
                  iconSize: 80,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                ),
                IconButton(
                  onPressed: () async {
                    if (counter == 5) counter = 0;
                    final bytes = await rootBundle
                        .load("assets/audio/year2018_${counter + 1}.m4a");
                    await audioPlayer.playBytes(bytes.buffer.asUint8List());
                    counter++;
                  },
                  icon: cbutton(next),
                  iconSize: 80,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
