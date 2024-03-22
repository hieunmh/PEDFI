part of 'screen_bloc.dart';

@immutable
sealed class ScreenState {
  final int screenIndex;
  const ScreenState({ required this.screenIndex });
}

final class ScreenInitial extends ScreenState {
  const ScreenInitial({ required super.screenIndex });
}
