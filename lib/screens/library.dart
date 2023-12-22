import 'package:flutter/material.dart';
import 'package:music_app/constants.dart';
import 'package:music_app/main.dart';
import 'package:music_app/screens/%20videoViewer.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:music_app/screens/nowplaying.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/screens/videoDemoNext.dart';
import 'package:music_app/screens/videoDemoLast.dart';
import 'package:music_app/screens/year2017.dart';
import 'package:music_app/screens/year2019.dart';
import 'package:music_app/screens/year2018.dart';

import 'package:music_app/screens/year2022.dart';
import 'package:url_launcher/url_launcher.dart';

class Library extends StatefulWidget {
  final int count = 0;
  AudioPlayer audioPlayer = AudioPlayer();

  Library({this.audioPlayer});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final int count = 0;
  bool isPlaying = true;
  void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  Widget genreCard(BuildContext context, String img, String title, int song,{String place=""}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            if (song == 1) {
              return VideoDemo();
            } else if (song == 2) {
              return VideoDemoNext();
            } else if(song == 3) {
              return Year2022();
            }
            else if (song == 4) {
              return Year2019();
            }
            else if(song == 5) {
              return Year2018();
            }
            else if (song == 6){
              return Year2017();
            }
          }),
        );
      },
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(gcard),
          ),
        ),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 50,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              // (place==null)?"":place,
              place,
              style: TextStyle(
                fontWeight: FontWeight.normal, 
                fontSize: 15,
                // fontFamily: 'text2'
                ),
            ),
             SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
  //song card
  Widget songsCard(BuildContext context, int sr, String img, String title,
      String artist, String vru, count, String title_song, String song_load) {
    return GestureDetector(
      onTap: () async {
       if(widget.audioPlayer !=null){ 

        widget.audioPlayer.pause();
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NowPlaying(title, artist, vru, count, title_song, song_load);

            // return VideoDemo();
          }),
        );
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("$sr"),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(img),
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    artist,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you want to exit the app?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Close the app
                        SystemNavigator.pop();
                      },
                      child: Text('Yes'),
                    ),
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: cwhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  '2023 Nǿng',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Title'

                    ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Zilangré Mongkà Mvngū Lìpong',
                  style: TextStyle(
                    fontSize: 15, 
                    fontFamily: 'Title'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 40),
            //   child: Text(
            //     'Nǿng vrv̀m Zaywàrì',
            //     style: TextStyle(
            //         letterSpacing: 3,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w300,
            //         color: cblue),
            //   ),
            // ),
            ////Now we will create a Scroll views for different Genres
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Now we will call Genre card
                    // genreCard(context, group, "Vjúrøtshø̀nge", 1),
                    // genreCard(context, group1, "Gvray Bø̀ng", 2),
                    genreCard(context, shvnggung, "2022", 3,place: "Shvngung"),
                    genreCard(context,zion , "2019", 4,place: "Zion"),
                    genreCard(context, shvnggung, "2018", 5,place: "Shvngung"),
                    genreCard(context, zion, "2017", 6,place: "Zion"),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                '2023 Nǿng Zilangré mvkúnrì',
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: cblue),
              ),
            ),
            //Container For Trending Songs
            Container(
              width: MediaQuery.of(context).size.width,
              height: 305,
              padding: EdgeInsets.fromLTRB(25, 25, 5, 3),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(scard)),
              ),
              child: SingleChildScrollView( 
                child: Column(
                  children: <Widget>[
                    songsCard(
                        context,
                        1,
                        pongziaung,
                        "Vjúrøtshø̀nge",
                        "Pong Zi Ong @ MB Lun Htar",
                        "PK Pong",
                        1,
                        "assets/audio/song1.m4a",
                        "song1.m4a"
                        ),
                    songsCard(context,2, ruzi, "Gvray Bø̀ng","Lat Shine Ong, ZM Pongshin, YT Ruzi","W Kong Lin",2,"assets/audio/gvraybxng.m4a","graybxng.m4a"),
                    songsCard(context,3, dxngang, "Mvshø̀ng Mènin","WN Døngang @ RD Ninshvr","WN Døngang",3,"assets/audio/mvshxng.m4a","mvshxng.m4a"),
                    songsCard(context,4, ninsan, "Shvgùn Zaywà 119:9","NM NinSan","Wdk Dødvng",4,"assets/audio/shvdxng.m4a","shvdxng.m4a"),
                    songsCard(context,5, pongziaung, "Vjúrøtshø̀nge (karaoke)","Pong Zi Ong @ MB Lun Htar","PK Pong",5,"assets/audio/song1_karaoke.m4a","song1_karaoke.m4a"),
                    songsCard(context,6, ruzi, "Gvray Bø̀ng (karaoke)","Lat Shine Ong, ZM Pongshin, YT Ruzi","W Kong Lin",6,"assets/audio/gvraybxng_karaoke.m4a","graybxng_karaoke.m4a"),
                    songsCard(context,7, dxngang, "Mvshø̀ng Mènin (karaoke)","WN Døngang @ RD Ninshvr","WN Døngang",7,"assets/audio/mvshxng_karaoke.m4a","mvshxng_karaoke.m4a"),
                    songsCard(context,8, ninsan, "Shvz 119:9 (karaoke)","NM NinSan","Wdk Dødvng",8,"assets/audio/shvdxng_karaoke.m4a","shvdxng_karaoke.m4a")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "App creater- ",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'text1'
                    ),
                ),
                GestureDetector(
                  onTap: ()  {
                        _launchURL('https://www.facebook.com/mbpong.ram.9');

                    // const url =
                    //     'fb://profile/mbpong.ram.9'; // Use fb:// protocol
                    // const fallbackUrl =
                    //     'https://www.facebook.com/mbpong.ram.9'; // Fallback to https:// URL
                    // if (await canLaunch(url)) {
                    //   await launch(url,
                    //       forceSafariVC: false, universalLinksOnly: true);
                    // } else {
                    //   await launch(fallbackUrl);
                    // }
                  },
                  child: Text(
                    'MB Phong Ram',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.blue,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'text1', 
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
