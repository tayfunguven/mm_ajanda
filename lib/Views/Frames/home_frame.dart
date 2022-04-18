import 'package:flutter/material.dart';

class HomeFrame extends StatelessWidget {
  const HomeFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          'Home Frame'
        ),
      ),
    );
  }
}
