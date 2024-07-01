import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kazi_companies/app_cubit.dart';
import 'package:kazi_companies/core/routes/routes.dart';
import 'package:kazi_core/kazi_core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (_) => AppCubit()),
      ],
      child: MaterialApp.router(
        title: 'Kazi Companies',
        debugShowCheckedModeBanner: false,
        theme: KaziThemeSettings.light(),
        darkTheme: KaziThemeSettings.dark(),
        themeMode: ThemeMode.light,
        localizationsDelegates: const [
          KaziLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: KaziLocalizations.delegate.supportedLocales,
        routerConfig: RoutesConfig.router,
      ),
    );
  }
}
