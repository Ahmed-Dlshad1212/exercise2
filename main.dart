// Ahmed dlshad
// Hoshmand Shaho

import 'package:flutter/material.dart';
import 'custom_icon_button.dart';
import 'custom_slider.dart';
import 'settings_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double iconSize = 50.0;
  Color iconColor = Colors.blue;

  bool allowResize = true;
  bool allowChangePrimerColor = true;

  void updateIconSize(double newSize) {
    setState(() {
      iconSize = newSize;
    });
  }

  void updateIconColor(Color newColor) {
    setState(() {
      iconColor = newColor;
    });
  }

  void toggleAllowResize(bool value) {
    setState(() {
      allowResize = value;
    });
  }

  void toggleAllowChangePrimerColor(bool value) {
    setState(() {
      allowChangePrimerColor = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon App'),
        actions: [
          if (allowResize)
            CustomIconButton(
              icon: Icons.aspect_ratio,
              onPressed: () => _showResizeDialog(context),
            ),
        ],
      ),
      drawer: SettingsDrawer(
        allowResize: allowResize,
        allowChangePrimerColor: allowChangePrimerColor,
        onAllowResizeChanged: toggleAllowResize,
        onAllowChangePrimerColorChanged: toggleAllowChangePrimerColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: iconSize,
              height: iconSize,
              child: Icon(
                Icons.star,
                color: iconColor,
              ),
            ),
            CustomSlider(
              label: 'Red',
              value: iconColor.red,
              onChange: (value) => updateIconColor(
                Color.fromARGB(
                  255,
                  value.toInt(),
                  iconColor.green.toInt(),
                  iconColor.blue.toInt(),
                ),
              ),
              allowChangePrimerColor: allowChangePrimerColor,
            ),
            CustomSlider(
              label: 'Green',
              value: iconColor.green,
              onChange: (value) => updateIconColor(
                Color.fromARGB(
                  255,
                  iconColor.red.toInt(),
                  value.toInt(),
                  iconColor.blue.toInt(),
                ),
              ),
              allowChangePrimerColor: allowChangePrimerColor,
            ),
            CustomSlider(
              label: 'Blue',
              value: iconColor.blue,
              onChange: (value) => updateIconColor(
                Color.fromARGB(
                  255,
                  iconColor.red.toInt(),
                  iconColor.green.toInt(),
                  value.toInt(),
                ),
              ),
              allowChangePrimerColor: allowChangePrimerColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showResizeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Size'),
          content: Column(
            children: [
              CustomIconButton(
                icon: Icons.remove,
                onPressed: () => updateIconSize(iconSize - 10),
              ),
              CustomIconButton(
                icon: Icons.add,
                onPressed: () => updateIconSize(iconSize + 10),
              ),
            ],
          ),
        );
      },
    );
  }
}
