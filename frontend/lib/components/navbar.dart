import 'dart:developer';
import 'package:aaryapay/screens/Home/home_screen.dart';
import 'package:aaryapay/screens/Payments/payments.dart';
import 'package:aaryapay/screens/TransactionHistory/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      clipBehavior: Clip.none,
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      // padding: const EdgeInsets.only(top: 6, left: 15, right: 15),
      // margin: const EdgeInsets.only(top: 20),
      alignment: Alignment(-0.5, 0.5),

      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        color: Theme.of(context).colorScheme.background,
      ),
      // border: Border.all(color: Colors.black)),
      width: size.width,
      height: size.height * 0.08,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black54)),
                    width: size.width * 0.20,
                    // height: 100,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              HomeScreen(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/home.svg",
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black54)),
                    width: size.width * 0.20,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              Payments(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/payments.svg",
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              "Payments",
                              
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            TransactionHistory(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    ),
                    child: Container(
                      child: SizedBox(
                        // decoration:
                        //     BoxDecoration(border: Border.all(color: Colors.black54)),
                        width: size.width * 0.20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/statements.svg",
                              width: 25,
                              height: 25,
                            ), 
                          
                            Text(
                              "Statements",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black54)),
                    width: size.width * 0.20,
                    // height: double.infinity,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              TransactionHistory(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SvgPicture.asset("assets/icons/home.svg"),
                            SvgPicture.asset(
                              "assets/icons/settings.svg",
                              width: 25,
                              height: 25,
                              color: colorScheme.primary,
                            ),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            // height: 100,
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: Positioned(
                bottom: 30,
                left: size.width / 2 - 30,
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: kElevationToShadow[4],
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(50),
                          top: Radius.circular(50))),
                  child: SvgPicture.asset(
                    "assets/icons/qrcode.svg",
                    width: 25,
                    height: 25,
                    color: colorScheme.background,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}