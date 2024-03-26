import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedfi/bloc/screen_bloc.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/account_screen.dart';
import 'package:pedfi/screens/add_screen.dart';
import 'package:pedfi/screens/home_screen.dart';
import 'package:provider/provider.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    activeIcon: Icon(CupertinoIcons.house_alt_fill),
    icon: Icon(CupertinoIcons.house_alt),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    activeIcon: Icon(CupertinoIcons.add_circled_solid),
    icon: Icon(CupertinoIcons.add_circled),
    label: 'Add',
  ),
  BottomNavigationBarItem(
    activeIcon: Icon(CupertinoIcons.person_fill),
    icon: Icon(CupertinoIcons.person),
    label: 'Profile',
  ),
];

const List<Widget> bottomNavScreen = <Widget>[
  HomeScreen(),
  AddScreen(),
  AccountScreen(),
];

class Screens extends StatelessWidget {
  const Screens({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white70 : Colors.black87;

    return BlocConsumer<ScreenBloc, ScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.screenIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.screenIndex,
            selectedItemColor: const Color.fromRGBO(24, 119, 242, 1),
            unselectedItemColor: color,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onTap: (index) {
              BlocProvider.of<ScreenBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}