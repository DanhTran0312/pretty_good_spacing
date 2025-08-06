import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pretty_good_spacing/src/space.dart';

/// A gap widget that uses the [Space] class for spacing values.
///
/// This widget is a wrapper around the [Gap] widget from the [gap] package.
/// It provides a more convenient way to create gaps with different spacing values.
///
/// The [space] parameter is used to set the spacing value.
/// The [crossAxisExtent] parameter is used to set the cross axis extent.
/// The [color] parameter is used to set the color of the gap.
///
/// Example usage:
/// ```dart
/// KGap.space50();
/// KGap.space100(crossAxisExtent: 100);
/// KGap.space200(color: Colors.red);
/// ```
class KGap extends StatelessWidget {
  const KGap({
    required this.space,
    this.crossAxisExtent,
    this.color,
    super.key,
  });

  factory KGap.space0({double? crossAxisExtent, Color? color}) =>
      KGap(space: Space.space0, crossAxisExtent: crossAxisExtent, color: color);
  factory KGap.space25({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space25,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space50({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space50,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space75({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space75,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space100({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space100,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space125({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space125,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space150({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space150,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space200({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space200,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space250({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space250,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space300({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space300,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space400({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space400,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space500({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space500,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space600({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space600,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space800({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space800,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
  factory KGap.space1000({double? crossAxisExtent, Color? color}) => KGap(
    space: Space.space1000,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );

  final double space;
  final double? crossAxisExtent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Gap(space, crossAxisExtent: crossAxisExtent, color: color);
  }
}
