import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress_bloc/business_logic/auth_bloc/auth_bloc.dart';
import 'package:wordpress_bloc/presentation/export.dart';
import 'package:wordpress_bloc/presentation/routes/app_routes.dart';

import 'business_logic/app_bloc_observer.dart';
import 'core/theme/my_app_theme.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(Authinit()),
      child: MaterialApp(
          themeMode: ThemeMode.system,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          debugShowCheckedModeBanner: false,
          // home: LoginScreen(),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
    );
  }
}
