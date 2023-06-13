import 'package:latlong2/latlong.dart';

class AddressModel {
  final String address;

  AddressModel({
    required this.address,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    LatLng? location;
    if (double.tryParse(json['lat']) != null &&
        double.tryParse(json['lon']) != null) {
      location =
          LatLng(double.tryParse(json['lat'])!, double.tryParse(json['lon'])!);
    }

    var dataMap = json['address'] as Map<String, dynamic>;

    return AddressModel(
      address: dataMap.values.first,
    );
  }
}