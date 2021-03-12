import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../app/size_config.dart';
import '../../../models/company.dart';
import '../../../screens/listings/widgets/icon_column.dart';
import '../../../screens/listings/widgets/icon_row.dart';

class ListingCard extends StatelessWidget {
  final String positionTitle;
  final Company company;
  final bool isPaid;
  final bool isRemote;

  const ListingCard({
    Key key,
    @required this.positionTitle,
    @required this.company,
    @required this.isPaid,
    @required this.isRemote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
      color: Colors.white,
      elevation: 5,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 95,
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 60,
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              positionTitle,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 5,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: SizeConfig.blockSizeHorizontal * 20,
                                  padding: EdgeInsets.all(
                                      SizeConfig.blockSizeHorizontal * 3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey,
                                        width:
                                            SizeConfig.blockSizeHorizontal / 2),
                                  ),
                                  child: Image.network(
                                    company.logoUrl,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace stackTrace) {
                                      return Image.asset(
                                        'assets/images/default_company.png',
                                        width:
                                            SizeConfig.blockSizeHorizontal * 8,
                                        height:
                                            SizeConfig.blockSizeVertical * 5,
                                        fit: BoxFit.contain,
                                      );
                                    },
                                    width: SizeConfig.blockSizeHorizontal * 8,
                                    height: SizeConfig.blockSizeVertical * 5,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 3,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      company.name,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4.5),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical,
                                    ),
                                    IconRow(
                                      icon: LineIcons.mapMarker,
                                      label: company.location,
                                      color: Colors.black54,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 2),
                      width: SizeConfig.blockSizeHorizontal / 4,
                      height: 100,
                      color: Colors.grey,
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 20,
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            isPaid
                                ? IconColumn(
                                    color: Colors.green,
                                    label: 'Paid',
                                    icon: LineIcons.dollarSign,
                                  )
                                : IconColumn(
                                    color: Colors.blueGrey,
                                    label: 'Unpaid',
                                    icon: LineIcons.dollarSign,
                                  ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            isRemote
                                ? IconColumn(
                                    color: Colors.blue,
                                    label: 'Remote',
                                    icon: LineIcons.rss,
                                  )
                                : IconColumn(
                                    color: Colors.teal,
                                    label: 'In Office',
                                    icon: LineIcons.building,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
