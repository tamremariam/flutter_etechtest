import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:etechtest/core/dependency_injection/dependency_injection.dart';
import 'package:etechtest/core/route/router.dart';
import 'package:etechtest/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:etechtest/features/authentication/presentation/signup/bloc/signup_bloc.dart';
import 'package:etechtest/features/home/presentation/home/bloc/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  authenticationDependencyInjection();
  homeDependencyInjection();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => sl<LoginBloc>(),
          ),
          BlocProvider<SignupBloc>(
            create: (context) => sl<SignupBloc>(),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => s2<HomeBloc>(),
          ),
        ],
        child: Builder(builder: (context) {
          return MediaQuery(
            //this line is used to make use font is similar for all devices
            //this line must be removed after development
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(MediaQuery.of(context)

                  // ignore: deprecated_member_use
                  .textScaleFactor
                  .clamp(1, 1.2)),
            ),
            child: MaterialApp.router(
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                ],
                locale: const Locale('en'),
                title: 'Etech test',
                // theme: AppThemes.lightTheme,
                // darkTheme: AppThemes.darkTheme,
                // themeMode: ThemeMode.system,
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router),
          );
        }),
      ),
      // )
    );
  }
}
