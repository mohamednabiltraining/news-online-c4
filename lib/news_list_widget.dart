import 'package:flutter/material.dart';
import 'package:news_online_c4/data/api_manager.dart';
import 'package:news_online_c4/data/model/news_response.dart';
import 'package:news_online_c4/data/model/sources_response.dart';
import 'package:news_online_c4/news_item_widget.dart';

class NewsListWidget extends StatelessWidget {
  Source? source;
  String? query;

  NewsListWidget({this.source, this.query});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.loadNews(source?.id, query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('errrror ${snapshot.error.toString()}');
            //Todo:in case error retry
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          print('done ${snapshot.data?.articles?.length ?? 0}');
          return ListView.builder(
            itemBuilder: (buildContext, index) {
              return NewsItemWidget(snapshot.data!.articles!.elementAt(index));
            },
            itemCount: snapshot.data?.articles?.length ?? 0,
          );
        },
      ),
    );
  }
}
