import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    late Position currentPosition;
    var geolocator = Geolocator();
    double bottomPaddingMap =0;

    void locatePosition() async {     
      
       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
       currentPosition = position;

       LatLng latlongPosition =LatLng(position.latitude, position.longitude);

       CameraPosition cameraPosition = CameraPosition(target: latlongPosition, zoom: 14);
       newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: Drawer(
          child: ListView(
            //Add drawer list
            children: [
              Container(
                height: 165,
                child: DrawerHeader(
                  decoration:const BoxDecoration(
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Image.asset("images/user_icon.png", height: 65,width: 65,),
                      const SizedBox(width: 16,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Profile Name', style: TextStyle(fontFamily: 'Brand-Bold', fontSize: 16)),
                          SizedBox(height: 6,),
                          Text('Visit Profile')
                        ],
                      )
                    ],
                  )),
              ),
              const DividerWidget(),
              const SizedBox(height: 12),
              //Draver Border
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History', style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Visit Profile', style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About', style: TextStyle(fontSize: 15),),
              ),
              
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
            GoogleMap(
              padding: EdgeInsets.only(bottom: bottomPaddingMap),
            initialCameraPosition: _kGooglePlex, mapType: MapType.normal,
            myLocationEnabled: true, zoomGesturesEnabled: true, zoomControlsEnabled: true,
            myLocationButtonEnabled: true, onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController =controller;

              setState(() {
                bottomPaddingMap = 300;
              });

              locatePosition();
            },
            ),

            //HamburgerButton for drawer
            Positioned(
              top: 45, left: 22,
              child: GestureDetector(
                onTap: (){scaffoldKey.currentState!.openDrawer();},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22,),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6, spreadRadius: 0.5, offset: Offset(0.7, 0.7))],
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.menu, color: Colors.black,),),
                ),
              ),
            ),

            Positioned(
              left: 0, right: 0, bottom: 0,
              child: Container(
                height: 300,
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
                      const SizedBox(height: 6,),
                      const Text('Hi, there', style: TextStyle(fontSize: 12)),
                      const Text('Where to?', style: TextStyle(fontSize: 20, fontFamily: 'Brand Bold'),),
                      const SizedBox(height: 6,),
                      Container(
                        decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 6, spreadRadius: 0.5, offset: Offset(0.7,0.7))],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.blueAccent,),
                      SizedBox(width: 10),
                      Text('Search Drop Off Location')
                    ],
                  ),
                ),
                      ),
                      const SizedBox(height: 24,),
                      Row(
                        children: [
                          const Icon(Icons.home, color: Colors.grey,),
                          const SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                              Text("Add Home"),
                              SizedBox(height: 4,),
                              Text("Your Living home address", style: TextStyle(color: Colors.black54, fontSize: 12),),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const DividerWidget(),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          const Icon(Icons.work, color: Colors.grey,),
                          const SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
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