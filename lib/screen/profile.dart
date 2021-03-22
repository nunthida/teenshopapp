import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String name, user;

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
          user = event.email;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: 80,
            ),
          ),
          Divider(
            height: 90,
            color: Colors.deepOrange,
          ),
          Text('NAME',
            style: TextStyle(
                color: Colors.black, letterSpacing: 2
            ),),
          SizedBox(
            height: 10,
          ),

          Text(name == null ? 'Name' : name,
            style: TextStyle(
                color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold
            ),),
          SizedBox( height: 30,),
          Text('Email',
            style: TextStyle(
                color: Colors.black, letterSpacing: 2
            ),),
          SizedBox(
            height: 10,
          ),
          Text(user == null ? 'email' : user, style: TextStyle(
              color: Colors.deepOrange, fontSize: 18, letterSpacing: 1
          ),),
        ],
      ),
    );
  }
}
