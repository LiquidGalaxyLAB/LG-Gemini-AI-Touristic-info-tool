import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../config/theme/color/app_color.dart';
import '../../../../core/constants/constants.dart';

class GeneralSettingsPage extends StatefulWidget {
  const GeneralSettingsPage({super.key});

  @override
  State<GeneralSettingsPage> createState() => _GeneralSettingsPageState();
}

class _GeneralSettingsPageState extends State<GeneralSettingsPage> {
  static const double spacing = 12.0;
  bool _autoConnect = true;

  final _mapsThemes = mapsThemesMap.entries.toList();
  final _mapsStyles = mapsStyles;
  final _appThemes = appThemes;

  int _selectedAppTheme = 0;
  int _selectedMapsStyle = 0;
  int _selectedMapsTheme = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Auto Connect",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray.shade400),
          ),
          const SizedBox(height: 6),
          Switch(
            value: _autoConnect,
            activeTrackColor: AppTheme.color.shade700,
            activeColor: AppTheme.gray.shade200,
            inactiveTrackColor: AppTheme.gray.shade200,
            inactiveThumbColor: AppTheme.gray.shade400,
            onChanged: (value) {
              setState(() {
                _autoConnect = value;
              });
            },
          ),
          const SizedBox(height: spacing * 2),
          Text(
            "Color Theme",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray.shade400),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _appThemes.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    _buildColorCard(
                      _appThemes[index],
                      _selectedAppTheme == index,
                      () {
                        setState(() {
                          _selectedAppTheme = index;
                        });
                      },
                    ),
                    if (index < 9) const SizedBox(width: 12.0)
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: spacing * 2),
          Text(
            "Maps Style",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray.shade400),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _mapsStyles.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    _buildImageCard(
                      _mapsStyles[index],
                      _selectedMapsStyle == index,
                      () {
                        setState(() {
                          _selectedMapsStyle = index;
                        });
                      },
                    ),
                    if (index < 9) const SizedBox(width: 12.0)
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: spacing * 2),
          Text(
            "Maps Theme",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray.shade400),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _mapsThemes.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    _buildImageCard(
                      mapsThemesMap[_mapsThemes[index]]!,
                      _selectedMapsTheme == index,
                      () {
                        setState(() {
                          _selectedMapsTheme = index;
                        });
                      },
                    ),
                    if (index < 9) const SizedBox(width: 12.0)
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: spacing),
        ],
      ),
    );
  }

  Widget _buildImageCard(
    String name,
    bool selected,
    Function onTap,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: AppTheme.color.shade700,
            width: 1.3,
          ),
        ),
        child: Image.asset(name),
      ),
    );
  }

  Widget _buildColorCard(
    AppColor color,
    bool selected,
    Function onTap,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: selected ? color.shade700 : color.shade800,
        ),
      ),
    );
  }
}
