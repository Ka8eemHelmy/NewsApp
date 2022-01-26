import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/AppCubit.dart';
import 'package:news_app/AppNewsApi.dart';
import 'package:news_app/AppStates.dart';
import 'package:news_app/HomeScreen.dart';
import 'package:news_app/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme: (AppBarTheme(
                  backgroundColor: Colors.deepOrangeAccent,
                )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrangeAccent,
                )),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
