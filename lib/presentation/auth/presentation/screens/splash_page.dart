import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/router.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      context.goNamed(RouterConstants.introPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.blueColor,
      body: Stack(
        children: [
          const MainBackground(),
          _logo(),
        ],
      ),
    );
  }

  _logo() {
    return Center(child: LogoWidget());
  }
}
