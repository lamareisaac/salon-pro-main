import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/custom_page_view.dart';
import '../../../../core/utils/font.dart';

class SaloonCustomerPage extends StatefulWidget {
  const SaloonCustomerPage({super.key});

  @override
  State<SaloonCustomerPage> createState() => _SaloonCustomerPageState();
}

class _SaloonCustomerPageState extends State<SaloonCustomerPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sliders = [
      SliderItemViewModel(
          image: AssetImage('assets/images/customer/slider_1.png'),
          button: 'Voir le profil'),
      SliderItemViewModel(
          image: AssetImage('assets/images/customer/slider_2.png'),
          button: 'Essayer'),
      SliderItemViewModel(
          image: AssetImage('assets/images/customer/slider_3.png'),
          button: 'Voir les conditions'),
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'Saloon',
                style: GoogleFonts.poppins(fontSize: 36),
              ),
              Container(
                width: size.width,
                height: size.height * 0.95,
                child: Stack(
                  children: [
                    SizedBox(
                      child: CustomPageView(
                        height: 231,
                        children: sliders
                            .map((item) => CustomerSlideItem(
                                  image: item.image,
                                  buttonText: item.button,
                                ))
                            .toList(),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Material(
                        elevation: 6,
                        child: Container(
                          height: size.height * 0.67,
                          width: size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Service rapide',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _QuickServiceCategoryItem(
                                title: 'Coiffure',
                              ),
                              _QuickServiceCategoryItem(
                                title: 'Barbier',
                              ),
                              _QuickServiceCategoryItem(
                                title: 'Ongles',
                              ),
                              _QuickServiceCategoryItem(
                                title: 'Massage',
                              ),
                              _QuickServiceCategoryItem(
                                title: 'Tatouage',
                              ),
                              _QuickServiceCategoryItem(
                                title: 'Spa',
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickServiceCategoryItem extends StatelessWidget {
  final String title;
  // final ImageProvider image;
  const _QuickServiceCategoryItem({
    super.key,
    required this.title,
    // required this.image,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/coiffure.jpg') as ImageProvider,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextBordered(
            text: title,
            color: AppColors.white,
            borderColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}

class TextBordered extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final double? fontSize;
  const TextBordered({
    super.key,
    required this.text,
    required this.color,
    required this.borderColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Implement the stroke
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: fontSize ?? 30,
              letterSpacing: 5,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = borderColor,
            ),
          ),
          // The text inside
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: fontSize ?? 30,
              letterSpacing: 5,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerSlideItem extends StatelessWidget {
  final ImageProvider image;
  final String buttonText;
  final Function? action;
  const CustomerSlideItem(
      {super.key, required this.image, required this.buttonText, this.action});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: image),
            ),
          ),
          SizedBox(
            height: size.width * 0.7,
            child: Column(
              children: [
                Wrap(
                  children: [
                    Text(
                      "Hilligo, l'un des meilleurs salons de coiffure a montreal",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (action != null) {
                          action!();
                        }
                      },
                      child: Text(
                        buttonText,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliderItemViewModel {
  final ImageProvider image;
  final String button;

  SliderItemViewModel({required this.image, required this.button});
}
