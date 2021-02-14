import 'package:buzz/record/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBanter extends StatefulWidget {
  @override
  _AddBanterState createState() => _AddBanterState();
}

class _AddBanterState extends State<AddBanter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD8EFEF),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(0),
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/path.png', height: 200, width: 200),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
              height: MediaQuery.of(context).size.height / 2.8,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Akanksha Singh | @akankshaha',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff7ccccc),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 300,
                        child: Divider(
                          color: Colors.black26,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '     200\nBanters',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff7ccccc),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '     240\nListeners',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff7ccccc),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '     300\nListening',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff7ccccc),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            child: RaisedButton(
                                elevation: 5,
                                color: Color(0xff7ccccc),
                                child: Text(
                                  'Listen',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeView(),
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),

            // Container(
            //   margin: EdgeInsets.all(0),
            //   alignment: Alignment.bottomRight,
            //   child: Image.asset('assets/dot.png', height: 200, width: 300),
            // ),
          ],
        ),
      ),
    );
  }
}
