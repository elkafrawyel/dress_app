import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../app/res/res.dart';

class ApiLoadingView extends StatelessWidget {
  const ApiLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            Res.animApiLoading,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
