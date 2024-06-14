import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'incoming_items_screen.dart';
import 'outgoing_items_screen.dart';
import 'stock_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        title: 'Aplikasi Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegistrationScreen(),
          '/incoming_items': (context) => IncomingItemsScreen(),
          '/outgoing_items': (context) => OutgoingItemsScreen(),
          '/stock': (context) => StockScreen(),
          '/profile': (context) => ProfileScreen(
              username: 'Nama Pengguna', email: 'contoh@gmail.com'),
        },
      ),
    );
  }
}

class UserData with ChangeNotifier {
  String username = '';
  String email = '';

  void updateUser(String name, String mail) {
    username = name;
    email = mail;
    notifyListeners();
  }
}
