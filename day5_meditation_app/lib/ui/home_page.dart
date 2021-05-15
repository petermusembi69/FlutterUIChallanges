import 'package:flutter/material.dart';
import 'package:day5_meditation_app/l10n/l10n.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<String> images = [
  'assets/images/card1.png'
      'assets/images/card2.png'
      'assets/images/card3.png'
];

class _HomePageState extends State<HomePage> {
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
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Text(l10n.meditationTitle),
                  Text(l10n.meditationTitle)
                ],
              ),
            ),
          ),
          Text(l10n.meditationTitle),
          ListView.builder(
            itemCount: images.length,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return _buildCarousel(context, index ~/ 2);
              } else {
                return Divider();
              }
            },
          ),
          Text(l10n.meditationTitle),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.orange,
        height: 15,
        width: double.infinity,
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItem(context, carouselIndex, itemIndex);
        },
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Image.asset(
        images[itemIndex],
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
