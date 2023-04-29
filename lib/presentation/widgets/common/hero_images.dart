import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;

  const HeroImage({
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 230,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: borderColor, width: 2),
        image: DecorationImage(
          image:  NetworkImage('https://media.licdn.com/dms/image/C4D03AQH-pOTGHY_13w/profile-displayphoto-shrink_800_800/0/1652014718823?e=1687996800&v=beta&t=6V4SIyowsQL3DXgqoN82oiXH7V02pWEri0OAtT3MWM8'),
        ),
      ),
    );
  }
}