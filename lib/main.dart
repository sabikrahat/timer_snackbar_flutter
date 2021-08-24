import 'package:flutter/material.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Timer Snackbar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Snackbar"),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: ElevatedButton(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Show Snackbar', textScaleFactor: 1.2)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              onPressed: () => timerSnackbar(
                context: context,
                contentText: "A snackbar with live timer.",
                afterExecuteMethod: () => print("Operation Execute."),
                second: 5, // default value 4 second
              ),
            ),
          );
        },
      ),
    );
  }
}
