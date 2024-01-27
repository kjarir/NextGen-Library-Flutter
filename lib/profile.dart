import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'setting_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen();
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
    );

    var profileInfo = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: kSpacingUnit.w * 10,
          width: kSpacingUnit.w * 10,
          margin: const EdgeInsets.only(top: 0),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: kSpacingUnit.w * 5,
                backgroundImage: const AssetImage('assets/images/economic.png'),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: kSpacingUnit.w * 2.5,
                  width: kSpacingUnit.w * 2.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    heightFactor: kSpacingUnit.w * 1.5,
                    widthFactor: kSpacingUnit.w * 1.5,
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: Colors.black,
                      size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kSpacingUnit.w * 2),
        Text(
          'Khan Mohd Jarir',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: kSpacingUnit.w * 0.5),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Color(0xFFFF0080), Color(0xFF7928CA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Text(
            'kjarir23@gmail.com',
            style: GoogleFonts.poppins(
                fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: kSpacingUnit.w * 8),
      ],
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: kSpacingUnit.w * 4),
            profileInfo,
            Container(
              alignment: Alignment.center,
              width: 330,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: <Widget>[
                  ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Settings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.history,
                    text: 'Books Issued',
                    onTap: () {
                      // Navigate to Purchase History Page
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.receipt,
                    text: 'Fine',
                    onTap: () {
                      // Navigate to Help & Support Page
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.question_circle,
                    text: 'Help & Support',
                    onTap: () {
                      // Navigate to Settings Page
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_plus,
                    text: 'Invite a Friend',
                    onTap: () {
                      generateAndShareInvitationLink(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Logout',
                    hasNavigation: false,
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> generateAndShareInvitationLink(BuildContext context) async {
    try {
      final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://your-firebase-dynamic-link-prefix.page.link',
        link: Uri.parse('https://example.com/invite'),
        androidParameters: AndroidParameters(
          packageName: 'com.your.package.name',
          minimumVersion: 0,
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
          title: 'Join My App',
          description: 'Download and join my app now!',
          imageUrl: Uri.parse('https://example.com/image.png'),
        ),
      );

      final shortLink = await parameters.link;

      // Open a bottom sheet with share options
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ShareOptions(invitationLink: shortLink.toString());
        },
      );
    } catch (e) {
      print("Error generating dynamic link: $e");
    }
  }
}

class ShareOptions extends StatelessWidget {
  final String invitationLink;

  const ShareOptions({required this.invitationLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share on WhatsApp'),
            onTap: () async {
              // Add your share logic for WhatsApp here
              // Example: var whatsappUrl = "whatsapp://send?text=$invitationLink";
              // await launch(whatsappUrl);

              var whatsappUrl = "com.example.nextgen:";
              await launchUrl(Uri.parse("com.whatsapp"));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share on Instagram'),
            onTap: () async {
              // Add your share logic for Instagram here
              // Example: var instagramUrl = "https://www.instagram.com/?url=$invitationLink";
              // await launch(instagramUrl);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final void Function() onTap; // Change the type of onTap

  ProfileListItem({
    required this.icon,
    required this.text,
    this.hasNavigation = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var navColor = const Color(0xFF4F6F52);
    return ElevatedButton(
      onPressed: () => onTap(), // Use the onTap function here
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        fixedSize: const Size(250, 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit * 2.5,
          ),
          SizedBox(width: kSpacingUnit),
          Text(
            this.text,
            style: GoogleFonts.poppins(
              fontSize: kSpacingUnit * 1.75,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              color: navColor,
              size: kSpacingUnit * 2.5,
            ),
        ],
      ),
    );
  }
}

double kSpacingUnit = 10.0;
