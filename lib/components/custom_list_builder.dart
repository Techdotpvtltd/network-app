// Project: 	   concierge_networking
// File:    	   custom_list_builder
// Path:    	   lib/components/custom_list_builder.dart
// Author:       Ali Akbar
// Date:        03-10-24 14:27:48 -- Thursday
// Description:

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomListBuilder extends StatefulWidget {
  const CustomListBuilder({
    super.key,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.itemExtentBuilder,
    this.prototypeItem,
    this.findChildIndexCallback,
    this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.onReachEnd,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final double? Function(int, SliverLayoutDimensions)? itemExtentBuilder;
  final Widget? prototypeItem;
  final int? Function(Key)? findChildIndexCallback;
  final int? itemCount;
  final bool addAutomaticKeepAlives;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final HitTestBehavior hitTestBehavior;
  final VoidCallback? onReachEnd;

  @override
  State<CustomListBuilder> createState() => _CustomListBuilderState();
}

class _CustomListBuilderState extends State<CustomListBuilder> {
  late final ScrollController controller =
      widget.controller ?? ScrollController();

  void scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      widget.onReachEnd!();
    }
  }

  @override
  void initState() {
    if (widget.onReachEnd != null) {
      controller.addListener(scrollListener);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onReachEnd != null) {
      controller.removeListener(scrollListener);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget.key,
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemCount,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: controller,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemExtent: widget.itemExtent,
      itemExtentBuilder: widget.itemExtentBuilder,
      prototypeItem: widget.prototypeItem,
      findChildIndexCallback: widget.findChildIndexCallback,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addSemanticIndexes: widget.addAutomaticKeepAlives,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      hitTestBehavior: widget.hitTestBehavior,
    );
  }
}
