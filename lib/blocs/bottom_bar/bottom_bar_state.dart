// Project: 	   concierge_networking
// File:    	   bottom_bar_state
// Path:    	   lib/blocs/bottom_bar/bottom_bar_state.dart
// Author:       Ali Akbar
// Date:        22-08-24 18:26:32 -- Thursday
// Description:

abstract class BottomBarState {}

class BottomBarStateInitial extends BottomBarState {}

class BottomBarStateHide extends BottomBarState {}

class BottomBarStateShow extends BottomBarState {}

class BottomBarStateMoveTo extends BottomBarState {
  final int tabIndex;

  BottomBarStateMoveTo({required this.tabIndex});
}
