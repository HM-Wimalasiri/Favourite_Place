import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });
  final double longitude;
  final double latitude;
  final String address;
}

class Place {
  Place({
    required this.title,
    required this.image,
    required this.location,
    id
  }) : id =id ?? uuid.v4();
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
