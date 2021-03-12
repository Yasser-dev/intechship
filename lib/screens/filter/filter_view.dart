import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'filter_viewmodel.dart';
import 'widgets/filter_row.dart';
import '../view.dart';
import '../../app/size_config.dart';
import '../../constants/app_font_family.dart';
import 'widgets/locations_filter_chips.dart';

class FilterScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => FilterScreen());
  @override
  Widget build(BuildContext context) {
    return View<FilterViewModel>(
      builder: (context, viewmodel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(LineIcons.angleLeft),
            onPressed: () {
              var locations = Map.from(viewmodel.locationFilters)
                ..removeWhere((key, value) => value == false);
              List locationsList = [];
              locations.forEach((key, value) {
                locationsList.add(key);
              });
              Navigator.pop(context, {
                'onlyPaid': viewmodel.onlyPaid,
                'onlyRemote': viewmodel.onlyRemote,
                'locations': locationsList
              });
            },
          ),
          title: Text(
            'Filters',
            style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5,
                fontFamily: AppFontFamily.goodTimes),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FilterRow(
                label: 'Only Paid',
                switchValue: viewmodel.onlyPaid,
                switchFunction: viewmodel.toggleOnlyPaid,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              FilterRow(
                label: 'Only Remote',
                switchValue: viewmodel.onlyRemote,
                switchFunction: viewmodel.toggleOnlyRemote,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Text(
                'Only show listings in: ',
                style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 6),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              LocationsFilterChips(
                data: viewmodel.locationFilters,
                function: viewmodel.toggleLocation,
              )
            ],
          ),
        ),
      ),
    );
  }
}
