part of 'screen_bloc.dart';

@immutable
sealed class ScreenEvent {}

class TabChange extends ScreenEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
