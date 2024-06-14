import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/font.dart';
import 'my_spacing.dart';
import 'my_text.dart';

class ServiceCarousel extends StatefulWidget {
  final String label;
  final List<CarouselServiceItemModel> items;
  final EdgeInsets? padding;
  final ValueChanged<CarouselServiceItemModel> onSelectedTap;

  const ServiceCarousel({
    super.key,
    required this.label,
    required this.items,
    required this.onSelectedTap,
    this.padding,
  });

  @override
  State<ServiceCarousel> createState() => _ServiceCarouselState();
}

class _ServiceCarouselState extends State<ServiceCarousel> {
  late CarouselController controller;
  late CarouselServiceItemModel current;
  List<CarouselServiceItemModel> get items => widget.items;
  EdgeInsets? get padding => widget.padding;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    controller = CarouselController();
    current = items[initialPage];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = items
        .map((item) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(item.photo),
                  fit: BoxFit.cover,
                ),
              ),
            ))
        .toList();

    return Container(
      padding: padding,
      child: Material(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: MySpacing.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.titleLarge(
                    widget.label,
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  MyText.titleLarge(
                    current.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                widget.onSelectedTap(current);
              },
              child: Container(
                padding: MySpacing.symmetric(vertical: 8),
                child: CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 2.5,
                    viewportFraction: 0.5,
                    initialPage: initialPage,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    enlargeFactor: 0.3,
                    onPageChanged: (p, r) {
                      setState(() {
                        current = items[p];
                      });
                    },
                  ),
                  items: imageSliders,
                ),
              ),
            ),
            Padding(
              padding: MySpacing.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0,
                    child: MyText.titleLarge(
                      current.price,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 30,
                              child: Divider(
                                thickness: 1,
                                height: 1,
                                color: AppColors.black,
                              ),
                            ),
                            MySpacing.height(1.5),
                            SizedBox(
                              width: 37,
                              child: Divider(
                                thickness: 1.6,
                                height: 1.6,
                                color: AppColors.black,
                              ),
                            ),
                            MySpacing.height(1.5),
                            SizedBox(
                              width: 30,
                              child: Divider(
                                thickness: 1,
                                height: 1,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  MyText.titleLarge(
                    current.price,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(8),
          ],
        ),
      ),
    );
  }
}

class CarouselServiceItemModel {
  final String name;
  final String photo;
  final String price;

  CarouselServiceItemModel(
      {required this.name, required this.photo, required this.price});

  factory CarouselServiceItemModel.fromJson(Map<String, dynamic> json) {
    return CarouselServiceItemModel(
        name: json["name"], photo: json["photo"], price: "${json["price"]} \$");
  }

  static List<CarouselServiceItemModel> generate() {
    final List<Map<String, dynamic>> imgList = [
      {
        "name": "Intense",
        "price": 200,
        "photo":
            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      },
      {
        "name": "Ombré",
        "price": 210,
        "photo":
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      },
      {
        "name": "Broux",
        "price": 220,
        "photo":
            'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      },
      {
        "name": "Spiky",
        "price": 230,
        "photo":
            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      },
      {
        "name": "Tie die classique",
        "price": 240,
        "photo":
            'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      },
    ];

    return imgList
        .map((item) => CarouselServiceItemModel.fromJson(item))
        .toList();
  }
}
