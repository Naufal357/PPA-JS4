import 'package:flutter/material.dart';

class KonversiSuhu extends StatelessWidget {
  const KonversiSuhu({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                onPressed();
              },
              child: Text("Konversi Suhu")),
        ),
      ],
    );
  }
}
