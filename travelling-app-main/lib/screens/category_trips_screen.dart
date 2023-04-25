// ignore_for_file: prefer_const_constructors, unused_import, missing_required_param, unused_element, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

// ignore: use_key_in_widget_constructors
class CategoryTripScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;
  CategoryTripScreen(this.availableTrips);
  
  @override
  State<CategoryTripScreen> createState() => _CategoryTripScreenState();
}

class _CategoryTripScreenState extends State<CategoryTripScreen> {
  String categoryTitle;
  List<Trip> displayTrips;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // ignore: unused_local_variable
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  //final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return TripItem(
              id: displayTrips[index].id,
              title: displayTrips[index].title,
              imageUrl: displayTrips[index].imageUrl,
              duration: displayTrips[index].duration,
              tripType: displayTrips[index].tripType,
              season: displayTrips[index].season,
              //removeItem: _removeTrip,
            );
          },
          itemCount: displayTrips.length,
        ),
        );
  }
}
