import 'package:flutter/material.dart';
import 'package:hello2fa/core/bloc/bloc_provider.dart';
import 'package:hello2fa/core/enums/screen.dart';
import 'package:hello2fa/pages/about/about_us_page.dart';
import 'package:hello2fa/pages/extension/extension.dart';
import 'package:hello2fa/pages/home/bloc/home_bloc.dart';
import 'package:hello2fa/pages/home/home_page.dart';
import 'package:hello2fa/pages/home/side_drawer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0385F6);
    final theme = ThemeData(
      primaryColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.orange,
          primary: primaryColor,
        ),
      ),
      home: BlocProvider(bloc: HomeBloc(), child: AdaptiveHome()),
    );
  }
}

class AdaptiveHome extends StatelessWidget {
  const AdaptiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isWiderScreen() ? WiderHomePage() : HomePage();
  }
}

class WiderHomePage extends StatelessWidget {
  const WiderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.bloc<HomeBloc>();
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: StreamBuilder<Screen>(
            stream: homeBloc.screens,
            builder: (context, snapshot) {
              return SideDrawer();
            },
          ),
        ),
        SizedBox(width: 0.5),
        Expanded(
          flex: 5,
          child: StreamBuilder<Screen>(
            stream: homeBloc.screens,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                switch (snapshot.data) {
                  case Screen.about:
                    return AboutUsPage();
                  default:
                    throw UnimplementedError();
                }
              }
              return HomePage();
            },
          ),
        ),
      ],
    );
  }
}
