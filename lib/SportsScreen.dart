
import 'package:flutter/material.dart';

import 'AppCubit.dart';
import 'NewsModel.dart';

class SportsScreen extends StatelessWidget {
  SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) => NewsModel.buildNews(AppCubit.get(context).sportsList[index]),
        separatorBuilder: (context, index) => SizedBox(height: 10.0,),
        itemCount: AppCubit.get(context).sportsList.length);
  }
}
