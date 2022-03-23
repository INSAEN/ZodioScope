// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:zodiac_app/constants.dart';
import 'package:zodiac_app/screens/zodiac_screen.dart';

class BirthScreen extends StatefulWidget {
  const BirthScreen({Key? key}) : super(key: key);

  @override
  State<BirthScreen> createState() => _BirthScreenState();
}

class _BirthScreenState extends State<BirthScreen> {
  DateTime? _dateTime;
  Size screen() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primColor,
        title: Text(
          "ZodioScope",
          style: TextStyle(fontFamily: "ProdSans"),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        SizedBox(
          height: screen().height,
          child: Image(
            image: AssetImage('assets/astro.png'),
            fit: BoxFit.fill, //make it fill the entire page
          ),
        ),
        Center(
            child: SizedBox(
          height: screen().height * 0.2,
          width: screen().width * 0.6,
          child: Card(
            color: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter Your Birthdate:",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _dateTime == null
                              ? 'Pick a Date'
                              : '${_dateTime?.day}/${_dateTime?.month}/${_dateTime?.year}',
                          style: TextStyle(
                              fontFamily: "Oxygen",
                              fontSize: 12,
                              color: whiteColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                builder: (context, Widget? child) {
                                  return Theme(
                                    child: child!,
                                    data: ThemeData.dark().copyWith(
                                      colorScheme: ColorScheme.dark(
                                        primary: primColor,
                                      ),
                                      dialogBackgroundColor: bgColor,
                                    ),
                                  );
                                }).then((date) {
                              setState(() {
                                _dateTime = date!;
                              });
                            });
                          },
                          icon: Icon(Icons.calendar_month),
                          color: whiteColor,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_dateTime != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Zodiac(
                                      bday: _dateTime,
                                      ht: screen().height,
                                      wd: screen().width,
                                    )),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: bgColor,
                              title: Text(
                                "Pick a Birthday",
                                style: TextStyle(color: whiteColor),
                              ),
                              content: Text(
                                  "You need to select your birthday by pressing the icon to find your Sun sign.",
                                  style: TextStyle(color: whiteColor)),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: primColor),
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("okay"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Find Zodiac Sign!",
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(primary: primColor),
                    )
                  ]),
            ),
          ),
        ))
      ]),
    );
  }
}
