import 'package:flutter/material.dart';
import 'package:lose_some_weight/constants/app_constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  
  const RightBar({ Key? key , required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, 
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20),
            ),
            color: accentColor,
          ),
        ),
      ],
    );
  }
}