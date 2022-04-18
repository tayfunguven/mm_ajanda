import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mm_ajanda/Views/calendar_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  const DashboardScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(189, 210, 182, 0.5),
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.userAlt),
            tooltip: 'Profile',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile')));
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.search),
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Search')));
            },
          ),
        ]

      ),
      drawer: const Drawer(
        child: Text('Test'),
      ),
      extendBody: true,
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
            icon: const FaIcon(FontAwesomeIcons.calendarAlt),
            selectedColor: const Color.fromRGBO(121, 135, 119, 1),
          ),
          /// Team
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.users),
            selectedColor: const Color.fromRGBO(121, 135, 119, 1),
          ),
        ],
      ),
      body: const CalendarScreen()
      // body: ListView(
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         height: 150,
      //         // color: Colors.amber[600],
      //         child: const Center(child: Text('Entry A')),
      //         decoration: BoxDecoration(
      //           color: Colors.amber[600],
      //           borderRadius: BorderRadius.circular(30.0),
      //           // border: Border.all(
      //           //   color: Colors.amber,
      //           // )
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         height: 150,
      //         // color: Colors.amber[600],
      //         child: const Center(child: Text('Entry B')),
      //         decoration: BoxDecoration(
      //           color: Colors.amber[500],
      //           borderRadius: BorderRadius.circular(30.0),
      //           // border: Border.all(
      //           //   color: Colors.amber,
      //           // )
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         height: 150,
      //         // color: Colors.amber[600],
      //         child: const Center(child: Text('Entry C')),
      //         decoration: BoxDecoration(
      //           color: Colors.amber[300],
      //           borderRadius: BorderRadius.circular(30.0),
      //           // border: Border.all(
      //           //   color: Colors.amber,
      //           // )
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         height: 150,
      //         child: const Center(
      //           child: Text('Entry D'),
      //         ),
      //         decoration: BoxDecoration(
      //           color: Colors.amber[100],
      //           borderRadius: BorderRadius.circular(30.0)
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
