import 'package:aaryapay/constants.dart';
import 'package:aaryapay/global/authentication/authentication_bloc.dart';
import 'package:aaryapay/global/bloc/data_bloc.dart';
import 'package:aaryapay/helper/utils.dart';
import 'package:aaryapay/screens/Login/bloc/two_fa_bloc.dart';
import 'package:aaryapay/screens/Login/components/register_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginTwoFA extends StatelessWidget {
  const LoginTwoFA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var storage = const FlutterSecureStorage();

    return BlocProvider(
      create: (context) => TwoFaBloc(),
      child: BlocConsumer<TwoFaBloc, TwoFaState>(
        listener: (context, state) async {
          if (state.status == FAStatus.success) {
            context.read<AuthenticationBloc>().add(LoggedIn());
            if (context.read<AuthenticationBloc>().state.loaded) {
              String? token = await storage.read(key: "token");
              bool isPrimary = await storage.read(key: "isPrimary") == "true";
              // ignore: use_build_context_synchronously
              context
                  .read<DataBloc>()
                  .add(UserAuthenticatedEvent(token!, isPrimary));
            }
          }
        },
        builder: (context, state) => RegisterWrapper(
          backButton: true,
          backButttonFunction: () => {
            Utils.mainAppNav.currentState!.pop(context),
          },
          title: "Two Factor Authentication",
          actionButtonLabel: "Submit",
          actionButtonFunction: () => context.read<TwoFaBloc>().add(
                Authenticate2FA(),
              ),
          children: _midsection(context, size),
        ),
      ),
    );
  }

  Widget _midsection(BuildContext context, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Authenticate",
              style: Theme.of(context).textTheme.displaySmall!.merge(
                    TextStyle(
                        height: 1.8,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary),
                  ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter the 6 digit code displayed by your Two Factor Authentication Application",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        TextStyle(
                            height: 1.8,
                            // fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: PinCodeTextField(
            keyboardType: TextInputType.number,
            length: 6,
            hapticFeedbackTypes: HapticFeedbackTypes.light,
            textStyle:
                TextStyle(color: Theme.of(context).colorScheme.onBackground),
            // obscureText: true,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 65,
              fieldWidth: 50,
              inactiveColor: Theme.of(context).colorScheme.primary,
              activeFillColor: Theme.of(context).colorScheme.background,
            ),
            // activeColor: Theme.of(context).colorScheme.secondary),
            animationDuration: const Duration(milliseconds: 300),
            // backgroundColor: Colors.blue.shade50,
            // enableActiveFill: true,
            // errorAnimationController: errorController.add(ErrorAnimationType.shake);,
            // controller: textEditingController,
            onCompleted: (value) {
              context.read<TwoFaBloc>().add(FATokenChanged(
                    value,
                    true,
                  ));
            },
            onChanged: (value) {
              // setState(() {
              //   currentText = value;
              // });
            },
            beforeTextPaste: (text) {
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
            appContext: context,
          ),
        ),
      ],
    );
  }
}
