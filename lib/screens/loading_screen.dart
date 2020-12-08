import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geolocation();
  }

  void geolocation() async {
    print('1');
    Location location = Location();
    await location.getGeoLocation();
    print('2');
    Network network = Network(location.latitude, location.longitude);
    print('3');
    var data = await network.getData();
    print('4');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(data);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
