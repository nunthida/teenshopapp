import 'package:flutter/material.dart';

class ProductCatalog extends StatefulWidget {
  @override
  _ProductCatalogState createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  var product_list = [
    {
      "name": "Mini White bag",
      "picture": "assets/images/bags_1.jpg",
      "old_price": 102,
      "price": 50,
    },
    {
      "name": "Mini chanel",
      "picture": "assets/images/bags_2.jpg",
      "old_price": 140,
      "price": 120,
    },
    {
      "name": "RH Bag",
      "picture": "assets/images/bags_3.jpg",
      "old_price": 180,
      "price": 100,
    },
    {
      "name": "Slin bag",
      "picture": "assets/images/bags_4.jpg",
      "old_price": 190,
      "price": 150,
    },
    {
      "name": "Mini Sling bag",
      "picture": "assets/images/bags_5.jpg",
      "old_price": 80,
      "price": 50,
    },
    {
      "name": "2.55 handbag",
      "picture": "assets/images/bags_6.jpg",
      "old_price": 1000,
      "price": 900,
    },
    {
      "name": "Mini flap bag",
      "picture": "assets/images/bags_7.jpg",
      "old_price": 1000,
      "price": 900,
    },
    {
      "name": "Mini flap bag",
      "picture": "assets/images/bags_8.jpg",
      "old_price": 1200,
      "price": 1050,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prod_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "\$$prod_price",
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text("\$$prod_old_price",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
