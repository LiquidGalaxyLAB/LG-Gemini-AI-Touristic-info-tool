import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../config/theme/app_theme.dart';
import 'widgets/social_button.dart';

const String appDescription =
    """The Gemini AI-based touristic app utilizes advanced AI through Gemini API to offer personalized travel recommendations and interactive experiences. Available on Android and compatible with Liquid Galaxy, it facilitates easy exploration of tourist places, budget planning, and interactive chat-based guidance.

Users can explore global tourist destinations, receive personalized itinerary suggestions, and interact via AI-powered chatbots for real-time travel advice. The app seamlessly integrates with Liquid Galaxy for immersive visualizations of geographical data and touristic locations, enhancing user engagement and travel planning efficiency.""";

const String lgDescription =
    """Liquid Galaxy is a remarkable panoramic system that is tremendously compelling. It started off as a Google 20% project created by Google engineer Jason Holt to run Google Earth across a cluster of PC's and it has grown from there!

Liquid Galaxy hardware consists of 3 or more computers driving multiple displays, usually one computer for each display. Liquid Galaxy applications have been developed using a master/slave architecture. The view orientation of each slave display is configured in reference to the view of the master display. Navigation on the system is done from the master instance and the location on the master is broadcast to the slaves over UDP. The slave instances, knowing their own locations in reference to the master, then change their views accordingly.""";

class AboutPage extends StatefulWidget {
  static const double spacing = 24.0;
  static const double gap = 6.0;

  final IconData twitter = const IconData(
    0xf099,
    fontFamily: "icons",
    fontPackage: null,
  );
  final IconData github = const IconData(
    0xf09b,
    fontFamily: "icons",
    fontPackage: null,
  );
  final IconData linkedin = const IconData(
    0xf0e1,
    fontFamily: "icons",
    fontPackage: null,
  );
  final IconData instagram = const IconData(
    0xf16d,
    fontFamily: "icons",
    fontPackage: null,
  );
  final IconData googlePlay = const IconData(
    0xf3ab,
    fontFamily: "icons",
    fontPackage: null,
  );

  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _appVersion = "";

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  void _getAppVersion() async {
    final appVersion = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = appVersion.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.gray.shade900,
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              width: 450,
              height: 250,
            ),
            const SizedBox(height: AboutPage.spacing),
            _buildHeaderText("Touristic AI", fontSize: 28, fontColor: AppTheme.gray.shade300),
            const SizedBox(height: AboutPage.gap),
            _buildDescriptionText(appDescription),
            const SizedBox(height: AboutPage.spacing),
            Divider(
              color: AppTheme.gray.shade800,
              thickness: 1,
              indent: MediaQuery.of(context).size.width * 0.2,
              endIndent: MediaQuery.of(context).size.width * 0.2,
            ),
            const SizedBox(height: AboutPage.spacing),
            _buildHeaderText("Developer"),
            const SizedBox(height: AboutPage.gap),
            _buildDescriptionText("Sidharth Mudgil"),
            const SizedBox(height: AboutPage.gap),
            _buildDeveloperSocials(),
            const SizedBox(height: AboutPage.spacing),
            SvgPicture.asset(
              "assets/images/lg_logo.svg",
              width: 450,
              height: 250,
            ),
            const SizedBox(height: AboutPage.spacing),
            _buildDescriptionText(lgDescription),
            const SizedBox(height: AboutPage.spacing),
            Divider(
              color: AppTheme.gray.shade800,
              thickness: 1,
              indent: MediaQuery.of(context).size.width * 0.2,
              endIndent: MediaQuery.of(context).size.width * 0.2,
            ),
            const SizedBox(height: AboutPage.spacing),
            _buildHeaderText("Organization"),
            const SizedBox(height: AboutPage.gap),
            _buildDescriptionText("Liquid Galaxy"),
            const SizedBox(height: AboutPage.gap),
            _buildOrganizationSocials(),
            const SizedBox(height: AboutPage.spacing),
            _buildHeaderText("Credits"),
            const SizedBox(height: AboutPage.gap),
            _buildDescriptionText("Special thanks to all mentors."),
            const SizedBox(height: AboutPage.spacing),
            Text(
              _appVersion,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.gray.shade700,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(
    String text, {
    double fontSize = 18,
    Color? fontColor,
  }) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: fontColor ?? AppTheme.gray.shade400,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildDescriptionText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppTheme.gray.shade300,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  Widget _buildDeveloperSocials() {
    String authorEmail = 'smudgil101@gmail.com';
    String authorGitHub = 'sidharthmudgil';
    String authorLinkedIn = 'sidharthmudgil';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          tooltip: authorEmail,
          iconData: Icons.mail_rounded,
          url: "mailto:$authorEmail",
        ),
        SocialButton(
          tooltip: authorGitHub,
          iconData: widget.github,
          url: "https://www.github.com/$authorGitHub",
        ),
        SocialButton(
          tooltip: authorLinkedIn,
          iconData: widget.linkedin,
          url: "https://www.linkedin.com/$authorLinkedIn",
        ),
      ],
    );
  }

  Widget _buildOrganizationSocials() {
    String orgInstagram = '_liquidgalaxy';
    String orgTwitter = '_liquidgalaxy';
    String orgGitHub = 'LiquidGalaxyLAB';
    String orgLinkedIn = 'google-summer-of-code---liquid-galaxy-project';
    String orgWebsite = 'www.liquidgalaxy.eu';
    String orgMail = 'liquidgalaxylab@gmail.com';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          tooltip: "@$orgInstagram",
          iconData: widget.instagram,
          url: "https://www.instagram.com/$orgInstagram",
        ),
        SocialButton(
          tooltip: "@$orgTwitter",
          iconData: widget.twitter,
          url: "https://www.x.com/$orgTwitter",
        ),
        SocialButton(
          tooltip: orgGitHub,
          iconData: widget.github,
          url: "https://www.github.com/$orgGitHub",
        ),
        SocialButton(
          tooltip: "company/$orgLinkedIn",
          iconData: widget.linkedin,
          url: "https://www.linkedin.com/company/$orgLinkedIn",
        ),
        SocialButton(
          tooltip: orgWebsite,
          iconData: Icons.language_rounded,
          url: "https://$orgWebsite",
        ),
        SocialButton(
          tooltip: orgMail,
          iconData: Icons.mail_rounded,
          url: "mailto:$orgMail",
        ),
      ],
    );
  }
}
