import 'package:devendramaurya/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/theme/bloc/theme_bloc/theme_bloc.dart';
import 'app/theme/theme_utils.dart';
import 'features/dashboard/dashboard_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    return BlocProvider(
      create: (context) => ThemeBloc()..add(ThemeLoadEvent(brightness: brightness)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.system;
          if (state is ThemeSuccess) {
            themeMode = state.themeMode;
          }
          return MaterialApp(
            title: 'Devendra',
            theme: theme.light(),
            darkTheme: theme.dark(),
            themeMode: ThemeMode.dark,
            initialRoute: "/",
            routes: {
              "/": (context) => const DashboardScreen(),
            },
          );
        },
      ),
    );
  }
}
