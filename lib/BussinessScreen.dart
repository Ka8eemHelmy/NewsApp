import 'package:flutter/material.dart';
import 'package:news_app/NewsModel.dart';

import 'AppCubit.dart';

class BussinessScreen extends StatelessWidget {
  BussinessScreen({Key? key}) : super(key: key);

  // List<NewsModel> data = [
  //   NewsModel(
  //   'https://img.youm7.com/large/202201261038113811.jpg',
  //   'January ended with record number of rainy days',
  //   'which covers some core city localities recorded zero rainfall only on January 14, 15 and 26, while Meenambakkam, covering southern suburbs',
  // ),
  //   NewsModel(
  //     'https://static.toiimg.com/thumb/msid-88041767,imgsize-2551091,width-400,resizemode-4/88041767.jpg',
  //     'November ended with record number of rainy days',
  //     'The observatories at Nungambakkam and Meenambakkam recorded 23 and 22 days of rainfall of 2.5mm and above in November',
  //   ),
  //   NewsModel(
  //     'https://static.toiimg.com/thumb/msid-88867494,imgsize-950630,width-400,resizemode-4/88867494.jpg',
  //     'Covid funds used, BMC looks at rainy-day kitty for Rs 300 crore',
  //     'MUMBAI: The Brihanmumbai Municipal Corporation (BMC) spent around Rs 1,300 crore on fighting the Covid-19 pandemic this year. With all its funds earmarked for the pandemic for this year already exhausted, the country’s richest civic body has moved a proposal to divert an additional Rs 300 crore for Covid-related spending till March 2022.',
  //   ),
  //   NewsModel(
  //     'https://static.toiimg.com/thumb/msid-88708013,imgsize-65298,width-400,resizemode-4/88708013.jpg',
  //     'England strike late, Australia 126/3 on rainy Day 1',
  //     'SYDNEY: England hit back late on a rain-marred opening day of the fourth Ashes Test to put Australia under pressure at the Sydney Cricket Ground on Wednesday.',
  //   ),
  //   NewsModel(
  //     'https://static.toiimg.com/thumb/msid-88514617,imgsize-36982,width-400,resizemode-4/88514617.jpg',
  //     'Brace for rainy week, fog to cloud New Year eve’s revelry',
  //     'The weather office on Sunday predicted some spells of rain b',
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>
            NewsModel.buildNews(AppCubit.get(context).businessList[index]),
        separatorBuilder: (context, index) => SizedBox(
              height: 10.0,
            ),
        itemCount: AppCubit.get(context).businessList.length);
  }
}
