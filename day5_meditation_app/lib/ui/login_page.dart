import 'package:flutter/material.dart';
import 'package:day5_meditation_app/l10n/l10n.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 0.70,
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/loginimg.png',
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top:198.0),
                child: Container(
                  height: double.maxFinite,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.meditateTitle,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        l10n.meditationApp,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        l10n.loremDescription,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.mail),
                                hintText: l10n.email,
                                fillColor: Colors.blue.withOpacity(0.5),
                                focusColor: Colors.blue.withOpacity(0.5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.lock),
                                hintText: l10n.password,
                                fillColor: Colors.blue.withOpacity(0.5),
                                focusColor: Colors.blue.withOpacity(0.5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.orange,
                              minWidth: double.maxFinite,
                              child: Text(
                                l10n.login,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(l10n.doNotHaveAccount),
                            Text(
                              l10n.createAccount,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.orange,
        height: 15,
        width: double.infinity,
      ),
    );
  }
}
