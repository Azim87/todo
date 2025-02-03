import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

const int SMS_CODE_LENGTH = 4;

class OtpWidget extends StatefulWidget {
  const OtpWidget({
    super.key,
    required this.onSmsCodeApply,
    required this.onChanged,
    required this.title,
    required this.phoneNumber,
    required this.onResend,
    required this.buttonText,
    this.showResend = false,
  });

  final Function() onSmsCodeApply;
  final Function(String) onChanged;
  final Function() onResend;
  final String title;
  final String buttonText;
  final String phoneNumber;
  final bool showResend;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  bool showTimerText = false;
  final _pinController = TextEditingController();

  final int timerMaxSeconds = 59;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}:${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  Future<void> _startTimeout() async {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(
            () {
              currentSeconds = timer.tick;
              if (_pinController.text.length == SMS_CODE_LENGTH) {
                timer.cancel();
              }

              if (timer.tick >= timerMaxSeconds) {
                timer.cancel();
              }
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startTimeout();
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.blueGrey,
    child: Column(
          children: [
            const SizedBox(height: 22),
            // SvgPicture.asset(Assets.logo),
            Expanded(child: Container()),
            const SizedBox(height: 40),
            _buildSmsCodeTextSection(),
            const SizedBox(height: 12),
            _buildSmsCodePin(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_pinController.text.length != SMS_CODE_LENGTH) _buildTimerWidget(),
                    const SizedBox(height: 20),
                    if (!widget.showResend && currentSeconds == timerMaxSeconds) _buildResendSmsCode(),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            _buildNextButton(),
            const SizedBox(height: 12),
          ],
        ),
  );

  Widget _buildResendSmsCode() => InkWell(
        onTap: () {
          _startTimeout();
          widget.onResend.call();
        },
        child: const Text('context.loc!.resend_code'),
      );

  Widget _buildSmsCodeTextSection() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'dfadf',
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'dfa',
                ),
                Text(
                  widget.phoneNumber,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Text('dsfadsfadsf'),
          ],
        ),
      );

  Widget _buildTimerWidget() => const Text('adsfjadjsf');

  Widget _buildSmsCodePin() => Pinput(
        autofocus: true,
        animationCurve: Curves.easeInBack,
        focusedPinTheme: PinTheme(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: Colors.green),
          ),
        ),
        defaultPinTheme: PinTheme(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
        ),
        hapticFeedbackType: HapticFeedbackType.mediumImpact,
        // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        controller: _pinController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: widget.onChanged,
      );

  Widget _buildNextButton() => Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: FilledButton.tonal(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.green),
            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
          ),
          onPressed: () async {
            widget.onSmsCodeApply.call();
            //_startTimeout();
          },
          child: Text(
            widget.buttonText,
            style: const TextStyle(color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.w600, fontSize: 16),
          )));
}
