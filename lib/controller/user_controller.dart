import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../model/model_class.dart';

class UserController extends ChangeNotifier {
  List<UserModel> _users = [];
  GoogleMapController? _mapController;
  TextEditingController? _searchController;
  CameraPosition _cameraPosition=const CameraPosition(target: (LatLng(0.0, 0.0)));
  Marker _marker=const Marker(markerId: MarkerId('0')) ;
  List<UserModel> get users => _users;
  TextEditingController? get searchController => _searchController;
  GoogleMapController? get mapController => _mapController;
  CameraPosition get cameraPosition => _cameraPosition;
  Marker get marker=>_marker;


  Future<List> fetchUsers(String url) async {
    final response =
        await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _users = data.map((userData) => UserModel.fromJson(userData)).toList();
      return data;
    } else {
      throw Exception('Failed to load users');
    }
  }

  void searchUsers(String query) {
    List<UserModel> filteredUsers = _users
        .where((user) =>
            user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.name.toUpperCase().contains(query.toUpperCase()) ||
            user.email.toUpperCase().contains(query.toUpperCase()) ||
            user.email.toLowerCase().contains(query.toLowerCase()))
        .toList();
    _users = filteredUsers;
    notifyListeners();
  }

 locationPosition(UserModel user) {
    _cameraPosition = CameraPosition(
        target: LatLng(double.parse(user.address.geo.lat),
            double.parse(user.address.geo.lng)),zoom:14.0
    );
    _marker=Marker(markerId: MarkerId(user.name), icon:BitmapDescriptor.defaultMarker,
        position: LatLng(double.parse(user.address.geo.lat),
            double.parse(user.address.geo.lng)),
        infoWindow: InfoWindow(title: user.address.suite,snippet: user.address.street));
  }

  set mapController(GoogleMapController? controller) {
    _mapController = controller;
    notifyListeners();
  }

  website(String url) {
    launchUrl(Uri.parse(url));
    notifyListeners();
  }
}
