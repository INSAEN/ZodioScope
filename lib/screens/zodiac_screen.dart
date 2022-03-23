// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:zodiac_app/constants.dart';
import 'package:zodiac_app/functions/determine_sign.dart';
import 'package:zodiac_app/models/fetchFromApi.dart';
import 'package:zodiac_app/models/fetchhorro.dart';

class Zodiac extends StatefulWidget {
  DateTime? bday;
  var ht;
  var wd;
  Zodiac({required this.bday, this.ht, this.wd});

  @override
  State<Zodiac> createState() => _ZodiacState();
}

class _ZodiacState extends State<Zodiac> {
  Widget horos() {
    return FutureBuilder(
        future: HorApi(sign: getZodiacSign(widget.bday!)).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("get() returns null!"));
          }
          final data = snapshot.data as MyData;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.desc,
                    style: TextStyle(color: whiteColor, fontFamily: 'IBM')),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Your lucky color is: ${data.luckColor}",
                  style: TextStyle(color: whiteColor, fontFamily: 'IBM'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Your lucky number is: ${data.luckNo}",
                    style: TextStyle(color: whiteColor, fontFamily: 'IBM'))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primColor,
        title: Text(
          "HorroScope",
          style: TextStyle(fontFamily: "ProdSans"),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: widget.ht,
            child: Image(
              image: AssetImage('assets/astro.png'),
              fit: BoxFit.fill, //make it fill the entire page
            ),
          ),
          Center(
            child: SizedBox(
              width: widget.wd * 0.9,
              height: widget.ht * 0.5,
              child: Card(
                  color: bgColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Zodiac Sign issss",
                        style: TextStyle(
                            color: whiteColor,
                            fontFamily: 'ProdSans',
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        getZodiacSign(widget.bday!) + " !!",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      horos(),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
