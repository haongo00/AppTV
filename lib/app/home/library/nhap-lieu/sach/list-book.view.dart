import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListBookView extends StatefulWidget {
  @override
  _ListBookViewState createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff068189),
        foregroundColor: Colors.black,
        onPressed: () {
          Modular.link.pushNamed(HomeModule.newBookView);
          // Respond to button press
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green,
                    width: 130,
                    height: 3,
                  ),
                ),
                Text("Tổng số : 10000",
                    style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    width: 135,
                    height: 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ...List.generate(50, (index) {
              return Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.only(top : 8.0,right: 15.0,left: 15.0),
                color: (index % 2 == 0) ? Colors.grey.withOpacity(0.2) : Colors.teal.withOpacity(0.2),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {},
                  child: Container(
                    height: SizeConfig.blockSizeVertical*10,
                    child: Row(
                      children: [
                        Icon(
                          Icons.my_library_books_rounded,
                          color: Colors.green,
                          size: 25,
                        ),
                        SizedBox(width: 10.0),
                        Text("Toán Cao Cấp - 1001", style: TextStyle(color: Colors.black, fontSize: 17)),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
