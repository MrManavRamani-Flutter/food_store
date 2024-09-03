// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, must_be_immutable, avoid_print
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "_..",
          style: TextStyle(
            letterSpacing: 15,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            width: 40,
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: pro_info(),
    );
  }
}

class pro_info extends StatefulWidget {
  const pro_info({super.key});

  @override
  State<pro_info> createState() => _pro_infoState();
}

class _pro_infoState extends State<pro_info> {
  int qty = 1;
  int total = 1;

  @override
  Widget build(BuildContext context) {
    Map? data = ModalRoute.of(context)?.settings.arguments as Map?;

    void addNumber() {
      setState(() {
        if (9 > qty) {
          total = ++qty;
        }
      });
    }

    void minNumber() {
      setState(() {
        if (qty > 1) {
          print("$total $qty");
          total = --qty;
        }
      });
    }

    return Stack(
      alignment: Alignment(0, 1),
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment(0, 1),
                  children: [
                    Container(
                      height: 200,
                      width: 430,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(45),
                          ),
                          color: Colors.white),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment(0, 0),
                        children: [
                          Positioned(
                            top: -130,
                            left: 85,
                            child: SizedBox(
                              height: 230,
                              width: 230,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green,
                                      spreadRadius: 5,
                                      blurRadius: 100,
                                    )
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 100,
                                  foregroundImage:
                                      AssetImage('img/${data?["image"]}'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 160,
                            top: 135,
                            child: Container(
                              alignment: Alignment(0, 0),
                              width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35),
                                  ),
                                  color: Colors.green),
                              child: Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      minNumber();
                                      setState(() {});
                                    },
                                    child: Text(
                                      ((qty) > 1) ? "-" : " ",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 10),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "$qty",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 10),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      addNumber();
                                      setState(() {});
                                    },
                                    child: Text(
                                      (9 > qty) ? "+" : " ",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 10),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 491,
                width: double.infinity,
                padding: EdgeInsets.all(25),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data?["name"]}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "fresh Avocado, shrimps salad with lettuce green mix, cherry tomatoes, herbs and olive oil, lemon dressing. healthy food...",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black38,
                                ),
                              ),
                              TextSpan(
                                text: "Read More",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          // Icons.............................................
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 30,
                            ),
                            Text(
                              " ${data?["rating"]}",
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Icon(
                              Icons.local_fire_department,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Text(
                              " 100 Kcal",
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Icon(
                              Icons.alarm,
                              color: Colors.red,
                              size: 30,
                            ),
                            Text(
                              " 5-10 Min",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Ingradients",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.black12,
                                ),
                                child: Text(
                                  "\u{1F990}",
                                  style: TextStyle(fontSize: 25),
                                )),
                            Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.black12,
                                ),
                                child: Text(
                                  "\u{1F345}",
                                  style: TextStyle(fontSize: 25),
                                )),
                            Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.black12,
                                ),
                                child: Text(
                                  "\u{1FAD2}",
                                  style: TextStyle(fontSize: 25),
                                )),
                            Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.black12,
                                ),
                                child: Text(
                                  "\u{1F951}",
                                  style: TextStyle(fontSize: 25),
                                )),
                            Container(
                                alignment: Alignment(0, 0),
                                margin: EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.black12,
                                ),
                                child: Text(
                                  "\u{1F96C}",
                                  style: TextStyle(fontSize: 25),
                                )),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Map map1 = {
                            "name": data?["name"],
                            "img": data?["image"],
                            // "cat": data?["category"],
                            "price": data?["price"],
                            "rating": data?["rating"],
                            "qty": qty,
                          };
                          // Cart_List.add(map1) as List;
                          // print(Cart_List);
                          Navigator.pushNamed(
                            context,
                            "cartPage",
                            arguments: map1,
                          );
                        },
                        child: Container(
                          height: 70,
                          margin: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          alignment: Alignment(0, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.green),
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
