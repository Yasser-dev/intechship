import 'package:flutter/material.dart';
import '../screens/employer/employer_form_view.dart';
import '../screens/listing_detail/listing_detail_view.dart';
import '../screens/filter/filter_view.dart';
import '../screens/home/home_view.dart';
import '../screens/employer/employer_view.dart';
import '../screens/listings/listings_view.dart';

const String homeRoute = '/';
const String listingsRoute = '/listings';
const String listingDetailRoute = '/listing-detail';
const String filterRoute = '/filter';
const String employerRoute = '/employer';
const String employerFormRoute = '/employer-form';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
      return HomeScreen.route();
    case listingsRoute:
      return ListingsScreen.route();
    case listingDetailRoute:
      return MaterialPageRoute(
          builder: (_) => ListingDetailScreen(
                listing: settings.arguments,
              ));
    case filterRoute:
      return FilterScreen.route();
    case employerRoute:
      return EmployerScreen.route();
    case employerFormRoute:
      return EmployerFormScreen.route();
  }
  return null;
}
