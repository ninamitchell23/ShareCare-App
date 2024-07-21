import 'package:flutter/material.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/profile/drawer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _privacySettingsEnabled = true;
  bool _notificationsEnabled = true;
  String _theme = 'Light';
  String _size = 'Medium';
  String _fontSize = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppDrawer()),
            ); // Navigate back to the previous screen
          },
        ),
      ),
      body: ListView(
        children: [
          // Notifications
          _buildSectionTitle(context, 'Notifications'),
          SwitchListTile(
            title: Text('Enable Notifications'),
            subtitle: Text('Toggle notifications on or off'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),

          // Security Settings
          _buildSectionTitle(context, 'Privacy and Security Settings'),
          ListTile(
            title: Text('Manage Password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Change Password screen
            },
          ),
          SwitchListTile(
            title: Text('Enable Privacy Settings'),
            subtitle: Text('Toggle privacy settings on or off'),
            value: _privacySettingsEnabled,
            onChanged: (value) {
              setState(() {
                _privacySettingsEnabled = value;
              });
            },
          ),

          // Payment Settings
          _buildSectionTitle(context, 'Payment Settings'),
          ListTile(
            title: Text('Manage Payment Methods'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Manage Payment Methods screen
            },
          ),
          ListTile(
            title: Text('Transaction History'),
            subtitle: Text('View your payment and donation transactions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Transaction History screen
            },
          ),
          // Theme
          _buildSectionTitle(context, 'Appearance'),
          ListTile(
            title: Text('Theme'),
            trailing: DropdownButton<String>(
              value: _theme,
              onChanged: (String? newValue) {
                setState(() {
                  _theme = newValue!;
                });
              },
              items: <String>['Light', 'Dark']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Size'),
            trailing: DropdownButton<String>(
              value: _size,
              onChanged: (String? newValue) {
                setState(() {
                  _size = newValue!;
                });
              },
              items: <String>['Small', 'Medium', 'Large']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Font Size'),
            trailing: DropdownButton<String>(
              value: _fontSize,
              onChanged: (String? newValue) {
                setState(() {
                  _fontSize = newValue!;
                });
              },
              items: <String>['Small', 'Medium', 'Large']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
