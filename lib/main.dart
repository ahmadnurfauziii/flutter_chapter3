import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double fahrenheit = 0;
  double reamur = 0;

  konversi() {
    //set state
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = 4 / 5 * inputUser;
      fahrenheit = 9 / 5 * inputUser + 32;
      kelvin = inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konversi"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Masukan Nilai Suhu"),
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: etInput,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Kelvin",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$kelvin',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Fahrenheit",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$fahrenheit',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Reamur",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '$reamur',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  onPressed: konversi,
                  color: Colors.blueAccent,
                  textColor: Colors.black,
                  child: Text("Konversi"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
