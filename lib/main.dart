import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/theme_data.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/pages.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  
  await Supabase.initialize(
    url: '${dotenv.env['SUPABASE_URL']}',
    anonKey: '${dotenv.env['SUPABASE_ANNON_KEY']}',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Pedfi App",
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          initialRoute: AppRoutes.APPLICATION,
          getPages: AppPages.routes,
        );
      }),
    );
  }
}
