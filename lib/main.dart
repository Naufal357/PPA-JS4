import 'package:flutter/material.dart';
import 'package:dropdown_widget/Input.dart';
import 'package:dropdown_widget/Konversi.dart';
import 'package:dropdown_widget/Hasil.dart';
import 'package:dropdown_widget/Riwayat.dart';
import 'package:dropdown_widget/KonversiKe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDrowpdown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [""];

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDrowpdown = value.toString();
      if (etInput.text.isNotEmpty) {
        switch (selectedDrowpdown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            break;
          case "Reamur":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            break;
          case "Fahrenheit":
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listHasil.add(etInput.text +
            " Celcius ke " +
            selectedDrowpdown +
            " = " +
            hasilPerhitungan.toString() +
            " " +
            selectedDrowpdown);
      }
    });
  }

  void konversiSuhu() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            inputSuhu(etInput: etInput),
            SizedBox(height: 8),
            TargetPerhitungan(
              selectedDrowpdown: selectedDrowpdown,
              listSatuanSuhu: listSatuanSuhu,
              onDropdownChanged: onDropdownChanged,
            ),
            SizedBox(height: 10),
            Text(
              "Hasil",
              style: TextStyle(fontSize: 20),
            ),
            PerhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
            SizedBox(height: 10),
            KonversiSuhu(
              onPressed: konversiSuhu,
            ),
            SizedBox(height: 10),
            Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
            RiwayatPerhitungan(listHasil: listHasil)
          ],
        ),
      ),
    );
  }
}
