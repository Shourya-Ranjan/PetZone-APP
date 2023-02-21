import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'dart:ui' as ui;

class SnappingList extends StatefulWidget {
  const SnappingList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SnappingListState createState() => _SnappingListState();
}

class Product {
  final String imagePath;
  final String title;
  final double cost;
  final int reviewCount;
  Product(this.imagePath, this.title, this.cost, this.reviewCount);
}

class _SnappingListState extends State<SnappingList> {
  List<Product> productList = [
    Product('assets/images/photu/black_chair.jpg', 'Black Chair', 90, 15),
    Product('assets/images/photu/copper_lamp.jpg', 'Copper Lamp', 10, 25),
    Product('assets/images/photu/blue_sofa.jpg', 'Awesome Sofa', 100, 70),
    Product('assets/images/photu/orange_lamp.jpg', 'Orange Lamp', 9, 50),
    Product('assets/images/photu/pink_chair.jpg', 'Comfortable Chair', 15, 5),
    Product('assets/images/photu/white_chair.jpg', 'Simple Chair', 20, 7),
    Product('assets/images/photu/white_lamp.jpg', 'Nice Lamp', 14, 10),
    Product('assets/images/photu/yellow_planter.jpg', 'Awesome Planter', 9, 25),
    Product('assets/images/photu/white_sofa.jpg', 'Blue & white Sofa', 50, 43),
    Product('assets/images/photu/white_planter.jpg', 'White Planter', 5, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 600,
      child: ScrollSnapList(
        itemBuilder: _buildListItem,
        itemCount: productList.length,
        itemSize: 150,
        onItemFocus: (index) {},
        dynamicItemSize: true,
      ),
    ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return Column(children: [
      SizedBox(
          width: 150,
          height: 300,
          child: Card(
            elevation: 10,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.title,
                    style: TextStyle(
                        fontSize: 15,
                        foreground: Paint()
                          ..shader = ui.Gradient.linear(
                            const Offset(0, 20),
                            const Offset(150, 20),
                            <Color>[
                              Colors.red,
                              Colors.yellow,
                            ],
                          )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.cost}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${product.reviewCount} Reviews',
                          style: const TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      // SizedBox(
      //   width: 150,
      //   height: 250,
      //   child: Card(
      //     elevation: 10,
      //     child: ClipRRect(
      //       borderRadius: const BorderRadius.all(Radius.circular(10)),
      //       child: Column(
      //         children: [
      //           Image.asset(
      //             product.imagePath,
      //             fit: BoxFit.cover,
      //             width: 150,
      //             height: 180,
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             product.title,
      //             style: TextStyle(
      //                 fontSize: 15,
      //                 foreground: Paint()
      //                   ..shader = ui.Gradient.linear(
      //                     const Offset(0, 20),
      //                     const Offset(150, 20),
      //                     <Color>[
      //                       Colors.red,
      //                       Colors.yellow,
      //                     ],
      //                   )),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 8),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   '\$${product.cost}',
      //                   style: const TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //                 Text(
      //                   '${product.reviewCount} Reviews',
      //                   style: const TextStyle(color: Colors.blue),
      //                 )
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // )
    ]);
  }
}
