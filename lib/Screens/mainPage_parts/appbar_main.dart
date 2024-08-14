import 'package:flutter/widgets.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/logoUmeals.png',
            height: 50,
          )
        ),
      ),
    );
  }
}