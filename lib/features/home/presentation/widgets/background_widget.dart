import 'package:flutter/material.dart';

import '../../../../core/components/custom_page_view.dart';
import 'customer_quick_service.dart';
import 'page_title.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({super.key});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: PageTitle(
                  title: 'Saloon',
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                child: CustomPageView(
                  height: size.height * 0.66,
                  viewportFraction: 0.9,
                  children: [
                    CustomerQuickService(
                      data: CustomerQuickServiceModel(
                        firstName: 'Ton',
                        lastName: 'Sébastien',
                        withName: 'Jay Williams',
                        startAt: '09:30',
                        location: 'au salon',
                        estimationTime: '01:09:26',
                        price: 100,
                        service: 'Shampoing et soins',
                      ),
                    ),
                    CustomerQuickService(
                      data: CustomerQuickServiceModel(
                        firstName: 'Ton',
                        lastName: 'Sébastien',
                        withName: 'Jay Williams',
                        startAt: '09:30',
                        location: 'au salon',
                        estimationTime: '01:09:26',
                        price: 100,
                        service: 'Shampoing et soins',
                      ),
                    ),
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

class CustomerQuickServiceModel {
  final String firstName;
  final String lastName;
  final String withName;
  final String startAt;
  final String location;
  final String estimationTime;
  final num price;
  final String service;
  final String? description;
  final String? comment;

  CustomerQuickServiceModel({
    required this.firstName,
    required this.lastName,
    required this.withName,
    required this.startAt,
    required this.location,
    required this.estimationTime,
    required this.price,
    required this.service,
    this.description,
    this.comment,
  });

  String get getFullNamme => '$firstName $lastName';
}
