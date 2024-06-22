import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/theme/app_theme.dart';

class SocialButton extends StatelessWidget {
  final String _tooltip;
  final IconData _iconData;
  final String _url;

  const SocialButton({
    super.key,
    required String tooltip,
    required IconData iconData,
    required String url,
  })  : _url = url,
        _iconData = iconData,
        _tooltip = tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      icon: Icon(
        _iconData,
        color: AppTheme.gray.shade400,
      ),
      splashRadius: 24,
      tooltip: _tooltip,
      onPressed: () {
        _openLink(_url);
      },
    );
  }

  void _openLink(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
