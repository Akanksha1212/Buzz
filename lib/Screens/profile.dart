import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD8EFEF),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            '     240\nListeners',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff7ccccc),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            '     300\nListening',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff7ccccc),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
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
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Emoji_u2665.svg/1200px-Emoji_u2665.svg.png'),
                            title: Text(
                              'Camilla',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xff7ccccc),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              '2020 wasnt bad',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Emoji_u2665.svg/1200px-Emoji_u2665.svg.png'),
                            title: Text(
                              'Ada',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xff7ccccc),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              'Has anyone heard of this band?',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Emoji_u2665.svg/1200px-Emoji_u2665.svg.png'),
                            title: Text(
                              'Christy',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xff7ccccc),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              'I had a talk with an old lady...',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Emoji_u2665.svg/1200px-Emoji_u2665.svg.png'),
                            title: Text(
                              'Jaden',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xff7ccccc),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              'Went on a camping trip',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Emoji_u2665.svg/1200px-Emoji_u2665.svg.png'),
                            title: Text(
                              'Maya',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xff7ccccc),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              'Happy Valentines\'s Day',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            trailing: Icon(Icons.more_vert),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
