import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/widgets/views/image_view.dart';

class PhotoReelGrid extends StatelessWidget {
  final List<ImageProvider> images;
  final double height;

  const PhotoReelGrid({
    Key key,
    this.height = 164.0,
    @required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: kBorderRadius,
              child: Container(
                width: height - 40.0,
                child: Material(
                  child: new Ink.image(
                    image: images[index],
                    fit: BoxFit.cover,
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push<dynamic>(
                          fadeInRoute(
                            images: images,
                            index: index,
                          ),
                        );
                      },
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
