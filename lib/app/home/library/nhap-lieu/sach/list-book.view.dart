import 'package:flutter/material.dart';

class ListBookView extends StatefulWidget {
  @override
  _ListBookViewState createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text("Tổng số : 10000",style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
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
            ...List.generate(5, (index) {
              return Card(
                margin: EdgeInsets.only(top: 5.0),
                color: (index % 2 == 0) ? Colors.grey.withOpacity(0.3) : Colors.teal.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(
                          Icons.my_library_books_rounded,
                          color: Colors.green,
                          size: 25,
                        ),
                        SizedBox(width: 10.0),
                        Text("Toán Cao Cấp - 1001",style: TextStyle(color: Colors.black, fontSize: 17)),
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
