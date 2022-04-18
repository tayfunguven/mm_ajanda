import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mm_ajanda/Views/Frames/home_frame.dart';
import 'package:mm_ajanda/Views/Frames/message_frame.dart';
import 'package:mm_ajanda/Views/Frames/report_frame.dart';
import 'package:mm_ajanda/Views/Frames/task_frame.dart';

class HomeScreen extends StatefulWidget {
  final int currentIndex;
  const HomeScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;
  late String _title;

  static const List<Widget> _pages = <Widget>[
    HomeFrame(),
    MessageFrame(),
    TaskFrame(),
    ReportFrame(),
    // GroupFrame(),
  ];

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    _title = 'Home';
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch(index) {
        case 0: { _title = 'Home'; }
        break;
        case 1: { _title = 'Messages'; }
        break;
        case 2: { _title = 'Tasks'; }
        break;
        case 3: { _title = 'Projects'; }
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Center(child: Text(_title, textAlign: TextAlign.center,)),
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell),
            tooltip: 'Notifications',
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications'))
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Signed In As'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(
                user.email!,
                style: const TextStyle(color: Colors.black54),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
                title: const Text('Log out'),
                onTap: () => FirebaseAuth.instance.signOut()
            ),
          ],
        ),
      ),
      body: SafeArea(
        child:  _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: const Color.fromRGBO(246, 242, 237, 1.0),
        marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        paddingR: const EdgeInsets.all(0.1),
        currentIndex: _currentIndex,
        dotIndicatorColor: Colors.transparent,
        unselectedItemColor: Colors.grey[300],
        // enableFloatingNavBar: false,
        onTap: _onItemTapped,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.home),
            selectedColor: const Color.fromRGBO(121, 135, 119, 1),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.inbox),
            selectedColor: const Color.fromRGBO(121, 135, 119, 1),
          ),

          /// Search
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.thumbtack),
            selectedColor: const Color.fromRGBO(121, 135, 119, 1),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.notesMedical),
            selectedColor: const Color.fromRGBO(121, 135, 119, 1),
          ),
          /// Team
          // DotNavigationBarItem(
          //   icon: const FaIcon(FontAwesomeIcons.users),
          //   selectedColor: const Color.fromRGBO(121, 135, 119, 1),
          // ),
        ],
      ),
    );
  }
}
