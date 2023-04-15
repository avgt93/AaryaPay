import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SettingsTopBar extends StatelessWidget {
  const SettingsTopBar({
    Key? key,
    required this.label,
  })
      : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(15),
      height: size.height * 0.1,
      // decoration: BoxDecoration(
      //     // color: colorScheme.background,
      //     border: Border.all(color: Colors.amberAccent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Transform.rotate(
                angle: -math.pi,
                child: SvgPicture.asset("assets/icons/arrow2.svg",
                    width: 15, height: 15)),
          ),
          Text(
            label,
            style: textTheme.titleLarge,
          ),
          Container(
              // width: size.width * 0.1,
              ),
        ],
      ),
    );
  }
}
