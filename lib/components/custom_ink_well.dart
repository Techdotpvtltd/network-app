// Project: 	   listi_shop
// File:    	   custom_ink_well
// Path:    	   lib/screens/components/custom_ink_well.dart
// Author:       Ali Akbar
// Date:        04-04-24 20:03:33 -- Thursday
// Description:

import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell(
      {super.key, required this.child, this.onTap, this.semanticLabel});
  final Widget child;
  final VoidCallback? onTap;
  final String? semanticLabel;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        hoverColor: Colors.transparent,
        child: child,
      ),
    );
  }
}
