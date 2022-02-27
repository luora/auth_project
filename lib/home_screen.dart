import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import 'add_service_provider.dart';
import 'authservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> pages = [Text('home'), Text('services'), Text('profile')];

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      body: Center(child: pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(label: 'services', icon: Icon(Icons.bookmark)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onTap,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('provide \n service'),
        onPressed: () {
          // navigate to service provider set up
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RegisterServiceProvider();
          }));
        },
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


// Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const Text('home '),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 //Navigator.pushNamed(context, '/login');
//                 _authService.signOut();
//               },
//               child: Text('logout'),
//             ),
//           )
//         ],
//       ),