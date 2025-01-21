import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:task1/features/api/repository_impl.dart";
import "package:task1/features/cart/bloc/cart_bloc.dart";
import "package:task1/features/cart/presentation/pages/cart_page.dart";
import "package:task1/features/favorite/bloc/favorites_bloc.dart";
import "package:task1/features/favorite/presentation/pages/favorites_page.dart";
import "package:task1/features/home/blocs/home_bloc.dart";
import "package:task1/features/search/bloc/search_bloc.dart";
import "package:task1/features/search/presentation/pages/search_page.dart";
import "../features/home/presentation/pages/home_page.dart";
import "../features/main/presentation/bloc/main_bloc.dart";
import "../features/main/presentation/pages/main_page.dart";
import "../features/profile/presentation/bloc/profile_bloc.dart";
import "../features/profile/presentation/pages/profile_page.dart";
import "../splash_page.dart";


part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();





final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),

    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (
        _,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) =>
          BlocProvider<MainBloc>(
        key: state.pageKey,
        create: (_) => MainBloc(),
        child: MainPage(
          key: state.pageKey,
          navigationShell: navigationShell,
        ),
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: Routes.explore,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.explore,
              name: Routes.explore,
              builder: (_, __) =>
                 BlocProvider<HomeBloc>(
                 create: (_) => HomeBloc(repository: RepositoryIml(Dio()))
                  , child:
                  const HomePage(),
                 ),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.search,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.search,
              name: Routes.search,
              builder: (_, __) => BlocProvider<SearchBloc>(
                  create: (_)=>SearchBloc(repository: RepositoryIml(Dio())),
                  child: const SearchPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.favourites,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.favourites,
              name: Routes.favourites,
              builder: (_, __) => BlocProvider<FavoritesBloc>(
                  create: (_)=>FavoritesBloc(),
                  child: const FavoritesPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.cart,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.cart,
              name: Routes.cart,
              builder: (_, __) => BlocProvider<CartBloc>(
                  create: (_)=>CartBloc(),
                  child: const CartPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.profile,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.profile,
              name: Routes.profile,
              builder: (_, __) => BlocProvider<ProfileBloc>(
                  create: (_)=>ProfileBloc(),
                  child: const ProfilePage()),
            ),
          ],
        ),
      ],
    ),

    /// home features
    // GoRoute(
    //   path: Routes.story,
    //   name: Routes.story,
    //   parentNavigatorKey: rootNavigatorKey,
    //   builder: (_, __) => const StoryPage(),
    // ),
    // GoRoute(
    //   path: Routes.onboarding,
    //   name: Routes.onboarding,
    //   parentNavigatorKey: rootNavigatorKey,
    //   builder: (_, __) => BlocProvider<OnboardingBloc>(
    //     create: (_) => sl<OnboardingBloc>(),
    //     child: const OnboardingPage(),
    //   ),
    // ),
    //
    // /// Auth
    // GoRoute(
    //   path: Routes.auth,
    //   name: Routes.auth,
    //   parentNavigatorKey: rootNavigatorKey,
    //   builder: (_, __) => BlocProvider<AuthBloc>(
    //     create: (_) => sl<AuthBloc>(),
    //     child: const AuthPage(),
    //   ),
    // ),


  ],
);
