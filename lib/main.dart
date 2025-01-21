import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/features/api/repository_impl.dart';
import 'package:task1/features/cart/bloc/cart_bloc.dart';
import 'package:task1/features/favorite/bloc/favorites_bloc.dart';
import 'package:task1/features/home/blocs/home_bloc.dart';
import 'package:task1/features/main/presentation/bloc/main_bloc.dart';
import 'package:task1/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:task1/features/search/bloc/search_bloc.dart';
import 'package:task1/router/app_routes.dart';
import 'package:task1/splash_page.dart';

import 'core/local_source/local_source.dart';

void main() async {
  runApp(const MyApp());
  await initHive();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (_) => MainBloc()),
        BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(repository: RepositoryIml(Dio()))
              ..add(ProductHomeEvent())),
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
        BlocProvider<SearchBloc>(
            create: (_) => SearchBloc(repository: RepositoryIml(Dio()))),
        BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
        BlocProvider<FavoritesBloc>(create: (_) => FavoritesBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
