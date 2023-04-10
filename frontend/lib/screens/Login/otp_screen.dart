import 'package:aaryapay/components/CustomTextField.dart';
import 'package:aaryapay/screens/Home/home_screen.dart';
import 'package:aaryapay/screens/Login/components/login_wrapper.dart';
import 'package:aaryapay/screens/Login/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginWrapper(
      children: _midsection(context, size),
      backButton: true,
      actionButtonLabel: "SUBMIT",
      backButttonFunction: () => {Navigator.pop(context)},
      actionButtonFunction: () => {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => HomeScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        ),
      },
    );
  }

  Widget _midsection(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          child: Text(
            "Enter OTP",
            style: Theme.of(context).textTheme.headlineMedium!.merge(
                  TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary),
                ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please enter the 6 digit code sent to: ",
              style: Theme.of(context).textTheme.bodySmall!.merge(
                    TextStyle(
                        // fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary),
                  ),
            ),
            Text(
              "aaryapay@aaryapay.com",
              style: Theme.of(context).textTheme.bodySmall!.merge(
                    TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary),
                  ),
            ),
          ],
        ),
        PinCodeTextField(
          length: 6,
          hapticFeedbackTypes: HapticFeedbackTypes.light,
          textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          // obscureText: true,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 65,
            fieldWidth: 50,
            inactiveColor: Theme.of(context).colorScheme.primary,
            activeFillColor: Colors.white,
          ),
          // activeColor: Theme.of(context).colorScheme.secondary),
          animationDuration: Duration(milliseconds: 300),
          // backgroundColor: Colors.blue.shade50,
          // enableActiveFill: true,
          // errorAnimationController: errorController.add(ErrorAnimationType.shake);,
          // controller: textEditingController,
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            print(value);
            // setState(() {
            //   currentText = value;
            // });
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
          appContext: context,
        )
      ],
    );
  }
}