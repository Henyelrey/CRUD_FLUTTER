import 'package:flutter/material.dart';
import 'package:granturismo_flutter/login/login_google.dart';
import 'package:granturismo_flutter/theme/AppTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UPeU",
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: MainLogin(),
    );
  }
}
