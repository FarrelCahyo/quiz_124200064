import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan1/halaman2.dart';
import 'groceries.dart';

class Sayur extends StatefulWidget {
  const Sayur({Key? key}) : super(key: key);

  @override
  State<Sayur> createState() => _SayurState();
}

class _SayurState extends State<Sayur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Farrel"),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            final Groceries list = groceryList[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detail(list: list)));
              },
              child: Card(
                elevation: 50,
                shadowColor: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 2568 / 2568,
                      child: Container(
                        // height: 80,
                        // width: 80,
                        child: Image.network(
                          list.productImageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Text(
                            list.name,
                            style: TextStyle(
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ],
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            list.storeName,
                            style: TextStyle(shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ], fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: groceryList.length,
        ));
  }
}