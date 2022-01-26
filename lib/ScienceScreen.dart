
import 'package:flutter/material.dart';

import 'AppCubit.dart';
import 'NewsModel.dart';

class ScienceScreen extends StatelessWidget {
  ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) => NewsModel.buildNews(AppCubit.get(context).scienceList[index]),
        separatorBuilder: (context, index) => SizedBox(height: 10.0,),
        itemCount: AppCubit.get(context).scienceList.length);
  }
}
