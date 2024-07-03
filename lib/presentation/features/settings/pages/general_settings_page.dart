import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touristic/presentation/components/outlined_input_field.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/enums/preferences.dart';
import '../../../../core/utils/preferences_utils.dart';
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
  final _mapsStyles = mapsStylesMap.keys.toList();
  final _appThemes = appThemes;

  TextEditingController _controller = TextEditingController();

  int _selectedConnectionMethod = 1;
  int _selectedAppTheme = 3;
  int _selectedMapsStyle = 3;
  int _selectedMapsTheme = 0;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _controller.addListener((){
      if (_controller.text.length > 15 && _controller.text.length < 150) {
        PreferencesUtils().updateValue(GeneralPreferences.apiKey.name, _controller.text);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> _loadPreferences() async {
    _selectedConnectionMethod = await PreferencesUtils().getValue<int>(GeneralPreferences.connectionMethod.name) ?? 1;
    _selectedAppTheme = await PreferencesUtils().getValue<int>(GeneralPreferences.appTheme.name) ?? 3;
    _selectedMapsStyle = await PreferencesUtils().getValue<int>(GeneralPreferences.mapsStyle.name) ?? 3;
    _selectedMapsTheme = await PreferencesUtils().getValue<int>(GeneralPreferences.mapsTheme.name) ?? 0;
    _controller = TextEditingController(text: await PreferencesUtils().getValue<String>(GeneralPreferences.apiKey.name));
    setState(() {});
  }

  Future<void> _savePreference(String key, int value) async {
    await PreferencesUtils().saveValue(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacing),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gemini API Key",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppTheme.gray.shade400),
            ),
            const SizedBox(height: 6),
            OutlinedInputField(
              controller: _controller,
              type: TextInputType.text,
              hint: "Gemini api key",
            ),
            const SizedBox(height: spacing),
            Text(
              "Connection Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppTheme.gray.shade400),
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
                      _savePreference(GeneralPreferences.connectionMethod.name, 0);
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
                      _savePreference(GeneralPreferences.connectionMethod.name, 1);
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
                color: AppTheme.gray.shade400,
              ),
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
                            AppTheme.color = _appThemes[index];
                            _savePreference(GeneralPreferences.appTheme.name, index);
                          });
                        },
                      ),
                      if (index < _appThemes.length - 1) const SizedBox(width: 12.0)
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
                color: AppTheme.gray.shade400,
              ),
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
                            AppTheme.mapStyle = mapsStylesMap[_mapsStyles[index]]!;
                            _savePreference(GeneralPreferences.mapsStyle.name, index);
                          });
                        },
                        scale: 4,
                      ),
                      if (index < _mapsStyles.length - 1) const SizedBox(width: 12.0)
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: spacing * 2),
            Text(
              "Maps Theme",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppTheme.gray.shade400),
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
                            AppTheme.mapTheme = mapsThemesMap[_mapsThemes[index]]!;
                            _savePreference(GeneralPreferences.mapsTheme.name, index);
                          });
                        },
                      ),
                      if (index < _mapsThemes.length - 1) const SizedBox(width: 12.0)
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: spacing),
          ],
        ),
      ),
    );
  }
}
