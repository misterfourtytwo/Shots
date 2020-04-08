import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shots/router/router.gr.dart';
import 'package:shots/styles/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appLightTheme,
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
