
import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  final bool allowResize;
  final bool allowChangePrimerColor;
  final ValueChanged<bool> onAllowResizeChanged;
  final ValueChanged<bool> onAllowChangePrimerColorChanged;

  const SettingsDrawer({
    required this.allowResize,
    required this.allowChangePrimerColor,
    required this.onAllowResizeChanged,
    required this.onAllowChangePrimerColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Settings'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Allow Resize'),
            trailing: Switch(
              value: allowResize,
              onChanged: onAllowResizeChanged,
            ),
          ),
          ListTile(
            title: Text('Allow Change Primer Color'),
            trailing: Switch(
              value: allowChangePrimerColor,
              onChanged: onAllowChangePrimerColorChanged,
            ),
          ),
        ],
      ),
    );
  }
}
