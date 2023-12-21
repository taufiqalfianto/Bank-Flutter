import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/user/user_bloc.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/data_package_page.dart';
import 'package:bank/ui/pages/data_provider_page.dart';
import 'package:bank/ui/pages/data_succes_page.dart';
import 'package:bank/ui/pages/home_page.dart';
import 'package:bank/ui/pages/onboarding_page.dart';
import 'package:bank/ui/pages/pin_page.dart';
import 'package:bank/ui/pages/profile_edit_page.dart';
import 'package:bank/ui/pages/profile_edit_pin.dart';
import 'package:bank/ui/pages/profile_edit_succes.dart';
import 'package:bank/ui/pages/profile_page.dart';
import 'package:bank/ui/pages/sign_in_page.dart';
import 'package:bank/ui/pages/sign_up_page.dart';
import 'package:bank/ui/pages/sign_up_succes.dart';
import 'package:bank/ui/pages/splash_page.dart';
import 'package:bank/ui/pages/topup_page.dart';
import 'package:bank/ui/pages/topup_succes_page.dart';
import 'package:bank/ui/pages/transfer_page.dart';
import 'package:bank/ui/pages/transfer_succes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-up-succes': (context) => SignUpSucces(),
          '/home': (context) => HomePage(),
          '/profile': (context) => ProfilePage(),
          '/pin': (context) => PinPage(),
          '/edit-profile': (context) => EditProfile(),
          '/edit-pin': (context) => EditPin(),
          '/edit-profile-succes': (context) => ProfileEditSucces(),
          '/topup': (context) => TopupPage(),
          '/topup-succes': (context) => TopupSuccesPage(),
          '/transfer': (context) => TransferPage(),
          '/transfer-succes': (context) => TransferSuccesPage(),
          '/data-provider': (context) => DataProviderPage(),
          '/data-package': (context) => DataPackagePage(),
          '/data-succes': (context) => DataSuccesPage(),
        },
      ),
    );
  }
}
