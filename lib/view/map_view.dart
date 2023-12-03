

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:machine_test/controller/user_controller.dart';

import 'package:provider/provider.dart';

class MapView extends StatelessWidget {



  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<UserController>(
          builder:(context, userController, child) {
            return Stack(
      children: [
            GoogleMap(onMapCreated:(controller) {
             userController.mapController!;
            },
              initialCameraPosition: userController.cameraPosition,

              markers: {
              userController.marker
              },
            )
      ],
    );
          }
        ));
  }
}

