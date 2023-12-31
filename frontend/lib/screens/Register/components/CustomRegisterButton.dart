import 'package:aaryapay/screens/Register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton(
      {Key? key,
      this.label,
      this.onClick,
      this.width,
      this.height,
      this.borderRadius,
      this.actionLogo})
      : super(key: key);
  final String? label;
  final Function()? onClick;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? actionLogo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width ?? size.width * 0.6,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        height: height ?? 50,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            actionLogo ?? Container(),
            Text(
              label ?? "LOGIN",
              style: Theme.of(context).textTheme.titleLarge!.merge(
                  TextStyle(color: Theme.of(context).colorScheme.background)),
            ),
          ],
        ),
      ),
    );
  }
}
