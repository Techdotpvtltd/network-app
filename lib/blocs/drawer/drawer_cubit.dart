// Project: 	   friendzoned
// File:    	   drawer_cubit
// Path:    	   lib/blocs/drawer/drawer_cubit.dart
// Author:       Ali Akbar
// Date:        12-08-24 12:29:03 -- Monday
// Description:

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerCubitState> {
  DrawerCubit() : super(DrawerStateInitial());
  final ZoomDrawerController controller = ZoomDrawerController();

  void toggle() {
    controller.toggle?.call();
  }

  void closeDrawer() {
    if (controller.close != null) {
      controller.close!();
    }
  }

  void onMenuItemClicked(int index) {
    emit(DrawerStateSelectItem(index: index));
  }
}
