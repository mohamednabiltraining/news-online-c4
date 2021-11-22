import 'package:flutter/material.dart';
import 'package:news_online_c4/TabItem.dart';
import 'package:news_online_c4/data/model/sources_response.dart';
import 'package:news_online_c4/news_list_widget.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 0,
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              padding: EdgeInsets.all(8),
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              tabs: widget.sources
                  .map((element) => TabItem(element,
                      selectedIndex == widget.sources.indexOf(element)))
                  .toList(),
            ),
            NewsListWidget(
              source: widget.sources[selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
