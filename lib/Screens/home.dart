import 'package:buzz/Screens/storyScreen.dart';
import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffD8EFEF), //Color(0xff7ccccc)
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      DashedCircle(
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: GestureDetector(
                            child: CircleAvatar(
                              radius: 40.0,
                              // backgroundImage: NetworkImage(
                              //     'https://img.icons8.com/clouds/2x/plus.png'),
                              child: Icon(Icons.add),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StoryScreen(stories: stories),
                                  ));
                            },
                          ),
                        ),
                        color: Color(0xff7ccccc),
                      ),
                      Text(
                        'Add',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      width: 13,
                    ),
                    MyStory(),
                    SizedBox(
                      width: 13,
                    ),
                    MyStory(),
                    SizedBox(
                      width: 13,
                    ),
                    MyStory(),
                    SizedBox(
                      width: 13,
                    ),
                    MyStory(),
                    SizedBox(
                      width: 13,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              margin: EdgeInsets.all(0),
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/gi.png',
              ),
            ),
          ],
        ));
  }
}

class MyStory extends StatefulWidget {
  @override
  _MyStoryState createState() => _MyStoryState();
}

class _MyStoryState extends State<MyStory> with SingleTickerProviderStateMixin {
  /// Variables
  Animation gap;
  Animation base;
  Animation reverse;
  AnimationController controller;

  /// Init
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 3.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  /// Dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Widget
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          RotationTransition(
            turns: base,
            child: DashedCircle(
              gapSize: gap.value,
              dashes: 40,
              color: Color(0xff7ccccc),
              child: RotationTransition(
                turns: reverse,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1564564295391-7f24f26f568b"),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StoryScreen(stories: stories),
                            ));
                      }),
                ),
              ),
            ),
          ),
          Text(
            'Olivia',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xff7ccccc),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
