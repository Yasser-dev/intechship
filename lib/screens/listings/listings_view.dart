import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../models/listing.dart';
import '../../app/router.dart' as router;
import '../../widgets/intechship_appbar.dart';
import '../view.dart';
import 'listings_viewmodel.dart';
import 'widgets/listing_card.dart';

class ListingsScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => ListingsScreen());

  @override
  Widget build(BuildContext context) {
    return View<ListingsViewModel>(
        initViewmodel: (viewmodel) async => viewmodel.getListings(),
        builder: (context, viewmodel, child) => Scaffold(
              appBar: intecshipAppbar(
                context,
                [
                  IconButton(
                    icon: Icon(
                      LineIcons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate:
                              ListingsSearch(listings: viewmodel.listings));
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      LineIcons.filter,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      var filterResults = await Navigator.pushNamed(
                          context, router.filterRoute);
                      // print(filterResults);
                      viewmodel.setFilters(filterResults);
                      viewmodel.displayFilteredData();
                    },
                  ),
                ],
              ),
              body: viewmodel.listings.length == 0
                  ? Center(
                      child: Image.asset('assets/images/no_listings.png'),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, router.listingDetailRoute,
                            arguments: viewmodel.listings[index]),
                        child: ListingCard(
                          positionTitle:
                              viewmodel.listings[index].positionTitle,
                          company: viewmodel.listings[index].company,
                          isPaid: viewmodel.listings[index].isPaid,
                          isRemote: viewmodel.listings[index].isRemote,
                          key: Key(viewmodel.listings[index].id),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: viewmodel.listings.length,
                    ),
            ));
  }
}

class ListingsSearch extends SearchDelegate<String> {
  List<Listing> listings;
  ListingsSearch({
    @required this.listings,
  });
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions of the appbar
    return [
      IconButton(
          icon: Icon(
            LineIcons.search,
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () => Navigator.pop(context))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon in the appbar
    return IconButton(
      icon: Icon(LineIcons.angleLeft),
      color: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show buildResults
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listings
        : listings
            .where((listing) =>
                listing.positionTitle
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                listing.company.name
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
    // show buildSuggestions
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, router.listingDetailRoute,
            arguments: suggestionList[index]),
        child: ListingCard(
          positionTitle: suggestionList[index].positionTitle,
          company: suggestionList[index].company,
          isPaid: suggestionList[index].isPaid,
          isRemote: suggestionList[index].isRemote,
          key: Key(suggestionList[index].id),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: suggestionList.length,
    );
  }
}
