import 'package:flutter/material.dart';
import 'package:pedfi/consts/theme_data.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/generate_route.dart';
// import 'package:pedfi/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Pedfi App",
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          // home: const BottomBarScreen(),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator().generateRoute,
        );
      }),
    );
  }
}
