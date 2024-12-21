import 'package:flutter/material.dart';

class ServerSettingsOutlineView extends StatelessWidget {
  const ServerSettingsOutlineView({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final ListTileThemeData tileTheme = _LisTileDefaultsM3(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Text(
                'Wi-Fi Mode',
                style: tileTheme.titleTextStyle,
              ),
            ],
          ),
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.sensor_window_rounded),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.router),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.phone_android),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Text('Tap the icons to see more details'),
            ],
          ),
        ),
      ],
    );
  }
}

class _LisTileDefaultsM3 extends ListTileThemeData {
  _LisTileDefaultsM3(this.context)
      : super(
          contentPadding:
              const EdgeInsetsDirectional.only(start: 16.0, end: 24.0),
          minLeadingWidth: 24,
          minVerticalPadding: 8,
          shape: const RoundedRectangleBorder(),
        );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  @override
  Color? get tileColor => Colors.transparent;

  @override
  TextStyle? get titleTextStyle =>
      _textTheme.bodyLarge!.copyWith(color: _colors.onSurface);

  @override
  TextStyle? get subtitleTextStyle =>
      _textTheme.bodyMedium!.copyWith(color: _colors.onSurfaceVariant);

  @override
  TextStyle? get leadingAndTrailingTextStyle =>
      _textTheme.labelSmall!.copyWith(color: _colors.onSurfaceVariant);

  @override
  Color? get selectedColor => _colors.primary;

  @override
  Color? get iconColor => _colors.onSurfaceVariant;
}
