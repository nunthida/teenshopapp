import 'package:flutter/material.dart';

class ProductSlide extends StatefulWidget {
  @override
  _ProductSlideState createState() => _ProductSlideState();
}

class _ProductSlideState extends State<ProductSlide> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Catalog(
              image_location: 'assets/images/bags_1.jpg',
              image_caption: 'Mini flap bag with top handle',
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Catalog(
              image_location: 'assets/images/bags_1.jpg',
              image_caption: 'Mini flap bag with top handle',
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Catalog(
              image_location: 'assets/images/bags_3.jpg',
              image_caption: 'Small Hobo Bag',
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child:  Catalog(
              image_location: 'assets/images/bags_2.jpg',
              image_caption: 'Mini flap bag with top handle',
            ),
          ),
        ),
      ],
    );
  }
}

class Catalog extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Catalog({
    this.image_location,
    this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          //margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          width: 350, height: 300,
          child: ListTile(
              title: Image.asset(
                image_location,
                height: 250,
                fit: BoxFit.cover,
              ),
              subtitle:
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  image_caption,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              )
          ),
        ),
      ),
    );
  }
}


