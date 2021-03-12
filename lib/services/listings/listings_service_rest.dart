import 'listings_service.dart';

import '../rest_service.dart';
import '../../app/dependencies.dart';
import '../../models/listing.dart';

class ListingsServiceRest extends ListingsService {
  final rest = dependency<RestService>();

  @override
  Future<String> createListing(Listing listing) async {
    final json = await rest.post('listings.json', data: listing.toMap());
    return json['name'];
  }

  @override
  Future<List<Listing>> getListingsList() async {
    List<Listing> listings = [];
    final json = await rest.get('listings.json');
    Listing temp = Listing();
    // print('json: $json');
    // print('map json: ${Map<String, dynamic>.from(json).keys}');
    if (json != null) {
      Map<String, dynamic>.from(json).forEach((key, value) {
        temp = Listing.fromMap(value);
        temp.id = key;
        listings.add(temp);
      });
    }

    return listings;
  }
}
