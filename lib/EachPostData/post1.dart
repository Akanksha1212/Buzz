import 'package:buzz/EachPostData/audioWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:buzz/record/cloud_record_list_view.dart';
import 'package:buzz/record/feature_buttons_view.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:buzz/EachPostData/example_data.dart' as Example;

class Post1 extends StatefulWidget {
  @override
  _Post1State createState() => _Post1State();
}

class _Post1State extends State<Post1> {
  List<Reference> references;
  int _selectedIndex;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
      // final snackBar = SnackBar(content: Text('Liked'));
      // Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  @override
  void initState() {
    super.initState();
    _onUploadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD8EFEF),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Conversation',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xff7ccccc),
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          'https://mindbodygreen-res.cloudinary.com/images/w_767,q_auto:eco,f_auto,fl_lossy/usr/RetocQT/sarah-fielding.jpg'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Ada1212',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff7ccccc),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: AudioPost(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: _selectedIndex != null && _selectedIndex == 1
                              ? Colors.redAccent
                              : Colors.grey,
                        ),
                        onPressed: () {
                          _onSelected(1);
                        }),
                    Text(
                      '250k Plays  | Popular \nComments',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xff7ccccc),
                      child: ListTile(
                        title: Row(
                          children: [
                            Image.network(
                              'https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg',
                              height: 30,
                              width: 30,
                            ),
                            Text(
                              'Rashmi |  Posted on 2021-02-13',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            color: Color(0xff7ccccc),
                            iconSize: 40,
                            icon: Icon(Icons.play_arrow),
                            onPressed: () {
                              _onUploadComplete();
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: references == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: LinearProgressIndicator(),
                                ),
                                Text('Fetching your old banters')
                              ],
                            )
                          : references.isEmpty
                              ? Center(
                                  child: Text('No banter added yet'),
                                )
                              : CloudRecordListView(
                                  references: references,
                                ),
                    ),
                    Expanded(
                      flex: 2,
                      child: FeatureButtonsView(
                        onUploadComplete: _onUploadComplete,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onUploadComplete() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();
    setState(() {
      references = listResult.items;
    });
  }
}
