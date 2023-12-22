import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/constants.dart';
import 'package:music_app/screens/library.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:share/share.dart';

class NowPlaying extends StatefulWidget {
   int intValue;
   String title;
  String artist;
  String vru;
   String title_song;
   String song_load;

  // Create the one argument constructor
  NowPlaying(this.title, this.artist, this.vru, this.intValue, this.title_song,
      this.song_load);
  //to randomize Wave height

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  // AssetsAudioPlayer player;
  final audioPlayer = AudioPlayer();
  bool isPlaying = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

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
  audioPlayer.onPlayerCompletion.listen((event) async{
     switch (widget.intValue) {
      case 1:
              widget.title="Gvray Bø̀ng";
          widget.artist = "Lat Shine Ong, ZM Pongshin, YT Ruzi";
          widget.vru="W Kong Lin";
          widget.intValue=2;
          widget.title_song="assets/audio/gvraybxng.m4a";
          widget.song_load="gvraybxng.m4a";
          
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());
          
    
    break;
      case 2:
         
         
            widget.title="Mvshø̀ng Mènin";
          widget.artist = "WN Døngang @ RD Ninshvr";
          widget.vru="WN Døngang";
          widget.intValue=3;
          widget.title_song="assets/audio/mvshxng.m4a";
          widget.song_load="mvshxng.m4a";
        
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());

        

        break;
      case 3:
          
          widget.title="Shvgùn Zaywà 119:9";
          widget.artist = "NM NinSan";
          widget.vru="Wdk Dødvng";
          widget.intValue=4;
          widget.title_song="assets/audio/shvdxng.m4a";
          widget.song_load="shvdxng.m4a";
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());
        

        break;
      case 4:
           
