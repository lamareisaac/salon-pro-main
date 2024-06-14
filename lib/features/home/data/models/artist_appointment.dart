import 'package:flutter/material.dart';

class ArtistAppointment {
  String name;
  final Color color;
  List<CustomerAppointment> customerAppointments;

  ArtistAppointment({
    required this.name,
    required this.customerAppointments,
    this.color = Colors.green,
  });

  factory ArtistAppointment.fromJson(Map<String, dynamic> json) {
    return ArtistAppointment(
      name: json["name"],
      customerAppointments: (json["customers"] as List)
          .map((item) => CustomerAppointment.fromJson(item))
          .toList(),
    );
  }

  static List<CustomerAppointment> getListFromArtistList(
      List<ArtistAppointment> artists) {
    List<CustomerAppointment> customersList = [];
    for (var i = 0; i < artists.length; i++) {
      ArtistAppointment artist = artists[i];
      customersList = [
        ...customersList,
        ...artist.customerAppointments,
      ];
    }

    return customersList;
  }

  static List<ArtistAppointment> generate() {
    List<Map<String, dynamic>> data = [
      {
        "name": "Bernado R",
        "customers": [
          {
            "name": "Selma Robert",
            "service": "Balayage Ombré",
            "start_time": "2024-03-17 10:05:00",
            "end_time": "2024-03-17 11:05:00",
          },
          {
            "name": "Inconnu",
            "service": "Permanente Wavy",
            "start_time": "2024-03-17 11:20:00",
            "end_time": "2024-03-17 11:50:00",
          }
        ]
      },
      {
        "name": "Richard",
        "customers": [
          {
            "name": "Josh okongo",
            "service": "Coupe + Shampoing",
            "start_time": "2024-03-17 10:20:00",
            "end_time": "2024-03-17 10:50:00",
          },
          {
            "name": "Inconnu",
            "service": "Shampoing et soins",
            "start_time": "2024-03-14 11:05:00",
            "end_time": "2024-03-14 12:05:00",
          }
        ]
      }
    ];

    return data.map((e) => ArtistAppointment.fromJson(e)).toList();
  }
}

class CustomerAppointment {
  String name;
  String service;
  DateTime startTime;
  DateTime endTime;

  CustomerAppointment({
    required this.name,
    required this.service,
    required this.startTime,
    required this.endTime,
  });

  factory CustomerAppointment.fromJson(Map<String, dynamic> json) {
    DateTime start = DateTime.parse(json["start_time"]);
    DateTime end = DateTime.parse(json["end_time"]);

    return CustomerAppointment(
      name: json["name"],
      service: json["service"],
      startTime: start,
      endTime: end,
    );
  }
}
