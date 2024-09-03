// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';

class CartDesign extends StatefulWidget {
  String? name;
  String? category;
  num? price;
  String? img;
  int? min;
  num? rating;

  CartDesign(
      {super.key,
      this.name,
      this.category,
      this.img,
      this.rating,
      this.min,
      this.price});

  @override
  State<CartDesign> createState() => _CartDesignState();
}

class _CartDesignState extends State<CartDesign> {
  int? qty;
  @override
  Widget build(BuildContext context) {
    Map? data = ModalRoute.of(context)?.settings.arguments as Map?;
    widget.category = data?["category"];
    widget.name = data?["name"];
    widget.img = data?["img"];
    widget.price = data?["price"];
    widget.rating = data?["rating"];
    widget.min = data?["min"];
    qty = data?["qty"];
    print(data);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
      ),
      body: Container(
        alignment: Alignment(0, 1),
        height: double.infinity,
        width: double.infinity,
        child: Container(
          height: 700,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CartPro(
                    name: widget.name,
                    cate: widget.category,
                    img: widget.img,
                    price: widget.price,
                    qty: qty),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.only(left: 7),
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.black12,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.discount,
                            color: Colors.black38,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Promo Code",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment(0, 0),
                            height: 60,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Colors.green,
                            ),
                            child: Text(
                              "Apply",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "SubTotal",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                "\$12.00",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Colors.black12,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Delivery",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                "\$3.50",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Colors.black12,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "\$15.50",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment(0, 0),
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Text(
                              "CHECKOUT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
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
        ),
      ),
    );
  }
}

class CartPro extends StatefulWidget {
  num? per_pro_price = 12;
  int n = 1;
  String? img;
  String? name;
  String? cate;
  num? price;
  int? qty;
  CartPro({super.key, this.name, this.img, this.cate, this.qty, this.price});

  @override
  State<CartPro> createState() => _CartProState();
}

class _CartProState extends State<CartPro> {
  num? per_pro_total;

  void addNumber() {
    setState(() {
      if (9 > widget.n) {
        widget.n++;
        setState(() {
          per_pro_total = widget.per_pro_price ?? 1 * widget.n;
        });
      }
      // numberList.add(lastNumber + 1);
    });
  }

  void minNumber() {
    setState(() {
      if (widget.n > 1) {
        widget.n--;
        per_pro_total = widget.per_pro_price ?? 1 * widget.n;
      }
      // numberList.add(lastNumber + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(left: 7),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green,
                            blurRadius: 100,
                            spreadRadius: -1,
                            blurStyle: BlurStyle.inner),
                      ],
                    ),
                    child: CircleAvatar(
                      foregroundImage: AssetImage('img/${widget.img}'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "${widget.name}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$${widget.per_pro_price}",
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () => minNumber(),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  (widget.n > 1)
                                      ? Icons.remove
                                      : Icons.block_flipped,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "${widget.n}",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => addNumber(),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  (9 > widget.n)
                                      ? Icons.add
                                      : Icons.block_flipped,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "\$$per_pro_total",
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
