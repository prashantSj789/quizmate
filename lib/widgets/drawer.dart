import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Screens/loginscreen.dart';
import 'package:quiz_app/widgets/provider.dart';

class DrawerBox extends StatefulWidget {
  const DrawerBox({super.key});

  @override
  State<DrawerBox> createState() => _DrawerBoxState();
}

class _DrawerBoxState extends State<DrawerBox> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Consumer<UiProvider>(
        builder: (context,UiProvider notifier,child) {
        return ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 42, 27, 61),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Edit Profile'),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Theme'),
              trailing: Switch(
                value: notifier.isDark,
                onChanged: (value)=>notifier.changeTheme(),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
              ),
            ),
          ],
        );
      }
    );
  }
}
