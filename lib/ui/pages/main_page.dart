import 'package:flutter/material.dart';
import 'package:todo/ui/components/otp_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Column(
        children: [

          Expanded(child: OtpWidget(onSmsCodeApply: () {}, onChanged: (onChanged) {}, title: 'title', phoneNumber: 'phoneNumber', onResend: () {}, buttonText: 'buttonText'))
          // TextFormField(
          //   focusNode: _focus,
          //   decoration: InputDecoration(hintText: 'Search...'),
          //   onTapOutside: (v) {
          //     _focus.unfocus();
          //   },
          //   onTap: () {
          //     context.pushNamed(R.search);
          //   },
          // )
        ],
      )),
    );
  }
}
