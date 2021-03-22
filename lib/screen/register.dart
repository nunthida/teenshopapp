import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teen_shop_app/utility/dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, user, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ສະໝັກສະມາຊິກ'),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(
                    child: Text(
                      'ລົງທະບຽນ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    onChanged: (value) => name = value.trim(),
                    decoration: const InputDecoration(
                      hintText: 'ຊື່ຜູ້ໃຊ້',
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 15),
                    ),
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => user = value.trim(),
                    decoration: const InputDecoration(
                      hintText: 'ອີເມວ໌',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 15),
                    ),
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
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
                      contentPadding: EdgeInsets.only(
                          top: 20, left: 15, right: 15, bottom: 15),
                    ),
                    style: TextStyle(fontSize: 17),
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
                        'ສ້າງບັນຊີ',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      if ((name?.isEmpty ?? true) ||
                          (user?.isEmpty ?? true) ||
                          (password?.isEmpty ?? true)) {
                        normalDialog(context, 'ຜິດພາດ',
                            'ຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນກ່ອນ');
                      } else {
                        createAccountAndInsertInformation();
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
                            'ມີບັນຊີແລ້ວ?',
                            style:
                            TextStyle(fontSize: 15, color: Colors.teal),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Center(
                          child: InkWell(
                            child: Text(
                              'ເຂົ້າສູ່ລະບົບ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
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
      )
    );
  }
  Future<Null> createAccountAndInsertInformation() async {
    await Firebase.initializeApp().then((value) async {
      //print('## Firebase Initialize Success ==> $email, password ==> $password ##');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user, password: password)
          .then((value) async {
        await value.user
            .updateProfile(displayName: name)
            .then((value) => print('Update Profile Success'));
        Navigator.pushNamed(context, '/home');
      }).catchError((onError) =>
          normalDialog(context, onError.code, onError.message));
    });
  }
}
