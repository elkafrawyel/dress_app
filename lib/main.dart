import 'package:dress_app/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'app/util/focus_remover.dart';
import 'data/providers/storage/local_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String appLanguage = LocalProvider().getAppLanguage();
    return FocusRemover(
      child: OKToast(
        child: MaterialApp(
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
          title: 'بسمة علوان',
          locale: Locale(appLanguage),
          theme: ThemeData(
            primaryColor: const Color(0xffED8A8D),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffED8A8D)),
          ),
          supportedLocales: const [Locale('ar', 'EG')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, navigatorWidget) {
            try {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.4),
                child: navigatorWidget ?? const SizedBox(),
              );
            } catch (e) {
              return navigatorWidget ?? const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
