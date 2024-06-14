import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../../../core/components/saloon_app_bar.dart';
import '../../../../core/utils/font.dart';

class DetailedStatementPage extends StatelessWidget {
  const DetailedStatementPage({super.key});

  @override
  Widget build(BuildContext context) {
    double saloonIconSize = 40;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.appBarTitle('Relevés'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: MySpacing.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: saloonIconSize,
                    height: saloonIconSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(saloonIconSize),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/staff1.png"),
                            fit: BoxFit.cover)),
                  ),
                  MySpacing.width(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.titleLarge(
                        "Salon Hiligo",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      MyText.titleLarge(
                        "Votre salon",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: DetailedStatementListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedStatementListView extends StatelessWidget {
  const DetailedStatementListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "date": "20 Mai 2023",
        "statements": [
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
        ]
      },
      {
        "date": "19 Mai 2023",
        "statements": [
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
        ]
      },
      {
        "date": "18 Mai 2023",
        "statements": [
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
        ]
      },
      {
        "date": "17 Mai 2023",
        "statements": [
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
          {
            "service": "Dread",
            "price": 2500,
            "customer": "Nom client",
            "hour": "11:30"
          },
        ]
      }
    ];

    return Column(
      children: [
        ...data.map((item) => Container(
              padding: MySpacing.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.titleLarge(item["date"]),
                  MySpacing.height(10),
                  ...item["statements"].map((statement) => Container(
                        padding: MySpacing.only(bottom: 6),
                        margin: MySpacing.only(bottom: 6),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1, color: AppColors.saloonGreyBorder),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText.labelLarge(statement["service"],
                                    fontSize: 14),
                                MyText.labelLarge('\$${statement["price"]}',
                                    fontSize: 14),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText.labelLarge(statement["customer"],
                                    fontSize: 11),
                                MyText.labelLarge('${statement["hour"]}',
                                    fontSize: 11),
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )),
      ],
    );
  }
}
