import 'package:flutter/material.dart';
import 'package:hello2fa/core/constant/app_constants.dart';
import 'package:hello2fa/core/enums/screen.dart';
import 'package:hello2fa/pages/about/about_us_page.dart';
import 'package:hello2fa/pages/extension/extension.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(Author.username),
            accountEmail: Text(Author.email),
            otherAccountsPictures: <Widget>[
              IconButton(
                icon: Icon(Icons.info, color: Colors.white, size: 36.0),
                onPressed: () async {
                  await context.adaptiveNavigate(Screen.about, AboutUsPage());
                },
              ),
            ],
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              backgroundImage: AssetImage("assets/images/one_more_light.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
