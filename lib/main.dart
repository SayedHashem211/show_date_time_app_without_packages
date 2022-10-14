import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Show Date & Time Without Packages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DateApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  // Dates
  String year = "";
  String dayNumber = "";
  String month = "";
  String dayWeek = "";
  String pmORam = "am";

  // Time

  int hour = 0; // to make time system 24h not 12h
  String min = "";
  String sec = "";

  changeEverySec() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Dates
        year = DateTime.now().year.toString();
        dayNumber = DateTime.now().day.toString();
        month = DateTime.now().month.toString();
        switch (month) {
          case "1":
            month = "January";
            break;

          case "2":
            month = "February";
            break;

          case "3":
            month = "March";
            break;

          case "4":
            month = "April";
            break;

          case "5":
            month = "May";
            break;

          case "6":
            month = "June";
            break;

          case "7":
            month = "July";
            break;

          case "8":
            month = "August";
            break;

          case "9":
            month = "September";
            break;

          case "10":
            month = "October";
            break;

          case "11":
            month = "November";
            break;

          case "12":
            month = "December";
            break;
        }
        dayWeek = DateTime.now().weekday.toString();

        switch (dayWeek) {
          case "1":
            dayWeek = "monday";
            break;

          case "2":
            dayWeek = "tuesday";
            break;

          case "3":
            dayWeek = "wednesday";
            break;

          case "4":
            dayWeek = "thursday";
            break;

          case "5":
            dayWeek = "friday";
            break;

          case "6":
            dayWeek = "saturday";
            break;

          case "7":
            dayWeek = "sunday";
            break;
        }

        //Time

        hour = DateTime.now().hour;
        if (hour > 12) {
          hour = hour - 12;
          pmORam = "pm";
        }
        min = DateTime.now().minute.toString();
        sec = DateTime.now()
            .second
            .toString(); // seconds still changes as i use periodic function
      });
    });
  }

  @override
  initState() {
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Time & Date App",
          style: TextStyle(
              fontSize: 40, color: Colors.white38, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $dayWeek",
              style: const TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              "$month $dayNumber, $year",
              style: const TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              "${hour.toString().padLeft(2, "0")} : ${min.padLeft(2, "0")} : ${sec.padLeft(2, "0")} $pmORam",
              style: const TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
