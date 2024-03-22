import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc() : super(const ScreenInitial(screenIndex: 0)) {
    on<ScreenEvent>((event, emit) {
        if (event is TabChange) {
        // ignore: avoid_print
        print(event.tabIndex);
        emit(ScreenInitial(screenIndex: event.tabIndex));
      }
    });
  }
}
