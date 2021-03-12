import '../../app/dependencies.dart';
import '../../models/listing.dart';
import '../../services/listings/listings_service.dart';

import '../viewmodel.dart';

class ListingsViewModel extends Viewmodel {
  List<Listing> listings = [];
  List<Listing> fetchedListings = [];

  ListingsViewModel();
  ListingsService get dataService => dependency();
  Map filters = {'onlyPaid': false, 'onlyRemote': false, "locations": []};

  void getListings() async {
    turnBusy();
    fetchedListings = await dataService.getListingsList();
    if (filters['onlyPaid'] == false &&
        filters['onlyRemote'] == false &&
        filters['locations'].length == 0) {
      listings = fetchedListings.reversed.toList();
    } else {
      if (filters['onlyPaid'] == true) {
        listings = fetchedListings.reversed
            .toList()
            .where((element) => element.isPaid == true)
            .toList();
      } else {
        listings = fetchedListings.reversed.toList();
      }
      if (filters['onlyRemote'] == true) {
        listings =
            listings.where((element) => element.isRemote == true).toList();
      }
      if (filters['locations'].length == 0 ||
          filters['locations'].length == 16) {
        turnIdle();
        return;
      } else {
        listings = listings
            .where((element) =>
                filters['locations'].contains(element.company.location))
            .toList();
      }
    }
    turnIdle();
  }

  void displayFilteredData() {
    turnBusy();

    if (filters['onlyPaid'] == false &&
        filters['onlyRemote'] == false &&
        filters['locations'].length == 0) {
      listings = fetchedListings.reversed.toList();
    } else {
      if (filters['onlyPaid'] == true) {
        listings = fetchedListings.reversed
            .toList()
            .where((element) => element.isPaid == true)
            .toList();
      } else {
        listings = fetchedListings.reversed.toList();
      }
      if (filters['onlyRemote'] == true) {
        listings =
            listings.where((element) => element.isRemote == true).toList();
      }
      if (filters['locations'].length == 0 ||
          filters['locations'].length == 16) {
        turnIdle();
        return;
      } else {
        listings = listings
            .where((element) =>
                filters['locations'].contains(element.company.location))
            .toList();
      }
    }
    turnIdle();
  }

  void setFilters(Map newfilters) {
    turnBusy();
    filters = newfilters;
    turnIdle();
  }
}
