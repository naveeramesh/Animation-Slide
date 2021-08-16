import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({Key key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  double value = 0;
  double _left = 0.0;
  Icon valueicon = Icon(
    Icons.lock,
    color: Colors.grey,
  );
  String valuetext = "Main Door";

  void increasewidth() {
    setState(() {
      _left = _left >= 300 ? 0.0 : _left += 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      "Doors",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: GestureDetector(
                          child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(25)),
                      height: 71,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3.toInt(),
                                  child: Center(
                                      child: Text(
                                    valuetext,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),

                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.black,
                                        size: 10,
                                      ),
                                      backgroundColor: Colors.green[800],
                                      radius: 6,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 15,)
                              ],
                            ),
                          ),
                          AnimatedPositioned(
                              duration: Duration(seconds: 2),
                              curve: Curves.linear,
                              left: value,
                              child: GestureDetector(
                                  onHorizontalDragStart:
                                      _onHorizontalDragStartHandler,
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CircleAvatar(
                                      child: valueicon,
                                      backgroundColor: Colors.white,
                                      radius: 26,
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  ))),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: GestureDetector(
                          child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(25)),
                      height: 71,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3.toInt(),
                                  child: Center(
                                      child: Text(
                                    "Second door",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),

                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.black,
                                        size: 10,
                                      ),
                                      backgroundColor: Colors.green[800],
                                      radius: 6,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 15,)
                              ],
                            ),
                          ),
                          AnimatedPositioned(
                              duration: Duration(seconds: 2),
                              curve: Curves.linear,
                              left: 0,
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                      backgroundColor: Colors.white,
                                      radius: 26,
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  ))),
                ],
              ),
            ),
          )),
    );
  }

  void _onHorizontalDragStartHandler(DragStartDetails details) {
    setState(() {
      value = 260.0;
      Future.delayed(Duration(seconds: 2)).whenComplete(() {
        setState(() {
          valueicon = Icon(
            Icons.lock_open,
            color: Colors.grey,
          );
          value = 0;
        });
      });
    });
  }
}
