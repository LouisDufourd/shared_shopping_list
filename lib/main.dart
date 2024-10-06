import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_shopping_list/pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // For Cupertino widgets
      ],
      supportedLocales: const [
        Locale('fr'), // French
        Locale('en'), // English
      ],
      theme: ThemeData(
        fontFamily: 'Roboto'
      ),
      home: const LoginPage(),
    ),
  );
}
