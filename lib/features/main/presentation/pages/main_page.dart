import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:task1/features/cart/presentation/pages/cart_page.dart";
import "package:task1/features/favorite/presentation/pages/favorites_page.dart";
import "package:task1/features/profile/presentation/pages/profile_page.dart";
import "package:task1/features/search/presentation/pages/search_page.dart";

import "../../../../constants/image_constants.dart";
import "../../../../core/app_color/app_colors.dart";
import "../../../home/presentation/pages/home_page.dart";

class MainPage extends StatelessWidget {
  const MainPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomePage(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              SvgIcons.icHome,
              color: Colors.black,
            ),
            inactiveIcon: SvgPicture.asset(
              SvgIcons.icHome,
              color: Colors.grey,
            ),
            title: "Home",
            activeForegroundColor: AppColors.black,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: const SearchPage(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              SvgIcons.icSearch,
              color: Colors.black,
            ),
            inactiveIcon: SvgPicture.asset(
              SvgIcons.icSearch,
              color: Colors.grey,
            ),
            activeForegroundColor: AppColors.black,
            inactiveForegroundColor: Colors.grey,
            title: "Browse",
          ),
        ),
        PersistentTabConfig(
          screen: const FavoritesPage(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              SvgIcons.icFavorites,
              color: Colors.black,
            ),
            inactiveIcon: SvgPicture.asset(
              SvgIcons.icFavorites,
              color: Colors.grey,
            ),
            activeForegroundColor: AppColors.black,
            inactiveForegroundColor: Colors.grey,
            title: "Favourites",
            // activeForegroundColor: AppColors.baseColor,
          ),
        ),
        PersistentTabConfig(
          screen: const CartPage(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              SvgIcons.icCart,
              color: Colors.black,
            ),
            inactiveIcon: SvgPicture.asset(
              SvgIcons.icCart,
              color: Colors.grey,
            ),
            activeForegroundColor: AppColors.black,
            inactiveForegroundColor: Colors.grey,
            title: "Cart",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfilePage(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              SvgIcons.icProfile,
              color: Colors.black,
            ),
            activeForegroundColor: AppColors.black,
            inactiveForegroundColor: Colors.grey,
            inactiveIcon: SvgPicture.asset(
              SvgIcons.icProfile,
              color: Colors.grey,
            ),
            title: "Profile",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: navigationShell.currentIndex != 0,
        onPopInvoked: (bool v) => navigationShell.goBranch(0),
        child: PersistentTabView(
          tabs: _tabs(),
          navBarBuilder: (NavBarConfig navBarConfig) => Style12BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      );

  void changeTap(
    int index,
    BuildContext context,
  ) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
