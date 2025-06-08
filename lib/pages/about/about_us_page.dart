import 'package:flutter/material.dart';
import 'package:hello2fa/core/constant/app_constants.dart';
import 'package:hello2fa/core/utils/keys.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About", key: ValueKey(AboutUsKeys.titleAbout)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.bug_report, color: Colors.black),
                    title: Text(
                      "Report an Issue",
                      key: ValueKey(AboutUsKeys.titleReport),
                    ),
                    subtitle: Text(
                      "Having an issue ? Report it here",
                      key: ValueKey(AboutUsKeys.subtitleReport),
                    ),
                    onTap: () => () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.update, color: Colors.black),
                    title: Text("Version"),
                    subtitle: FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        final versionName = snapshot.data?.version ?? '1.0.0';
                        return Text(
                          versionName,
                          key: ValueKey(AboutUsKeys.versionNumber),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text(
                      "Author",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Fonts.fontMedium,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.perm_identity, color: Colors.black),
                    title: Text(
                      "changjun",
                      key: ValueKey(AboutUsKeys.authorName),
                    ),
                    subtitle: Text(
                      "photowey",
                      key: ValueKey(AboutUsKeys.authorUsername),
                    ),
                    onTap: () => () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.bug_report, color: Colors.black),
                    title: Text("Fork on Github"),
                    onTap: () => () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.black),
                    title: Text("Send an Email"),
                    subtitle: Text(
                      Author.email,
                      key: ValueKey(AboutUsKeys.authorEmail),
                    ),
                    onTap: () => () {},
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text(
                      "Ask Question ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Fonts.fontMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset(
                            "assets/images/github.png",
                            scale: 8.75,
                          ),
                          onPressed: () => () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text(
                      "Apache Licensee",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Fonts.fontMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      subtitle: Text(
                        "Copyright (c) 2025-present photowey<photowey@gmail.com>"
                        '\n\nLicensed under the Apache License, Version 2.0 (the "License") you may not use this file except in compliance with the License. You may obtain a copy of the License at'
                        "\n\n\nhttp://www.apache.org/licenses/LICENSE-2.0"
                        '\n\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
