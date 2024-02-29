import 'package:flutter/material.dart';

class ResultIcon extends StatelessWidget {
  const ResultIcon({
    super.key,
    required this.tuuraIconbu,
  });
  final bool tuuraIconbu;

  @override
  Widget build(BuildContext context) {
    return Icon(
      tuuraIconbu == true ? Icons.check : Icons.close,
      size: 40,
      color: tuuraIconbu == true
          ? const Color(0xff4cb050)
          : const Color(0xffEf443A),
    );
  }
}
