import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../gen/assets.gen.dart';
import '../../theme/app_color.dart';
import '../../widgets/app_background.dart';
import 'splash_bloc.dart';
import 'splash_event.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashBloc()..add(InitSplashEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SplashBloc>(context);

    return Scaffold(
      body: AppBackground(
        child: Center(child: Assets.banner.image(color: AppColor.logoColor)),
      ),
    );
  }
}
