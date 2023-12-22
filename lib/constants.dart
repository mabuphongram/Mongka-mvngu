import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Colors
const cwhite = Color(0xFFEAEBF3);
const cwhite_1 = Color(0xFFFCFCFC);
const cblue = Color(0xFF0A3068);

//icons
const back = "assets/icons/back.svg";
const play = "assets/icons/play.svg";
const next = "assets/icons/next.svg";
const previous = "assets/icons/previous.svg";
const pause = "assets/icons/pause.svg";
//images
const button = "assets/images/button.png";
const disk = "assets/images/disk.png";
const scard = "assets/images/scard.png";
const gcard = "assets/images/gcard.png";
const disk1= "assets/images/card1.jpg";
const group = "assets/images/group.jpg";
const ninsan="assets/images/ninsan1.jpg";
const luntar ="assets/images/luntar.jpg";
const music_theme="assets/images/music_theme.jpeg";
const group1="assets/images/group1_1.jpg";
const pongziaung = "assets/images/pongziaung.jpeg";
const ruzi = "assets/images/ruzi.jpeg";
const dxngang = "assets/images/dxngang.jpeg";
const disk_theme = "assets/images/theme_disk.webp";
const memory = "assets/images/memory.jpg";
const musicLogo = "assets/images/music_logo.png";
const zion = "assets/images/zion.jpg";
const playing ="assets/images/playing.gif";
const stop = "assets/images/stop.png";
const shvnggung ="assets/images/shvnggung.jpg";
//ButtonWidget
Widget cbutton(String symbol) {
  return Container(
    padding: const EdgeInsets.fromLTRB(25, 25, 20, 20),
    height: 80,
    width: 80,
    decoration:const  BoxDecoration(
      image: DecorationImage(
        image: AssetImage(button),
      ),
    ),
    child: SvgPicture.asset(symbol,
    ),
  );
}