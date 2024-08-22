// Project: 	   concierge_networking
// File:    	   bottom_bar_cubit
// Path:    	   lib/blocs/bottom_bar/bottom_bar_cubit.dart
// Author:       Ali Akbar
// Date:        22-08-24 18:27:45 -- Thursday
// Description:

import 'package:concierge_networking/blocs/bottom_bar/bottom_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarStateInitial());

  void show() => emit(BottomBarStateShow());
  void hide() => emit(BottomBarStateHide());
  void moveTo({required int atTab}) =>
      emit(BottomBarStateMoveTo(tabIndex: atTab));
}
