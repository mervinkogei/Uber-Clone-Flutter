import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uberclone/Widgets/divider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();
    late GoogleMapController newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Stack(
        children: [
            GoogleMap(initialCameraPosition: _kGooglePlex, mapType: MapType.normal,
            myLocationButtonEnabled: true, onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController =controller;
              
            },
            ),
            Positioned(
              left: 0, right: 0, bottom: 0,
              child: Container(
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 16, spreadRadius: 0.5, offset: Offset(0.7,0.7))],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6,),
                      Text('Hi, there', style: TextStyle(fontSize: 12)),
                      Text('Where to?', style: TextStyle(fontSize: 20, fontFamily: 'Brand Bold'),),
                      SizedBox(height: 6,),
                      Container(
                        decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 6, spreadRadius: 0.5, offset: Offset(0.7,0.7))],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.blueAccent,),
                      SizedBox(width: 10),
                      Text('Search Drop Off Location')
                    ],
                  ),
                ),
                      ),
                      SizedBox(height: 24,),
                      Row(
                        children: [
                          Icon(Icons.home, color: Colors.grey,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Home"),
                              SizedBox(height: 4,),
                              Text("Your Living home address", style: TextStyle(color: Colors.black54, fontSize: 12),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      DividerWidget(),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Icon(Icons.work, color: Colors.grey,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Work"),
                              SizedBox(height: 4,),
                              Text("Your Office address", style: TextStyle(color: Colors.black54, fontSize: 12),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}