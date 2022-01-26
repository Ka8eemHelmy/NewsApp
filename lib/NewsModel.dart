import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsModel {

  static Widget buildNews(model) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                '${model['urlToImage']}',
              ),
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 10.0, top: 10.0),
                child: ListTile(
                  title: Text(
                    '${model['title']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${model['description']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  dense: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
