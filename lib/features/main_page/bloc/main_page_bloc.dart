import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../app_helper/enums.dart';
import '../data/dashboard.dart';
import 'main_page_event.dart';
import 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  RefreshController refreshController = RefreshController();

  MainPageBloc() : super(MainPageState().init()) {
    on<InitEvent>(_init);
    on<GetDashboard>(_getAuthUser);
  }

  void _init(InitEvent event, Emitter<MainPageState> emit) async {
    emit(state.clone());
    add(GetDashboard());
  }

  @override
  Future<void> close() {
    return super.close();
  }

  Future _getAuthUser(GetDashboard event, Emitter<MainPageState> emit) async {
    emit(
      state.clone(
        dashboard: Dashboard(),
        pageState: PageState.Success,
      ),
    );
    refreshController.refreshCompleted();
  }
}
