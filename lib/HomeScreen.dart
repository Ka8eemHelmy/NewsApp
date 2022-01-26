import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/AppCubit.dart';
import 'package:news_app/AppStates.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  cubit.iconAppBar[cubit.currentIndex],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "${cubit.tittleAppBar[cubit.currentIndex]}",
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: "Business",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball),
                label: "Sports",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_outlined),
                label: "Science",
              ),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.bottomNavigationIndexChange(index);
            },
          ),
        );
      },
    );
  }
}
