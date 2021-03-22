import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teen_shop_app/screen/productslide.dart';
import 'package:teen_shop_app/screen/productcatalog.dart';
import 'package:teen_shop_app/screen/profile.dart';
import 'package:teen_shop_app/screen/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name, email;

  @override
  void initState() {
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        drawer: buildDrawer(context),
        appBar: AppBar(
          title: Text('Teen Shop'),
          bottom: TabBar(
            tabs: [
              Tab(text: "ຂໍ້ມູນສ່ວນໂຕ"),Tab(text: "ສິນຄ້າແນະນຳ"),Tab(text: "ສິນຄ້າທັ້ງໝົດ"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            //RightPage
            buildProfile(),
            //mainPage
            buildHome(),
            //LeftPage
            buildProductSlide(),
          ],
        ),
      ),
    );
  }

  Container buildProductSlide() {
    return Container(
            child: ProductCatalog(),
          );
  }

  Container buildHome() {
    return Container(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 20, 0),
                  child: Text('ເປັນທີ່ນິຍົມ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 350,
                  child: ProductSlide(),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 20, 0),
                  child: Text('ມາໃໝ່', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              constraints: BoxConstraints.expand(height: 200),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/bags_1.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15),
                                                  bottomRight: Radius.circular(15))),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                child: Text('Mini flap bag with top handle',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal)),
                                              ),

                                              Container(
                                                child: Text('Grained Calfskin & Gold-Tone Metal',
                                                    style: TextStyle(fontSize: 12, color: Color(0xffD1D1D1))),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text('Color: White',
                                                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xffD1D1D1))),
                                                    ),
                                                    Container(
                                                      child: Text('Price: £3,480',
                                                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              constraints: BoxConstraints.expand(height: 200),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/bags_3.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15),
                                                  bottomRight: Radius.circular(15))),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                child: Text('Small Hobo Bag',
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal)),
                                              ),

                                              Container(
                                                child: Text('Calfskin, Lmitation Pearls & Gold-Tone Metal More...',
                                                    style: TextStyle(fontSize: 12, color: Color(0xffD1D1D1))),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text('Color: White',
                                                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xffD1D1D1))),
                                                    ),
                                                    Container(
                                                      child: Text('Price: £3,480',
                                                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              constraints: BoxConstraints.expand(height: 200),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/bags_4.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15),
                                                  bottomRight: Radius.circular(15))),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                child: Text('Chanel 19 Flap card holder',
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal)),
                                              ),

                                              Container(
                                                child: Text('Calfskin, Lmitation Pearls & Gold-Tone Metal More...',
                                                    style: TextStyle(fontSize: 12, color: Color(0xffD1D1D1))),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text('Color: White',
                                                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xffD1D1D1))),
                                                    ),
                                                    Container(
                                                      child: Text('Price: £3,480',
                                                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),

          );
  }

  Container buildProfile() {
    return Container(
            child: Profile(),
          );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              //buildListTileInformation(context),
              ListTile(
                leading: Icon(
                  Icons.shop_two_sharp,
                  color: Colors.teal,
                  size: 36,
                ),
                title: Text('ລາຍການສິນຄ້າທັ້ງໝົດ',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
                subtitle: Text(
                  'ເບິ່ງສິນຄ້າທັ້ງໝົດ',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                onTap: () {
                  //Navigator.pushNamed(context, '/information');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.teal,
                  size: 36,
                ),
                title: Text('ອອກຈາກລະບົບ',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
                subtitle: Text(
                  'ປິດການໃຊ້ງານ',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
          //buildSignOut(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.teal,
      ),
      accountName: Text(
        name == null ? 'Name' : name,
        style: TextStyle(fontSize: 18, color: Colors.deepOrange),
      ),
      accountEmail: Text(email == null ? 'email' : email),
      currentAccountPicture: Image.asset('assets/images/logo.png'),
    );
  }
}
