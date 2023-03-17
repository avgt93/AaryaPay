import 'package:aaryapay/screens/Home/components/recent_card.dart';
import 'package:flutter/material.dart';
import 'package:aaryapay/screens/Home/components/send_money_card.dart';


class Midsection extends StatelessWidget {
  Midsection({
    super.key,
    required this.size,
  });
  final Size size;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.7,
      child: Container(
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SendMoneyCard(),
              
              RecentCard(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
