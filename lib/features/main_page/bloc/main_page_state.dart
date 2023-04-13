import 'package:flutter/material.dart';
import 'package:bank_assignment/custom_icons/my_flutter_app_icons.dart' as CustomIcon;

import '../../../app_helper/enums.dart';
import '../data/dashboard.dart';
import '../data/drawer_tab.dart';

class MainPageState {
  PageState pageState;
  Dashboard? dashboard;

  List<DrawerTab> get drawerTabs => [
        DrawerTab(
            //Done
            title: 'loan',
            icon: CustomIcon.MyFlutterApp.cash_loan,
            tabs: [
              SubTab(title: 'Loan plan'),
              SubTab(title: 'All loans'),
              SubTab(title: 'Pending loan'),
              SubTab(title: 'Running loans'),
              SubTab(title: 'Paid Loan'),
              SubTab(title: 'Rejected Loan'),
            ]),
        DrawerTab(
            //Done
            title: 'dps'.toUpperCase(),
            icon: CustomIcon.MyFlutterApp.dps,
            tabs: [
              SubTab(title: 'Dps plan'),
              SubTab(title: 'All dps'),
              SubTab(title: 'Running Dps'),
              SubTab(title: 'Matured Dps'),
            ]),
        DrawerTab(title: 'fdr'.toUpperCase(), icon: CustomIcon.MyFlutterApp.fdr, tabs: [
          SubTab(title: 'Fdr plan'),
          SubTab(title: 'All Fdr'),
          SubTab(title: 'Running Fdr'),
          SubTab(title: 'Closed Fdr'),
        ]),
        DrawerTab(
            //Done
            title: 'Request Money',
            icon: CustomIcon.MyFlutterApp.request_money,
            tabs: [
              SubTab(title: 'Send Request Money'),
              SubTab(title: 'Receive Request Money'),
            ]),
        DrawerTab(
          //Done
          title: 'Deposit',
          icon: CustomIcon.MyFlutterApp.deposit,
          tabs: [],
        ),
        DrawerTab(
            //Done
            title: 'Wire transfer',
            icon: CustomIcon.MyFlutterApp.wire_transfer,
            tabs: []),
        DrawerTab(
            //Done
            title: 'Transfer',
            icon: CustomIcon.MyFlutterApp.transaction,
            tabs: [
              SubTab(title: 'Send Money'),
              SubTab(title: 'Beneficiary Manage'),
              SubTab(title: 'Other Bank Transfer'),
              SubTab(title: 'Transfer History'),
            ]),
        DrawerTab(
            //Done
            title: 'Withdraw',
            icon: CustomIcon.MyFlutterApp.withdraw,
            tabs: []),
        DrawerTab(
            //Done
            title: 'Pricing Plan}',
            icon: CustomIcon.MyFlutterApp.pricing_plan,
            tabs: []),
        DrawerTab(title: 'More', icon: CustomIcon.MyFlutterApp.more, tabs: [
          SubTab(title: '2FA Security'),
          SubTab(title: 'Referred Users'),
          SubTab(title: 'Referral Commission'),
          SubTab(title: 'Support Tickets'),
          SubTab(title: 'Transactions'),
        ]),
        DrawerTab(
          //Done
          title: 'Settings',
          icon: Icons.settings,
          tabs: [],
        ),
      ];

  MainPageState({
    this.dashboard,
    this.pageState = PageState.Loading,
  });

  MainPageState init() {
    return MainPageState();
  }

  MainPageState clone({
    Dashboard? dashboard,
    PageState? pageState,
  }) {
    return MainPageState(
      dashboard: dashboard ?? this.dashboard,
      pageState: pageState ?? this.pageState,
    );
  }
}
