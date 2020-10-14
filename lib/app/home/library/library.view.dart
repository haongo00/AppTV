import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal*20,
                    height: SizeConfig.blockSizeVertical*15,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal*50,
                    height: SizeConfig.blockSizeVertical*15,
                    child: Column(
                      children: [
                        Expanded(child: Container(
                          width: SizeConfig.blockSizeHorizontal*50,
                          height: SizeConfig.blockSizeVertical*5,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )),
                        SizedBox(height: 5.0),
                        Expanded(child: Container(
                          width: SizeConfig.blockSizeHorizontal*50,
                          height: SizeConfig.blockSizeVertical*5,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )),

                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ) ,
    );
  }
}
