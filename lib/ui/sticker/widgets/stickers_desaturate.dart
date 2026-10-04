import 'package:material_ui/material_ui.dart';

class const StickersDesaturate({
  super.key,
  required final bool activate,
  required final Widget child,
}) extends StatelessWidget {
  final _grayScale = const ColorFilter.matrix([
    // Red
    0.2126, 0.7152, 0.0722, 0, 0,
    // Green
    0.2126, 0.7152, 0.0722, 0, 0,
    // Blue
    0.2126, 0.7152, 0.0722, 0, 0,
    // Transparency
    0, 0, 0, 1, 0,
  ]);

  final _identity = const ColorFilter.matrix([
    // Red
    1, 0, 0, 0, 0,
    // Green
    0, 1, 0, 0, 0,
    // Blue
    0, 0, 1, 0, 0,
    // Transparency
    0, 0, 0, 1, 0,
  ]);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: activate ? _grayScale : _identity,
      child: child,
    );
  }
}
