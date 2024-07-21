import 'package:flutter/material.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/home/home_page.dart';
import 'package:sharecare/views/profile/FAQ.dart';
import 'package:sharecare/views/profile/contact_us.dart';
import 'package:sharecare/views/profile/privacy_policy.dart';
import 'package:sharecare/views/profile/settings.dart';
import 'package:sharecare/views/profile/terms_of_service.dart';
import 'package:sharecare/views/profile/profile_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: kPrimary),
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // Replace with your profile image
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              // Navigate to home screen
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ); // Navigate to profile screen
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              // Navigate to settings screen
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('FAQ'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQScreen()),
              );
              // Perform FAQ action
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.contact_page_sharp),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUsScreen()),
              );
              // Perform Contact Us action
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
              // Perform logout action
            },
          ),
          // Empty container to create space
          Container(
            height: MediaQuery.of(context).size.height *
                0.10, // 10% of screen height
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Terms of Service'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsOfServiceScreen()),
              );
              // Navigate to Terms of Service screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
              );
              // Perform Privacy Policy action
            },
          ),
        ],
      ),
    );
  }
}
