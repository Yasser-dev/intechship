import '../../app/dependencies.dart';
import '../listings/listings_viewmodel.dart';
import '../viewmodel.dart';

class FilterViewModel extends Viewmodel {
  bool onlyPaid = false;
  bool onlyRemote = false;
  ListingsViewModel get listingsViewModel => dependency();
  Map<String, bool> locationFilters = {
    'Johor': false,
    'Kedah': false,
    'Kelantan': false,
    'Malacca': false,
    'Negeri Sembilan': false,
    'Pahang': false,
    'Penang': false,
    'Perak': false,
    'Perlis': false,
    'Sabah': false,
    'Sarawak': false,
    'Selangor': false,
    'Terengganu': false,
    'Putrajaya': false,
    'Labuan': false,
    'Kuala Lumpur': false
  };
  void toggleOnlyPaid(bool newValue) {
    turnBusy();
    onlyPaid = newValue;
    turnIdle();
  }

  void toggleOnlyRemote(bool newValue) {
    turnBusy();
    onlyRemote = newValue;
    turnIdle();
  }

  toggleLocation(String key, bool newValue) {
    turnBusy();
    locationFilters[key] = newValue;
    turnIdle();
  }
}
