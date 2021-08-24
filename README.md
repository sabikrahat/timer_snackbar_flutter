# Want to set live timer at snackbar in your flutter project?

## Preview

![Preview](/sample.gif)

<h3>
Snackbar is an important widget in flutter to show success or error messages. But if we can make customize this snackbar on our own, it will be more eye-catchy to the users. I have tried to customize this snackbar a little bit as like #telegram app. The execution method will call automatically after the time is finished and if you press undo button the method won't execute. Hope you like it. I've tried my best and as a beginner in flutter hope you will pardon my mistake.
Feel free to give me any suggestions. Thank you.
</h3>

<br>
<br>

## <b>#main function<b>
```
ElevatedButton(
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
```

## <b>#timerSnackbar function<b>

```
import 'dart:async';
import 'package:flutter/material.dart';

showCustomSnackbar({
  required BuildContext context,
  required String contentText,
  required void Function() afterExecuteMethod,
  int second = 4,
}) {
  bool isExecute = true;
  final snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 22.0),
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: second * 1000.toDouble()),
            duration: Duration(seconds: second),
            builder: (context, double value, child) {
              return Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      value: value / (second * 1000),
                      color: Colors.grey[850],
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(
                      (second - (value / 1000)).toInt().toString(),
                      textScaleFactor: 0.85,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(child: Text(contentText)),
        InkWell(
          splashColor: Colors.white,
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            isExecute = !isExecute;
            return;
          },
          child: Container(
            color: Colors.grey[850],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4.0),
                Image.asset(
                  'assets/undo.png',
                  width: 17.0,
                  height: 15.0,
                  alignment: Alignment.topCenter,
                  color: Colors.blue[100],
                ),
                SizedBox(width: 8.0),
                Text(
                  "Undo",
                  style: TextStyle(color: Colors.blue[100]),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.grey[850],
    duration: Duration(seconds: second),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(6.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackbar);

  Timer(Duration(seconds: second), () {
    if (isExecute) afterExecuteMethod();
  });
}
```


## Sample Picture

![Preview](/sample.png)

## Enjoy... and if you like this article give a thumbs up 👍. 
