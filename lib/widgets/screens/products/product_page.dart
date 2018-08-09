import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_launch.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';
import 'package:glam/widgets/partials/mk_primary_button.dart';
import 'package:glam/widgets/partials/mk_products_grid.dart';
import 'package:glam/widgets/screens/designers/designer_page.dart';
import 'package:glam/widgets/views/image_view.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => new _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CustomScrollView(
            // shrinkWrap: true,
            slivers: <Widget>[
              _buildAppBar(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildButtonBlock(),
                    Divider(height: 0.0),
                    SizedBox(height: 8.0),
                    _buildInfoBlock(),
                    SizedBox(height: 8.0),
                    Divider(height: 0.0),
                    _buildCenterBlock(),
                    Divider(height: 0.0),
                    SizedBox(height: 8.0),
                    _buildRelatedBlock(),
                    SizedBox(height: 80.0),
                  ],
                ),
              )
            ],
          ),
          Positioned.fill(
            bottom: 0.0,
            top: null,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: MkPrimaryButton(
                onPressed: () {
                  const product = "Mini Cami Skater Dress";
                  email(
                    "GLAM - Enquiry for $product",
                    "nd@siliconbear.com",
                  );
                },
                child: Text("Contact"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCenterBlock() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(left: 24.0),
            dense: true,
            title: Text(
              "Product Details",
              style: MkTheme.of(context).bodyMedium,
            ),
            trailing: MkClearButton(
              child: Icon(MkIcons.Chevron___Right, size: 16.0),
              onPressed: () {},
            ),
          ),
          Divider(height: 0.0, indent: 24.0),
          ListTile(
            contentPadding: EdgeInsets.only(left: 24.0),
            dense: true,
            title: Text(
              "Size Guide",
              style: MkTheme.of(context).bodyMedium,
            ),
            trailing: MkClearButton(
              child: Icon(MkIcons.Chevron___Right, size: 16.0),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonBlock() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MkClearButton(
            child: Icon(MkIcons.Heart, size: 18.0),
            onPressed: () {},
          ),
          Container(width: 1.0, height: 32.0, color: kBorderSideColor),
          MkClearButton(
            child: Icon(MkIcons.Play, size: 18.0),
            onPressed: () {},
          ),
          Container(width: 1.0, height: 32.0, color: kBorderSideColor),
          MkClearButton(
            child: Icon(MkIcons.Share___3, size: 18.0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedBlock() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Also By This Designer",
            style: MkTheme.of(context).subhead1,
          ),
          SizedBox(height: 16.0),
          MkProductsGrid(),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildInfoBlock() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mini Cami Skater Dress",
                style: MkTheme.of(context).subhead1,
              ),
              SizedBox(height: 2.0),
              GestureDetector(
                child: Text(
                  "Lanre DaSilva",
                  style: MkTheme.of(context).subhead1Light,
                ),
                onTap: () {
                  MkNavigate(context, DesignerPage());
                },
              ),
            ],
          ),
          Text(
            "N1600",
            style: MkTheme.of(context).subhead1Bold,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: MkColors.black.shade900,
      brightness: Brightness.dark,
      leading: MkBackButton(color: Colors.white),
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height / 2.0,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildAppBarBackground(),
      ),
    );
  }

  Widget _buildAppBarBackground() {
    return new Swiper(
      itemBuilder: _slideBuilder,
      itemCount: 3,
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          size: 5.0,
        ),
      ),
      onTap: (index) {
        Navigator.of(context).push<dynamic>(
          fadeInRoute(
            images: [
              MkImages.o6,
              MkImages.o6,
              MkImages.o6,
            ],
            index: index,
          ),
        );
      },
      autoplay: true,
      duration: 1500,
      autoplayDelay: 5000,
    );
  }

  Widget _slideBuilder(BuildContext _, int index) {
    return new Image(
      image: MkImages.o6,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
    );
  }
}
