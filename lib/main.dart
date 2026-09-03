import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // Initialize Plaid and Stripe
await PlaidManager.initialize();
await StripeManager.initialize();
GetIt.I.registerSingleton<SubscriptionService>(SubscriptionService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance & Habits App',
      debugShowCheckedModeBanner: false,
      // Add these for localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [ Locale('en', 'US'), Locale('es', 'ES'), Locale('fr', 'FR'), Locale('ar', 'SA'), Locale('zh', 'CN'), Locale('hi', 'IN'), Locale('pcm', 'NG'), Locale('yo', 'NG'), Locale('ha', 'NG'), Locale('ig', 'NG'), ]
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF0F2042),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0F2042),
          secondary: Color(0xFF00C9A7),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Public Sans',
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color(0xFF0F2042),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color(0xFF333333),
          ),
        ),
      ),
      home: const RegistrationScreen(),
    );
  }
}


