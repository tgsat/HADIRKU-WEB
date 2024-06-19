import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

import 'widgets/card/account/account_card_large.dart';
import 'widgets/card/change_password/change_password_card_large.dart';
import 'widgets/card/non_active_account/non_active_account_card_large.dart';
import 'widgets/card/social_media/social_media_card_large.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  int indexTab = 0;
  late TabController tabController;
  late ScrollController scrollTabController;

  _handleTabSelection() {
    if (tabController.indexIsChanging) {
      setState(() {
        indexTab = tabController.index;
      });
    }
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(_handleTabSelection);
    scrollTabController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollTabController.dispose();
    super.dispose();
  }

  void scrollTabBar(int scrollAmount) {
    if (scrollTabController.hasClients) {
      final maxScrollExtent = scrollTabController.position.maxScrollExtent;
      final newPosition = scrollTabController.offset + scrollAmount;
      if (newPosition >= 0 && newPosition <= maxScrollExtent) {
        scrollTabController.animateTo(
          newPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    }
  }

  List<Widget> tabs = const [
    Tab(text: Dictionary.account),
    // Tab(text: Dictionary.editProfile),
    Tab(text: Dictionary.changePassword),
    Tab(text: Dictionary.socialMedia),
    Tab(text: Dictionary.nonActiveAccount),
  ];
  List<Widget> view = const [
    AccountCardLarge(),
    // EditProfileCardLarge(),
    ChangePasswordCardLarge(),
    SocialMediaCardLarge(),
    NonActiveAccountCardLarge(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 72),
      child: Column(
        children: [
          CustomTabBar(controller: tabController, tabs: tabs),
          const SizedBox(height: 16),
          Flexible(
            child: TabBarView(
              controller: tabController,
              children: view,
            ),
          ),
        ],
      ),
    );
  }
}
