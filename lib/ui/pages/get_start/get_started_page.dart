import 'package:flutter/material.dart';
import 'package:todo/config/router/r.dart';
import 'package:todo/config/router/router.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(4),
              backgroundColor: WidgetStateProperty.all(Colors.green),
              padding: WidgetStateProperty.all(const EdgeInsets.all(16.0)),
            ),
            onPressed: () => router.go(R.onboard),
            child: const Text(
              'LETS GET STARTED',
              style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/nature.jpg',
                ),
                fit: BoxFit.fitHeight)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: SizedBox()),
                Text('EXPLORE',
                    style:
                        TextStyle(fontFamily: 'Lobster', fontSize: 77, color: Colors.white.withAlpha(255), fontWeight: FontWeight.w900, height: 1.2)),
                Text('THE',
                    style:
                        TextStyle(fontFamily: 'Lobster', fontSize: 77, color: Colors.white.withAlpha(255), fontWeight: FontWeight.w900, height: 1.2)),
                Text('WORLD!',
                    style:
                        TextStyle(fontFamily: 'Lobster', fontSize: 77, color: Colors.white.withAlpha(255), fontWeight: FontWeight.w900, height: 1.2)),
                const Expanded(flex: 3, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
