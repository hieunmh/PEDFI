import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pedfi/bloc/screen_bloc.dart';
import 'package:pedfi/screens/account_screen.dart';
import 'package:pedfi/screens/add_screen.dart';
import 'package:pedfi/screens/home_screen.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Iconsax.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Iconsax.add),
    label: 'Add',
  ),
  BottomNavigationBarItem(
    icon: Icon(Iconsax.user),
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
    return BlocConsumer<ScreenBloc, ScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.screenIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.screenIndex,
            selectedItemColor: const Color.fromRGBO(24, 119, 242, 1),
            unselectedItemColor: Colors.grey,
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