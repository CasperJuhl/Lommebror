import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'check_in.dart';

class LocationOverview extends StatefulWidget {
  @override
  LocationOverviewState createState() => LocationOverviewState();
}

class LocationOverviewState extends State<LocationOverview> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(), // Remove the back button
        middle: Text('Location Overview'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Google Maps Map (Top 50% of the page)
          Expanded(
            flex: 5, // Take up 50% of the available vertical space
            child: GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0), // Initial map center
                zoom: 10.0, // Initial zoom level
              ),
            ),
          ),
          // List of Strings with Icons (Middle 25% of the page)
          Expanded(
            flex: 3, // Take up 25% of the available vertical space
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildListItem(CupertinoIcons.smiley, 'Nick'),
                buildListItem(CupertinoIcons.smiley, 'Skov'),
                buildListItem(CupertinoIcons.smiley, 'Krølle'),
              ],
            ),
          ),
          // Button (Bottom 25% of the page)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to LocationOverview page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckIn()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF359756)), // Set background color to #359756
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Set rounded corners
                    ),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                child: Text(
                  'Check In',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.0), // Add some space below the button
        ],
      ),
    );
  }

  Widget buildListItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 2.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.grey),
            title: Text(
              text,
              style: TextStyle(fontSize: 14), // Smaller text size
            ),
          ),
        ),
      ),
    );
  }
}
