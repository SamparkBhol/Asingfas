import 'package:assignosfast/Features/Settings%20&%20Team%20Display/screens/Team%20Dispaly/TeamMembersName.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
    _loadNotificationPreference();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadNotificationPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
    });
  }

  Future<void> _saveNotificationPreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'SETTINGS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF191919),
              Color(0xFF232323),
              Color(0xFF544F4F),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _animation,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ÆSH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    SettingsButton(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      isSwitch: true,
                      value: notificationsEnabled,
                      onChanged: (value) async {
                        setState(() {
                          notificationsEnabled = value;
                        });
                        await _saveNotificationPreference(value);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(value ? 'Notifications enabled' : 'Notifications disabled'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    SettingsButton(
                      icon: Icons.account_circle,
                      title: 'Account',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AccountScreen()),
                        );
                      },
                    ),
                    SettingsButton(
                      icon: Icons.help_outline,
                      title: 'Help',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpScreen()),
                        );
                      },
                    ),
                    SettingsButton(
                      icon: Icons.info_outline,
                      title: 'About',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutScreen()),
                        );
                      },
                    ),
                    SettingsButton(
                      icon: Icons.group,
                      title: 'The Team',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => Teammembersname(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(position: offsetAnimation, child: child);
                            },
                          ),
                        );
                      },
                    ),
                    SettingsButton(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        // Implement logout logic here
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Logout'),
                              content: Text('Are you sure you want to logout?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Logout'),
                                  onPressed: () {
                                    // Implement logout logic here
                                    Navigator.of(context).pop();
                                    // Navigate to login screen or clear user session
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool isSwitch;
  final bool? value;
  final Function(bool)? onChanged;

  const SettingsButton({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.isSwitch = false,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: isSwitch ? null : onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              if (isSwitch)
                Switch(
                  value: value ?? false,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                )
              else
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Color(0xFF191919),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF191919), Color(0xFF232323), Color(0xFF544F4F)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to profile editing screen
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.white),
              title: Text('Email', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to email changing screen
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.white),
              title: Text('Password', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to password changing screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: Color(0xFF191919),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF191919), Color(0xFF232323), Color(0xFF544F4F)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: ListView(
          children: [
            ExpansionTile(
              title: Text('How to use the app', style: TextStyle(color: Colors.white)),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Detailed instructions on how to use the app...',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('FAQ', style: TextStyle(color: Colors.white)),
              children: [
                ListTile(
                  title: Text('Question 1', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Answer to question 1...', style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  title: Text('Question 2', style: TextStyle(color: Colors.white)),
                  subtitle: Text('Answer to question 2...', style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.contact_support, color: Colors.white),
              title: Text('Contact Support', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Open email client or chat support
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Color(0xFF191919),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF191919), Color(0xFF232323), Color(0xFF544F4F)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Name',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'This is a brief description of your app and its main features...',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 16),
              Text(
                'Developed by',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Your Company Name',
                style: TextStyle(color: Colors.white70),
              ),
              Spacer(),
              Center(
                child: Text(
                  '© 2023 Your Company. All rights reserved.',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
