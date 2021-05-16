import 'package:flutter/material.dart';
import 'package:day5_meditation_app/l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'package:day5_meditation_app/utils/icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<String> images = [
  'assets/images/card1.png',
  'assets/images/card2.png',
  'assets/images/card3.png'
];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 0.25,
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/homeimg.png',
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(
                            l10n.meditationTitle,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                        Text(
                          l10n.loremDescription,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.75,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.64,
                  padding: EdgeInsets.only(
                    right: 0,
                    left: MediaQuery.of(context).size.width * 0.075,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        l10n.recommendedPlaylist,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.green.shade900),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0, right: 20),
                              child: Image.asset(
                                'assets/images/card1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0, right: 20),
                              child: Image.asset(
                                'assets/images/card2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0, right: 20),
                              child: Image.asset(
                                'assets/images/card1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        l10n.topCreator,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.green.shade900),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 0, right: 20),
                              child: Image.asset(
                                'assets/images/creatorcard.png',
                                width: MediaQuery.of(context).size.width * 0.72,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0, right: 20),
                              child: Image.asset(
                                'assets/images/creatorcard.png',
                                width: MediaQuery.of(context).size.width * 0.72,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0, right: 20),
                              child: Image.asset(
                                'assets/images/creatorcard.png',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * 0.72,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.orange,
        selectedIconTheme: IconThemeData(color: Colors.green.shade900),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.film_play,
              size: 30,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
