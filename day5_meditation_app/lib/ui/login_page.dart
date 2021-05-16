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
            child: FractionallySizedBox(
              heightFactor: 0.75,
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        child: Text(
                          l10n.meditateTitle,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: 55,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        l10n.meditationApp,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 33,
                          color: Colors.white.withOpacity(0.9),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          padding: EdgeInsets.only(
                              left: 30, right: 30, top: 30, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  suffixIcon: Icon(Icons.mail),
                                  hintText: l10n.email,
                                  fillColor: Colors.black
                                      .withBlue(238)
                                      .withGreen(220)
                                      .withRed(213),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  suffixIcon: Icon(Icons.lock),
                                  hintText: l10n.password,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  fillColor: Colors.black
                                      .withBlue(238)
                                      .withGreen(220)
                                      .withRed(213),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
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
                              Column(
                                children: [
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
                            ],
                          ),
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
