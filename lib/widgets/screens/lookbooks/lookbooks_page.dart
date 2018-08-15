import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/models/lookbook.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_burger_bar.dart';
import 'package:glam/widgets/partials/mk_drawer.dart';
import 'package:glam/widgets/screens/lookbooks/ui/book_grid_item.dart';

class LookbooksPage extends StatefulWidget {
  @override
  _LookbooksPageState createState() => new _LookbooksPageState();
}

class _LookbooksPageState extends State<LookbooksPage> {
  final List<LookbookModel> books = [
    LookbookModel(title: "T-Shirt", count: 123),
    LookbookModel(title: "Dress", count: 123),
    LookbookModel(title: "Bodysuit", count: 123),
    LookbookModel(title: "Jeans", count: 123),
    LookbookModel(title: "T-Shirt", count: 123),
    LookbookModel(title: "Bodysuit", count: 123),
    LookbookModel(title: "Dress", count: 123),
    LookbookModel(title: "Dress", count: 123),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MkBurgerBar(
        currentPage: MkPages.Lookbooks,
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Lookbooks",
                      style: MkTheme.of(context).display3,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  _buildFilterBlock(context),
                  Divider(height: 1.0),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
            _buildGridItems()
          ],
        ),
      ),
    );
  }

  Widget _buildGridItems() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverGrid(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.82,
        ),
        delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return new BookGridItem(
              lookbook: books[index],
            );
          },
          childCount: books.length,
        ),
      ),
    );
  }

  Widget _buildFilterBlock(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 2.0)),
            ),
            child: new Text(
              "Filter by Year",
              style: MkTheme.of(context).subhead1,
            ),
          ),
          DropdownButtonHideUnderline(
            child: new DropdownButton<String>(
              hint: Text(
                "2018",
                style: MkTheme.of(context).subhead3.copyWith(
                      color: kHintColor,
                    ),
              ),
              elevation: 0,
              items: <String>['2019', '2019', '2019'].map(
                (String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(
                      value,
                      style: MkTheme.of(context).subhead3,
                    ),
                  );
                },
              ).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
