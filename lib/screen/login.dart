import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teen_shop_app/utility/dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: ListView(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                      child: Text(
                        'ຍິນດີຕ້ອງຮັບ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0XFFF8F8F8),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => user = value.trim(),
                      decoration: const InputDecoration(
                        hintText: 'ຊື່ຜູ້ໃຊ້',
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            top: 20, left: 15, right: 15, bottom: 15),
                      ),
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0XFFF8F8F8),
                    ),
                    child: TextFormField(
                      onChanged: (value) => password = value.trim(),
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'ລະຫັດຜ່ານ',
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            top: 20, left: 15, right: 15, bottom: 15),
                      ),
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: InkWell(
                        child: Text(
                          'ລືມລະຫັດຜ່ານ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    child: MaterialButton(
                      minWidth: (200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.deepOrange,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'ເຂົ້າສູ່ລະບົບ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () {
                        if ((user?.isEmpty ?? true) ||
                            (password?.isEmpty ?? true)) {
                          normalDialog(context, 'ຜິດພາດ',
                              'ຕື່ມຂໍ້ມູນໃຫ້ຄົບກ່ອນ');
                        } else {
                          checkAuthen();
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: Text(
                              'ຍັງບໍ່ມີບັນຊີບໍ?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Center(
                            child: InkWell(
                              child: Text(
                                'ລົງທະບຽນ',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                            ),
                          ),
                        ),
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
  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false))
          .catchError((onError) => normalDialog(context, onError.code, onError.message));
    });
  }
}
