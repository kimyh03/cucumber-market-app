import 'package:cucumber_market_app/screens/chat/chat-list.dart';
import 'package:cucumber_market_app/screens/home/home.dart';
import 'package:cucumber_market_app/screens/post/post-create_or_edit.dart';
import 'package:cucumber_market_app/screens/profile/me/profile-me.dart';
import 'package:cucumber_market_app/screens/search/search.dart';
import 'package:cucumber_market_app/services/graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlService.client,
      child: MaterialApp(
        title: "MyApp",
        home: MyMain(),
      ),
    );
  }
}

class MyMain extends StatefulWidget {
  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    Search(),
    CreatePost(),
    ChatList(),
    MyProfile(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
        centerTitle: true,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text("Search")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.create), title: Text("Create")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), title: Text("Chat")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("Profile")),
          ]),
    );
  }
}
