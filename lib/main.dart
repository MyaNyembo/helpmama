//import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:monapp/values/values.dart';
import 'package:monapp/video_info.dart';

import 'home_page.dart';
import 'login/login_bloc/login_cubit.dart';
import 'login/login_page.dart';
import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter HelpMama',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
          ),
          //useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

