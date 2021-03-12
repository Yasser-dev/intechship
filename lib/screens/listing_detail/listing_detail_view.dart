import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/text_row.dart';
import '../listings/widgets/icon_column.dart';
import '../../widgets/intechship_button.dart';
import '../../app/size_config.dart';
import '../../constants/app_font_family.dart';
import '../../models/listing.dart';
import '../listings/widgets/icon_row.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;
  const ListingDetailScreen({
    @required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(LineIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: FittedBox(
          child: RichText(
            text: TextSpan(
              text: 'ID:  ',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: SizeConfig.blockSizeHorizontal * 5,
                  fontFamily: AppFontFamily.goodTimes,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: listing.id.toString(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                    fontFamily: AppFontFamily.raleway,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  '${listing.positionTitle} @',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 7,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
                      child: Image.network(
                        listing.company.logoUrl,
                        width: SizeConfig.blockSizeHorizontal * 25,
                        height: SizeConfig.blockSizeVertical * 10,
                        fit: BoxFit.contain,
                        errorBuilder: (BuildContext context, Object exception,
                                StackTrace stackTrace) =>
                            Container(
                          width: SizeConfig.blockSizeHorizontal * 30,
                          height: SizeConfig.blockSizeVertical * 10,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.asset(
                                  'assets/images/default_company.png')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 5,
                  ),
                  FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listing.company.name,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 6),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        IconRow(
                          color: Colors.black54,
                          label: listing.company.location,
                          icon: LineIcons.mapMarked,
                          iconSize: SizeConfig.blockSizeHorizontal * 7,
                          labelSize: SizeConfig.blockSizeHorizontal * 5,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              ListTile(
                leading: Icon(LineIcons.link),
                title: Text(listing.company.websiteUrl),
                onTap: () async {
                  try {
                    if (await canLaunch(listing.company.websiteUrl))
                      await launch(
                        listing.company.websiteUrl,
                      );
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              ExpandablePanel(
                // ignore: deprecated_member_use
                tapHeaderToExpand: true,
                // ignore: deprecated_member_use
                tapBodyToCollapse: true,
                header: Text(
                  'Role Description',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                  ),
                ),
                collapsed: Text(
                  listing.roleDescription,
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                  ),
                ),
                expanded: Text(
                  listing.roleDescription,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                  ),
                ),
              ),
              Divider(
                indent: SizeConfig.blockSizeHorizontal,
                endIndent: SizeConfig.blockSizeHorizontal,
                color: Colors.grey,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              ListTile(
                leading: Icon(LineIcons.calendar),
                title: TextRow(
                    titleText: 'Starting Date: ',
                    valueText: listing.startingDate),
              ),
              ListTile(
                leading: Icon(LineIcons.listOl),
                title: TextRow(
                    titleText: 'Number of Openings: ',
                    valueText: listing.numberOfOpenings.toString()),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  listing.isPaid
                      ? IconColumn(
                          color: Colors.green,
                          label: 'RM ${listing.salary}',
                          icon: LineIcons.dollarSign,
                          labelSize: SizeConfig.blockSizeHorizontal * 5,
                          iconSize: SizeConfig.blockSizeHorizontal * 7,
                        )
                      : IconColumn(
                          color: Colors.blueGrey,
                          label: 'Unpaid',
                          icon: LineIcons.dollarSign,
                          labelSize: SizeConfig.blockSizeHorizontal * 5,
                          iconSize: SizeConfig.blockSizeHorizontal * 7,
                        ),
                  listing.isRemote
                      ? IconColumn(
                          color: Colors.blue,
                          label: 'Remote',
                          icon: LineIcons.rss,
                          labelSize: SizeConfig.blockSizeHorizontal * 5,
                          iconSize: SizeConfig.blockSizeHorizontal * 7,
                        )
                      : IconColumn(
                          color: Colors.teal,
                          label: 'In Office',
                          icon: LineIcons.building,
                          labelSize: SizeConfig.blockSizeHorizontal * 5,
                          iconSize: SizeConfig.blockSizeHorizontal * 7,
                        ),
                  IconColumn(
                    color: Colors.deepPurple,
                    label: '${listing.duration} Weeks',
                    icon: LineIcons.clockAlt,
                    labelSize: SizeConfig.blockSizeHorizontal * 5,
                    iconSize: SizeConfig.blockSizeHorizontal * 7,
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
              IntechshipButton(
                  text: 'Email Hiring Manager',
                  onPressed: () async =>
                      launch('mailto:${listing.company.email}'))
            ],
          ),
        ),
      ),
    );
  }
}
