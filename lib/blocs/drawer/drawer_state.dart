// Project: 	   friendzoned
// File:    	   drawer_state
// Path:    	   lib/blocs/drawer/drawer_state.dart
// Author:       Ali Akbar
// Date:        12-08-24 12:27:58 -- Monday
// Description:

abstract class DrawerCubitState {}

class DrawerStateInitial extends DrawerCubitState {}

class DrawerStateVisibilityStatus extends DrawerCubitState {
  final bool isOpened;

  DrawerStateVisibilityStatus({required this.isOpened});
}

class DrawerStateSelectItem extends DrawerCubitState {
  final int index;

  DrawerStateSelectItem({required this.index});
}
