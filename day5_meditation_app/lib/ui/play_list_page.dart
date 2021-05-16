import 'package:day5_meditation_app/utils/_index.dart';
import 'package:flutter/material.dart';
import 'package:day5_meditation_app/l10n/l10n.dart';
import 'package:flutter/services.dart';


class PlayListPage extends StatefulWidget {
  PlayListPage({Key? key}) : super(key: key);

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
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

  List playList = [
    {'name': "Summer Romance", 'artist': "Leslie Cheung", 'duration': "4:38"},
    {
      'name': "Moonlight Sonata",
      'artist': "Giscard Rasquin",
      'duration': "22:16"
    },
    {
      'name': "Intergalactic Song",
      'artist': "Beastie Boys",
      'duration': "4:34"
    },
    {'name': "Hymn of the Forest", 'artist': "Dave Malloy", 'duration': "5:49"},
  ];
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 0.45,
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/playerimg.png',
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 30),
                          child: Text(
                            l10n.nowPlaying,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'HeartFelt Melody',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 2.0, bottom: 10),
                              child: Text(
                                'Moshe P. Weisblum',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.orange.shade300,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '10:45',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                CustomPaint(
                                  painter: PlayerPainter(),
                                  size: Size(MediaQuery.of(context).size.width * 0.55, double.minPositive),
                                ),
                                Text(
                                  '21:07',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
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
              heightFactor: 0.61,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade900,
                          ),
                          child: Icon(
                            Icons.fast_rewind,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 52,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade900,
                          ),
                          child: Icon(
                            Icons.fast_forward,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ]),
                    Text(
                      l10n.otherAudio,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                          color: Colors.green.shade900),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: ListView(
                        padding: EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        children: [
                          for (var i = 0; i < 4; i++) AudioCard(playList[i]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlayerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..color = Colors.black26;
    Paint trackPaint = Paint()
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..color = Colors.orange.withOpacity(0.9);

    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(size.width*0.5, 0), trackPaint);
    canvas.drawCircle(Offset(size.width*0.5, 0), 7, trackPaint);
  }

  @override
  bool shouldRepaint(PlayerPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PlayerPainter oldDelegate) => false;

}
