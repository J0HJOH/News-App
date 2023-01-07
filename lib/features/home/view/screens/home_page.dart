import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../search/view/screens/search_page.dart';
import 'articles_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        actions:[
          IconButton(
              onPressed: (){},
              icon: const FaIcon(FontAwesomeIcons.ellipsisVertical)
          )
        ],
      ),
      body: IndexedStack(
        children: [
          ArticlesPage(),
          SearchPage()
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          //Updates Ui by rebuilding the state when changes are made          setState(()=> _currentIndex = index);
        },
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.searchengin),
            label: "Search"
          )
        ],
      ),
    );
  }
}
