import 'package:flutter/material.dart';
import 'package:news_online_c4/category_tabs_widget.dart';
import 'package:news_online_c4/data/api_manager.dart';
import 'package:news_online_c4/data/model/sources_response.dart';
import 'package:news_online_c4/item_category.dart';

class CategoryDetailsScreen extends StatelessWidget {
  Category category;

  CategoryDetailsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.loadNewsSources(category.categoryId),
        builder:
            (BuildContext context, AsyncSnapshot<SourcesResponse> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return CategoryTabsWidget(snapshot.data?.sources ?? []);
        },
      ),
    );
  }
}
