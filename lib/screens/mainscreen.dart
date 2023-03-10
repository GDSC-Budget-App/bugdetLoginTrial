import 'package:flutter_signin_example/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int _selectedIndex = 1;

  void _navigateBottomBar(int index) {
    if(_selectedIndex == 1 && index == 1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen()));
    }
    else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //         child: ElevatedButton(
  //           child: Text("Logout"),
  //           onPressed: () {
  //             FirebaseAuth.instance.signOut().then((value) {
  //               print("Signed Out");
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => SignInScreen()));
  //             });
  //
  //
  //           },
  //         )
  //     ),
  //   );
  // }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Event',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.amber,
          ),
        ],
        onTap: _navigateBottomBar,
      ),
      body: Center(
          child: ElevatedButton(
            child: Text("Logout"),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });


            },
          )
      ),
    );
  }

}
