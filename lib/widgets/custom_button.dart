import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.tuuraButtonbu,
    required this.baskanda,
  });
  final bool tuuraButtonbu;
  final void Function(bool) baskanda;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          onPressed: () => baskanda(tuuraButtonbu),
          style: ElevatedButton.styleFrom(
              backgroundColor: tuuraButtonbu == true
                  ? const Color(0xff4cB050)
                  : const Color(0xffEf443A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              )),
          child: Text(
            tuuraButtonbu == true ? 'Tuura' : 'Туура эмес',
            style: const TextStyle(
              fontSize: 32,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
