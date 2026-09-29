import 'package:flutter/widget_previews.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_theme.dart';

Widget previewSurface(Widget child) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(
      body: Center(
        child: child,
      ),
    ),
  );
}

Widget previewFieldSurface(Widget child) {
  return previewSurface(
    SizedBox(
      width: 280,
      child: child,
    ),
  );
}

Widget _dsBox(Widget child) => SizedBox(
  width: 220,
  height: 52,
  child: child,
);

@Preview(
  group: 'Buttons',
  name: 'Primary - CTA',
  size: Size(280, 128),
  wrapper: previewSurface,
)
Widget previewPrimaryButton() {
  return _dsBox(
    FilledButton(
      onPressed: () {},
      child: Text(
        'CTA PRINCIPAL',
      ),
    ),
  );
}

@Preview(
  group: 'Buttons',
  name: 'Danger',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewDangerButton() => _dsBox(
  FilledButton(
    style: AppTheme.dangerButton,
    onPressed: () {},
    child: const Text('NÃO TENHO'),
  ),
);

@Preview(
  group: 'Buttons',
  name: 'Secondary',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewSecondaryButton() => _dsBox(
  FilledButton(
    style: AppTheme.secondaryButton,
    onPressed: () {},
    child: const Text('SECUNDÁRIO'),
  ),
);

@Preview(
  group: 'Buttons',
  name: 'Danger outline',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewDangerOutlineButton() => _dsBox(
  FilledButton(
    style: AppTheme.dangerOutlineButton,
    onPressed: () {},
    child: const Text('SAIR DA CONTA'),
  ),
);

@Preview(
  group: 'Buttons',
  name: 'Disabled',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewDisabledButton() => _dsBox(
  const FilledButton(
    onPressed: null,
    child: Text('DESABILITADO'),
  ),
);

@Preview(
  group: 'Fields',
  name: 'All Fields States',
  size: Size(340, 460),
  wrapper: previewFieldSurface,
)
Widget previewAllFields() => Column(
  mainAxisSize: .min,
  spacing: 16,
  children: [
    TextFormField(initialValue: 'Edoardo Fabrizio'),
    TextFormField(
      decoration: const InputDecoration(hintText: 'email@example.com'),
    ),
    TextFormField(
      initialValue: '',
      autovalidateMode: .always,
      validator: (_) => 'Error on this required field',
    ),
    TextFormField(
      decoration: AppTheme.searchInput,
    ),
  ],
);
