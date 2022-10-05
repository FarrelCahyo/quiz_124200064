import 'package:flutter/material.dart';
import 'groceries.dart';
import 'package:url_launcher/url_launcher.dart';

class detail extends StatefulWidget {
  final Groceries list;

  const detail({Key? key, required this.list}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  bool isSayur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSayur = !isSayur;
              });
            },
            icon:
                (isSayur) ? Icon(Icons.star) : Icon(Icons.star_outline),
          ),
          IconButton(
            onPressed: () {
              _launchURL(widget.list.productUrl);
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height) / 3,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.list.productImageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      // color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          widget.list.productImageUrls[index],
                          width: 200,
                          height: 210,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
                height: (MediaQuery.of(context).size.height) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Rp${widget.list.price},-",
                              style: TextStyle(
                                  color: (isSayur) ? Colors.red : Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Rata-rata Penilaian : \⭐ ${widget.list.reviewAverage}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Toko : ${widget.list.storeName}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                "Stock Tersisa : ${widget.list.stock}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                "Discount : ${widget.list.discount}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: (isSayur)
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                widget.list.description,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 1,
                )),
          ],
        ),
      ),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
