import 'package:flutter/material.dart';
import 'drawerEmp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaEmp extends StatelessWidget {
  final PageController controller;
  MapaEmp(this.controller);

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    Set<Marker> markers = new Set<Marker>();
    double lat = -22.9114042;
    double lang = -47.0663378;

    return Scaffold(
        drawer: CustomDrawerEmp(controller),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: TextField(
            style: TextStyle(fontSize: 25.0, color: Colors.white),
            onSubmitted: (valor) {
              // aqui em teoria se usa o geolocalizacao, mas vou deixar um comando pra voltar pra cps automaticamente
              lat = -22.8641431;
              lang = -47.051787;
              LatLng pos = LatLng(lat, lang);
              mapController.moveCamera(CameraUpdate.newLatLng(pos));

              /*final Marker marker = Marker(
                  markerId: new MarkerId(
                      "12345"), // esse Id tem que ser diferente se comecar a ter varios markers diferentes
                  position: pos,
                  infoWindow: InfoWindow(
                      title: "Cotuca - Colégio Técnico de Campinas",
                      snippet: "Campinas/SP")); */
            },
          ),
        ),
        body: Container(
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            onCameraMove: (data) {
              print(data);
            },
            onTap: (position) {
              print(position);
            },
            initialCameraPosition:
                CameraPosition(target: LatLng(lat, lang), zoom: 13.0),
            markers: markers,
          ),
        ));
  }
}
