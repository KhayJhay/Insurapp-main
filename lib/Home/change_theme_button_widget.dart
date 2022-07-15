import 'package:flutter/material.dart';
import 'package:insurapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ChangeThemeButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        activeColor: Color(0xFF44A8E0),
        onChanged: (value){
      final provider = Provider.of<ThemeProvider>(context, listen:false);
      provider.toggleTheme(value);
    });
  }
}
