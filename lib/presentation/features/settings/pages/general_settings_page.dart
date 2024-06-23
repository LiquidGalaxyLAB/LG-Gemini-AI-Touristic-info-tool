import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/color_card.dart';
import '../widgets/connection_type_card.dart';
import '../widgets/image_card.dart';

class GeneralSettingsPage extends StatefulWidget {
  const GeneralSettingsPage({super.key});

  @override
  State<GeneralSettingsPage> createState() => _GeneralSettingsPageState();
}

class _GeneralSettingsPageState extends State<GeneralSettingsPage> {
  static const double spacing = 12.0;

  final _mapsThemes = mapsThemesMap.keys.toList();
  final _mapsStyles = mapsStyles;
  final _appThemes = appThemes;

  int _selectedConnectionMethod = 0;
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
            "Connection Method",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray.shade400),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              ConnectionTypeCard(
                label: "Automatic",
                selected: _selectedConnectionMethod == 0,
                onPressed: () {
                  setState(() {
                    _selectedConnectionMethod = 0;
                  });
                },
              ),
              const SizedBox(width: spacing),
              ConnectionTypeCard(
                label: "Manual",
                selected: _selectedConnectionMethod == 1,
                onPressed: () {
                  setState(() {
                    _selectedConnectionMethod = 1;
                  });
                },
              ),
            ],
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
                    ColorCard(
                      color: _appThemes[index],
                      selected: _selectedAppTheme == index,
                      onTap: () {
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
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _mapsStyles.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    ImageCard(
                      name: _mapsStyles[index],
                      selected: _selectedMapsStyle == index,
                      onTap: () {
                        setState(() {
                          _selectedMapsStyle = index;
                        });
                      },
                      scale: 4,
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
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _mapsThemes.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    ImageCard(
                      name: _mapsThemes[index],
                      selected: _selectedMapsTheme == index,
                      onTap: () {
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
}
