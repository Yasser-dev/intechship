import '../../models/listing.dart';

abstract class ListingsService {
  Future<List<Listing>> getListingsList();
  Future<String> createListing(Listing listing);
//   Future<Listing> updateListingStatus({String id, Listing newListing});
//   Future deleteListing({String id});
}
