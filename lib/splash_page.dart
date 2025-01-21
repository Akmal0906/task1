import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task1/router/app_routes.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    nextPage();
  }
  void nextPage()async{
   await Future.delayed(const Duration(seconds: 1));

        context.goNamed(Routes.explore);




  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
        child: Text("Shop"),

      )),
    );
  }
}