          widget.title="Vjúrøtshø̀nge";
          widget.artist = " Pong Zi Ong @ MB Lun Htar";
          widget.vru="PK Pong";
          widget.intValue=1;
          widget.title_song="assets/audio/song1.m4a";
          widget.song_load="song1.m4a";
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());
        

        break;
      case 5:
           
          widget.title="Vjúrøtshø̀nge";
          widget.artist = " Pong Zi Ong @ MB Lun Htar";
          widget.vru="PK Pong";
          widget.intValue=1;
          widget.title_song="assets/audio/song1.m4a";
          widget.song_load="song1.m4a";
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());
        
        break;
      case 6:
           
          widget.title="Vjúrøtshø̀nge";
          widget.artist = " Pong Zi Ong @ MB Lun Htar";
          widget.vru="PK Pong";
          widget.intValue=1;
          widget.title_song="assets/audio/song1.m4a";
          widget.song_load="song1.m4a";
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());
        
        break;
      case 7:
        
          widget.title="Vjúrøtshø̀nge";
          widget.artist = " Pong Zi Ong @ MB Lun Htar";
          widget.vru="PK Pong";
          widget.intValue=1;
          widget.title_song="assets/audio/song1.m4a";
          widget.song_load="song1.m4a";
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());
      
        break;
      case 8:
           
          widget.title="Vjúrøtshø̀nge";
          widget.artist = " Pong Zi Ong @ MB Lun Htar";
          widget.vru="PK Pong";
          widget.intValue=1;
          widget.title_song="assets/audio/song1.m4a";
          widget.song_load="song1.m4a";
          final bytes = await rootBundle.load(widget.title_song);
          await audioPlayer.playBytes(bytes.buffer.asUint8List());
        
        break;
      default:
    }
  });
   
  }

  Future<void> playMusic() async {
    final bytes = await rootBundle.load(widget.title_song);
    await audioPlayer.playBytes(bytes.buffer.asUint8List());
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  @override
  void dispose() {
    // player.dispose();
    super.dispose();
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

  void nextButton(String title, String mvkun, String vru, int intValue,
      String song, String songLoad) {
    audioPlayer.stop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            NowPlaying(title, mvkun, vru, intValue, song, songLoad)));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          audioPlayer.pause();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Library(audioPlayer: audioPlayer)),
          );
          return true; // Return true to allow the widget tree to be popped
        },
        child: Scaffold(
          // Your widget tree goes here
          backgroundColor: cwhite,
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),

              //Now we will create Navigation Buttons
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: cbutton(back),
                    onTap: () async {
                      audioPlayer.pause();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Library(
                                  audioPlayer: audioPlayer,
                                )),
                      );
                    },
                  ),
                  Spacer(),
                  Text(
                    'NOW PLAYING',
                    style: TextStyle(
                        color: cblue,
                        fontSize: 17,
                        fontWeight: FontWeight.w300),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () async {
                      final fileBytes =
                          await rootBundle.load(widget.title_song);
                      final tempDir = await getTemporaryDirectory();
                      final tempFile =
                          await File('${tempDir.path}/${widget.song_load}')
                              .create();
                      tempFile.writeAsBytes(fileBytes.buffer.asUint8List(
                          fileBytes.offsetInBytes, fileBytes.lengthInBytes));
                      await Share.shareFiles([tempFile.path],
                          text: 'Check out this cool song!');
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),

              //Now we will create Album Art Disk
              Container(
                padding: EdgeInsets.all(5),
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(disk)),
                ),
                child: CircleAvatar(
                    backgroundImage: AssetImage(disk_theme),
                    child: CircleAvatar(
                      backgroundColor: cwhite,
                      radius: 15,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              // Now we will create Song Title and Artist name Texts
              Text(
                widget.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "vru- " + widget.vru,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "mvkun- " + widget.artist,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
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
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: cbutton(previous),
                    iconSize: 80,
                    onPressed: () async {
                      switch (widget.intValue) {
                        case 1:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                  "Shvgùn Zaywà 119:9(karaoke)",
                                  "NM NinSan",
                                  "Wdk Dødvng",
                                  8,
                                  "assets/audio/shvdxng_karaoke.m4a",
                                  "shvdxng_karaoke.m4a")));
                          break;
                        case 2:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                  "Vjúrøtshø̀nge",
                                  "Pong Zi Ong @ MB Lun Htar",
                                  "PK Pong",
                                  1,
                                  "assets/audio/song1.m4a",
                                  "song1.m4a")));
                          break;
                        case 3:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                    "Gvray Bø̀ng",
                                    "Lat Shine Ong, ZM Pongshin, YT Ruzi",
                                    "W Kong Lin",
                                    2,
                                    "assets/audio/gvraybxng.m4a",
                                    "graybxng.m4a",
                                  )));
                          break;
                        case 4:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                  "Mvshø̀ng Mènin",
                                  "WN Døngang @ RD Ninshvr",
                                  "WN Døngang",
                                  3,
                                  "assets/audio/mvshxng.m4a",
                                  "mvshxng.m4a")));
                          break;
                        case 5:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                  "Shvgùn Zaywà 119:9",
                                  "NM NinSan",
                                  "Wdk Dødvng",
                                  4,
                                  "assets/audio/shvdxng.m4a",
                                  "shvdxng.m4a")));
                          break;
                        case 6:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                  "Vjúrøtshø̀nge(karaoke)",
                                  "Pong Zi Ong @ MB Lun Htar",
                                  "PK Pong",
                                  5,
                                  "assets/audio/song1_karaoke.m4a",
                                  "song1_karaoke.m4a")));
                          break;
                        case 7:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                    "Gvray Bø̀ng(karaoke)",
                                    "Lat Shine Ong, ZM Pongshin, YT Ruzi",
                                    "W Kong Lin",
                                    6,
                                    "assets/audio/gvraybxng_karaoke.m4a",
                                    "graybxng_karaoke.m4a",
                                  )));
                          break;
                        case 8:
                          audioPlayer.stop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NowPlaying(
                                  "Mvshø̀ng Mènin(karaoke)",
                                  "WN Døngang @ RD Ninshvr",
                                  "WN Døngang",
                                  7,
                                  "assets/audio/mvshxng_karaoke.m4a",
                                  "mvshxng_karaoke.m4a")));
                          break;
                        default:
                      }
                    },
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
                    icon: cbutton(next),
                    iconSize: 80,
                    onPressed: () async {
                      switch (widget.intValue) {
                        case 1:
                          nextButton(
                            "Gvray Bø̀ng",
                            "Lat Shine Ong, ZM Pongshin, YT Ruzi",
                            "W Kong Lin",
                            2,
                            "assets/audio/gvraybxng.m4a",
                            "graybxng.m4a",
                          );
                          break;
                        case 2:
                          nextButton(
                              "Mvshø̀ng Mènin",
                              "WN Døngang @ RD Ninshvr",
                              "WN Døngang",
                              3,
                              "assets/audio/mvshxng.m4a",
                              "mvshxng.m4a");
                          break;
                        case 3:
                          nextButton(
                              "Shvgùn Zaywà 119:9",
                              "NM NinSan",
                              "Wdk Dødvng",
                              4,
                              "assets/audio/shvdxng.m4a",
                              "shvdxng.m4a");
                          break;
                        case 4:
                          nextButton(
                              "Vjúrøtshø̀nge(karaoke)",
                              "Pong Zi Ong @ MB Lun Htar",
                              "PK Pong",
                              5,
                              "assets/audio/song1_karaoke.m4a",
                              "song1_karaoke.m4a");
                          break;
                        case 5:
                          nextButton(
                            "Gvray Bø̀ng(karaoke)",
                            "Lat Shine Ong, ZM Pongshin, YT Ruzi",
                            "W Kong Lin",
                            6,
                            "assets/audio/gvraybxng_karaoke.m4a",
                            "graybxng_karaoke.m4a",
                          );
                          break;
                        case 6:
                          nextButton(
                              "Mvshø̀ng Mènin(karaoke)",
                              "WN Døngang @ RD Ninshvr",
                              "WN Døngang",
                              7,
                              "assets/audio/mvshxng_karaoke.m4a",
                              "mvshxng_karaoke.m4a");
                          break;
                        case 7:
                          nextButton(
                              "Shvgùn Zaywà 119:9(karaoke)",
                              "NM NinSan",
                              "Wdk Dødvng",
                              8,
                              "assets/audio/shvdxng_karaoke.m4a",
                              "shvdxng_karaoke.m4a");
                          break;
                        case 8:
                          nextButton(
                              "Vjúrøtshø̀nge",
                              "Pong Zi Ong @ MB Lun Htar",
                              "PK Pong",
                              1,
                              "assets/audio/song1.m4a",
                              "song1.m4a");
                          break;
                        default:
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
