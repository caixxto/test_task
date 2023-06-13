import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:test_app_flutter/feature/data/models/address_model.dart';

class SearchAddressRepository {

  Future<AddressModel> onLocationSearch(LatLng location) async {
    try {
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.latitude}&lon=${location.longitude}&zoom=13');
      final response = await http.get(url);
      final data = json.decode(response.body);
      return AddressModel.fromJson(data);
    } catch (error) {
      debugPrint(
          'SearchAddressRepository onLocationSearch Error: ${error.toString()}');
      return AddressModel(address: 'Server Error');
    }
  }
}