import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shop_app/app_starter.dart';
import 'package:furniture_shop_app/config/theme.dart';
import 'package:furniture_shop_app/providers/app_state_provider.dart';
import 'package:furniture_shop_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AppStateProvider()),
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Furniture Shop App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const AppStarter(),
      ),
    );
  }
}
