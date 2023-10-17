import 'package:dress_app/app/extensions/space.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../app/config/app_color.dart';
import '../../../app/res/res.dart';
import '../app_widgets/app_text.dart';

class ApiErrorView extends StatelessWidget {
  final String errorText;
  final Function()? retry;

  const ApiErrorView({Key? key, required this.errorText, this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(Res.animApiError, width: 200, height: 200, fit: BoxFit.cover),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppText(
                  errorText,
                  color: hintColor,
                  fontSize: 18,
                  maxLines: 10,
                  centerText: true,
                ),
              ),
            ),
          ),
          20.ph,
          if (retry != null)
            ElevatedButton(
              onPressed: retry,
              style: ElevatedButton.styleFrom(
                backgroundColor: errorColor.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                child: AppText(
                  'Try Again',
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
            )
        ],
      ),
    );
  }
}
