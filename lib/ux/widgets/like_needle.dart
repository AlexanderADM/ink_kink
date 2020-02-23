import 'package:flutter/material.dart';

class LikeNeedle extends StatefulWidget {
  @override
  _LikeNeedleState createState() => _LikeNeedleState();
}

class _LikeNeedleState extends State<LikeNeedle> {
  final String emptyNeedle = "assets/Icons/empty_needle.png";
  final String fullNeedle = "assets/Icons/full_needle.png";
  String currentNeedle;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            if(currentNeedle == fullNeedle){
              currentNeedle = emptyNeedle;
            }else{
              currentNeedle = fullNeedle;
            }
          });
        },
        child: Image.asset(
          currentNeedle??emptyNeedle,
          width: MediaQuery.of(context).size.width * 0.20,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
