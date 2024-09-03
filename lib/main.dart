import 'package:app_mainai/util.dart';
import 'package:flutter/material.dart';

import 'Screen/pro_cart.dart';
import 'Screen/pro_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "detailPage": (context) => const DetailProduct(),
        "cartPage": (context) => CartDesign(),
      },
      color: Colors.green,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 35,
          title: const Text(
            "Habiganj City",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: const Icon(
            Icons.location_on_rounded,
            color: Colors.black,
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.black12, shape: BoxShape.circle),
              child: const Icon(
                Icons.sort,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Design....................
              HeaderDesign(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderDesign extends StatefulWidget {
  const HeaderDesign({super.key});

  @override
  State<HeaderDesign> createState() => HeaderDesignState();
}

class HeaderDesignState extends State<HeaderDesign> {
  Map clist = Pro_List[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Find The ",
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w300, letterSpacing: 2),
            children: [
              TextSpan(
                text: "Best\nFood",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: " Around you"),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.black54),
                Text(
                  "  Search Your Favorite Food",
                  style: TextStyle(fontSize: 17),
                ),
                Spacer(),
                Icon(
                  Icons.search_off_sharp,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            Text.rich(
              TextSpan(
                text: "Find",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "  5km",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: Colors.red,
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Category :......................
        Row(
          children: Pro_List.map((e) {
            String? cat = e["cat_name"];
            String? catData = clist["cat_name"];
            bool selected = cat == catData;
            // print(cat);
            return InkWell(
              onTap: () {
                clist = e;
                setState(() {});
              },
              child: CatDesign(catName: cat, selected: selected),
            );
          }).toList(),
        ),

        // Product Cart..............................
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: (clist["product_list"] as List<Map>).map((e) {
              return ProductCart(productMap: e);
            }).toList(),
          ),
        ),
        // Product Cart End..................
      ],
    );
  }
}

// Products Design....................................................
class ProductCart extends StatelessWidget {
  final Map? productMap;

  const ProductCart({super.key, this.productMap});

  @override
  Widget build(BuildContext context) {
    // print(product_map?["image"]);
    return InkWell(
      onTap: () {
        // print(product_map?["image"]);
        Navigator.pushNamed(
          context,
          "detailPage",
          arguments: productMap,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 319,
          width: 230,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              color: Colors.black12),
          padding: const EdgeInsets.only(top: 20),
          // product Info..............
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Like Icon.............
              Container(
                alignment: Alignment.topRight,
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              //  Product Image..............

              Container(
                width: 300,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'img/${productMap?["image"]}',
                    ), // Replace with your product image
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Product Name......
              Center(
                child: Text(
                  '${productMap?["name"]}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              // Time & Rate.....
              Row(
                children: [
                  // Min
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      '${productMap?["min"]} min',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black38),
                    ),
                  ),
                  const Spacer(),
                  // Star
                  const Icon(
                    Icons.star_border_outlined,
                    color: Colors.yellow,
                  ),
                  // Rate......
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Text(
                      '${productMap?["rating"]}',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black38),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Product Price - add to cart
              Row(
                children: [
                  // Price Of Product
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 35,
                    ),
                    child: Text(
                      '\$${productMap?["price"]}',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  const Spacer(),
                  // Icon Bottom Right
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "detailPage",
                        arguments: productMap,
                      );
                    },
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(25)),
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Category Design.................................................
class CatDesign extends StatefulWidget {
  final String? catName;
  final bool? selected;

  const CatDesign({super.key, this.catName, this.selected});

  @override
  State<CatDesign> createState() => _CatDesignState();
}

class _CatDesignState extends State<CatDesign> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: (widget.selected ?? true) ? Colors.green : Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.catName ?? "",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: (widget.selected ?? false) ? Colors.black : Colors.green),
        ),
      ),
    );
  }
}
