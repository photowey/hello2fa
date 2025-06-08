import 'package:flutter/material.dart';
import 'package:hello2fa/core/bloc/bloc_provider.dart';
import 'package:hello2fa/core/constant/app_constants.dart';
import 'package:hello2fa/core/enums/screen.dart';
import 'package:hello2fa/pages/home/bloc/home_bloc.dart';

extension BlocExt on BuildContext {
  T bloc<T extends BlocBase>() {
    return BlocProvider.of(this);
  }
}

// ----------------------------------------------------------------

extension NavigatorExt on BuildContext {
  bool isWiderScreen() {
    return MediaQuery.of(this).size.width > ScreenThreshold.wider;
  }

  // ----------------------------------------------------------------

  void safePop() {
    if (Navigator.of(this).canPop()) {
      Navigator.pop(this, true);
    }
  }

  // ----------------------------------------------------------------

  adaptiveNavigate(Screen screen, Widget widget) async {
    final homeBloc = bloc<HomeBloc>();
    if (isWiderScreen()) {
      homeBloc.updateScreen(screen);

      return;
    }

    await Navigator.push(
      this,
      MaterialPageRoute<bool>(builder: (context) => widget),
    );
  }
}
