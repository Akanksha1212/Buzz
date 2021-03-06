import 'package:buzz/EachPostData/post1.dart';
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
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/buzz.png',
                height: 50,
                width: 50,
              ),
              // Text(
              //   'Buzz',
              //   style: GoogleFonts.poppins(
              //     textStyle: TextStyle(
              //       color: Colors.white,
              //       fontSize: 25,
              //       fontWeight: FontWeight.w300,
              //     ),
              //   ),
              // )
            ],
          ),
          backgroundColor: Color(0xff7ccccc),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        backgroundColor: Color(0xffD8EFEF), //Color(0xff7ccccc)
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(4, 20, 10, 20),
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
                      MyStory1(),
                      SizedBox(
                        width: 13,
                      ),
                      MyStory2(),
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
              // Container(
              //   width: 350,
              //   child: Divider(
              //     color: Color(0xff7ccccc),
              //   ),
              // ),

              GestureDetector(
                child: EachPost(),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Post1(),
                      ));
                },
              ),
              SizedBox(
                height: 25,
              ),
              EachPost1(),
              SizedBox(
                height: 25,
              ),
              EachPost(),
              SizedBox(
                height: 25,
              ),
              EachPost(),
              SizedBox(
                height: 25,
              ),
              EachPost(),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ));
  }
}

void handleClick(String value) {
  switch (value) {
    case 'Logout':
      break;
    case 'Settings':
      break;
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
                            "https://www.harleytherapy.co.uk/counselling/wp-content/uploads/16297800391_5c6e812832.jpg"),
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

class MyStory1 extends StatefulWidget {
  @override
  _MyStory1State createState() => _MyStory1State();
}

class _MyStory1State extends State<MyStory1>
    with SingleTickerProviderStateMixin {
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
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeIMNq82geLWxUoQ53wu9WemcDKOQOdX1oYg&usqp=CAU"),
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
            'Camilla',
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

class MyStory2 extends StatefulWidget {
  @override
  _MyStory2State createState() => _MyStory2State();
}

class _MyStory2State extends State<MyStory2>
    with SingleTickerProviderStateMixin {
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
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJZG-8Pk5VYr_MOP4Ks3uEeZdArTUAizNRwg&usqp=CAU"),
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
            'Rashmi',
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

class EachPost extends StatefulWidget {
  @override
  _EachPostState createState() => _EachPostState();
}

class _EachPostState extends State<EachPost> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 140 / 2.0),
          child: Container(
            height: 400.0,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Card(
                elevation: 4,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 150 / 2.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ada1212',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'What are you still salty about?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        '250k Plays   |   500 Banters',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Posted 30m ago',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Container(
          width: 140,
          height: 140,
          decoration:
              ShapeDecoration(shape: CircleBorder(), color: Color(0xff7ccccc)),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://mindbodygreen-res.cloudinary.com/images/w_767,q_auto:eco,f_auto,fl_lossy/usr/RetocQT/sarah-fielding.jpg',
                      ))),
            ),
          ),
        )
      ],
    );
  }
}

class EachPost1 extends StatefulWidget {
  @override
  _EachPost1State createState() => _EachPost1State();
}

class _EachPost1State extends State<EachPost1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 140 / 2.0),
          child: Container(
            height: 400.0,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Card(
                elevation: 4,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 150 / 2.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rashmi',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'What shall I do with my free time?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        '340k Plays   |   570 Banters',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Posted 45m ago',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Container(
          width: 140,
          height: 140,
          decoration:
              ShapeDecoration(shape: CircleBorder(), color: Color(0xff7ccccc)),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJZG-8Pk5VYr_MOP4Ks3uEeZdArTUAizNRwg&usqp=CAU',
                      ))),
            ),
          ),
        )
      ],
    );
  }
}
