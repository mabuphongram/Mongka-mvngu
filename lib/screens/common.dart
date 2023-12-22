// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:music_app/constants.dart';
// import 'package:music_app/screens/library.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:share/share.dart';

// class Year2022 extends StatefulWidget {
//   const Year2022({Key key}) : super(key: key);

//   @override
//   State<Year2022> createState() => _Year2022State();
// }

// class _Year2022State extends State<Year2022> {
//   final audioPlayer = AudioPlayer();
//   bool isPlaying = true;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     // playMusic();
//     audioPlayer.onPlayerStateChanged.listen((state) {
//       setState(() {
//         isPlaying = state == PlayerState.PLAYING;
//       });
//     });
//     audioPlayer.onDurationChanged.listen((newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });
//     audioPlayer.onAudioPositionChanged.listen((newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });
//     // Future<void> playMusic() async {
//     //   final bytes = await rootBundle.load();
//     //   await audioPlayer.playBytes(bytes.buffer.asUint8List());
//   }

//   Future setAudio() async {
//     audioPlayer.setReleaseMode(ReleaseMode.LOOP);
//   }

//   @override
//   void dispose() {
//     // player.dispose();
//     super.dispose();
//   }

//   //song card
//   Widget songsCard(String title, String img, int intValue,String songUrl) {
//     return GestureDetector(
//       onTap: () async {
//         final bytes = await rootBundle.load(songUrl);
//         await audioPlayer.playBytes(bytes.buffer.asUint8List());
//       },
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 width: 20,
//               ),
//               CircleAvatar(
//                 backgroundImage: AssetImage(img),
//                 radius: 30,
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     title,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   String formatTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return [
//       if (duration.inHours > 0) hours,
//       minutes,
//       seconds,
//     ].join(':');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 50,
//             ),
//             songsCard("Track 01", luntar, 1,"assets/audio/year2022_1.m4a"),
//             songsCard("Track 02", luntar, 2,"assets/audio/year2022_2.m4a"),
//             songsCard("Track 03", luntar, 3,"assets/audio/year2022_3.m4a"),
//             songsCard("Track 04", luntar, 4,"assets/audio/year2022_4.m4a"),
//             songsCard("Track 05", luntar, 5,"assets/audio/year2022_5.m4a"),
//             songsCard("Track 01", luntar, 6,"assets/audio/year2022_6.m4a"),
//             songsCard("Track 02", luntar, 7,"assets/audio/year2022_7.m4a"),
//             songsCard("Track 03", luntar, 8,"assets/audio/year2022_8.m4a"),
//             songsCard("Track 04", luntar, 9,"assets/audio/year2022_9.m4a"),
//             songsCard("Track 05", luntar, 10,"assets/audio/year2022_10.m4a"),
//             songsCard("Track 03", luntar, 11,"assets/audio/year2022_11.m4a"),
//             songsCard("Track 04", luntar, 12,"assets/audio/year2022_12.m4a"),
//             songsCard("Track 05", luntar, 13,"assets/audio/year2022_13.m4a"),
//             SizedBox(
//               height: 20,
//             ),
//             Slider(
//               min: 0,
//               max: duration.inSeconds.toDouble(),
//               value: position.inSeconds.toDouble(),
//               onChanged: (value) async {
//                 final position = Duration(seconds: value.toInt());
//                 await audioPlayer.seek(position);
//                 await audioPlayer.resume();
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(formatTime(position)),
//                   Text(formatTime(duration - position)),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: cbutton(previous),
//                   iconSize: 80,
//                 ),
//                 IconButton(
//                   icon: isPlaying ? cbutton(play) : cbutton(pause),
//                   iconSize: 80,
//                   onPressed: () async {
//                     if (isPlaying) {
//                       await audioPlayer.pause();
//                     } else {
//                       await audioPlayer.resume();
//                     }
//                   },
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: cbutton(next),
//                   iconSize: 80,
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
