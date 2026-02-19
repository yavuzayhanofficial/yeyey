import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'config/theme.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'widgets/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr', null);
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  runApp(const YeYeYApp());
}

class YeYeYApp extends StatefulWidget {
  const YeYeYApp({super.key});

  @override
  State<YeYeYApp> createState() => _YeYeYAppState();
}

class _YeYeYAppState extends State<YeYeYApp> {
  bool _isLoggedIn = false;
  bool _showRegister = false;

  void _login() => setState(() => _isLoggedIn = true);
  void _logout() => setState(() => _isLoggedIn = false);
  void _goToRegister() => setState(() => _showRegister = true);
  void _goToLogin() => setState(() => _showRegister = false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YeYeY - Arkadaş Kirala',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: _isLoggedIn
          ? MainNavigation(onLogout: _logout)
          : _showRegister
              ? RegisterScreen(onRegister: _login, onGoToLogin: _goToLogin)
              : LoginScreen(onLogin: _login, onGoToRegister: _goToRegister),
    );
  }
}
