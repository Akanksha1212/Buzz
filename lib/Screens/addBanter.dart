import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:buzz/record/cloud_record_list_view.dart';
import 'package:buzz/record/feature_buttons_view.dart';

class AddBanter extends StatefulWidget {
  @override
  _AddBanterState createState() => _AddBanterState();
}

class _AddBanterState extends State<AddBanter> {
  List<Reference> references;

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
            Container(
              margin: EdgeInsets.all(0),
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/path.png', height: 200, width: 200),
            ),
            Text(
              'Your Banters',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Color(0xff7ccccc),
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 4,
              child: references == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
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

  Future<void> _onUploadComplete() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();
    setState(() {
      references = listResult.items;
    });
  }
}
