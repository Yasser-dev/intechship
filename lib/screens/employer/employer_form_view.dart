import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

import '../../app/size_config.dart';
import '../../constants/app_font_family.dart';
import 'employer_viewmodel.dart';
import '../listings/widgets/listing_card.dart';
import '../../widgets/intechship_button.dart';
import '../view.dart';
import 'widgets/intechship_drowdown_field.dart';
import 'widgets/intechship_text_field.dart';
import 'widgets/intechship_toggle.dart';

class EmployerFormScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => EmployerFormScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(LineIcons.angleLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add Listing',
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 5,
              fontFamily: AppFontFamily.goodTimes),
        ),
      ),
      body: View<EmployerViewModel>(
        builder: (context, viewmodel, child) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
            child: Column(
              children: [
                if (viewmodel.formPage == 1)
                  Form(
                    key: viewmodel.form1key,
                    child: Column(
                      children: [
                        Text(
                          'Company Details',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                        ),
                        IntechshipTextField(
                          label: 'Name',
                          hint: 'Company\'s Name',
                          initialValue: viewmodel.company.name,
                          validator: viewmodel.nameValidator,
                          onSaved: viewmodel.onNameSaved,
                          icon: LineIcons.fileSignature,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                        IntechshipTextField(
                          label: 'E-Mail',
                          initialValue: viewmodel.company.email,
                          validator: viewmodel.emailValidator,
                          onSaved: viewmodel.onEmailSaved,
                          hint: 'Hiring Manager\'s Email',
                          icon: LineIcons.at,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                        ),
                        IntechshipDropdownField(
                          initialValue: viewmodel.company.location,
                          onChanged: viewmodel.locationValidator,
                        ),
                        if (!viewmodel.locationValid)
                          Text(
                            'Select Location',
                            style: TextStyle(
                              color: Colors.red.shade600,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.3,
                            ),
                          ),
                        IntechshipTextField(
                          label: 'Logo URL',
                          hint: 'URL to Company\'s logo',
                          initialValue: viewmodel.company.logoUrl,
                          validator: viewmodel.logoUrlValidator,
                          onSaved: viewmodel.onLogoUrlSaved,
                          icon: LineIcons.image,
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.done,
                        ),
                        IntechshipTextField(
                          label: 'Website URL',
                          hint: 'URL to Company\'s Website',
                          initialValue: viewmodel.company.websiteUrl,
                          validator: viewmodel.websiteValidator,
                          onSaved: viewmodel.onWebsiteSaved,
                          icon: LineIcons.globe,
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                if (viewmodel.formPage == 2)
                  Form(
                    key: viewmodel.form2key,
                    child: Column(
                      children: [
                        Text(
                          'Internship Details',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                        ),
                        IntechshipTextField(
                          label: 'Position Title',
                          hint: 'Eg. Software Developer Intern',
                          icon: LineIcons.quoteLeft,
                          initialValue: viewmodel.listing.positionTitle,
                          validator: viewmodel.titleValidator,
                          onSaved: viewmodel.onTitleSaved,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                        IntechshipTextField(
                          label: 'Role Description',
                          maxlines: 3,
                          hint: 'Details, Requirements, Qualifications, etc..',
                          initialValue: viewmodel.listing.roleDescription,
                          validator: viewmodel.descriptionValidator,
                          onSaved: viewmodel.onDescriptionSaved,
                          icon: LineIcons.alignCenter,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                        ),
                        IntechshipTextField(
                          label: 'Earliest Starting Date',
                          hint: 'DD/MM/YYYY',
                          initialValue: viewmodel.listing.startingDate,
                          validator: viewmodel.dateValidator,
                          onSaved: viewmodel.onDateSaved,
                          icon: LineIcons.calendarWithDayFocus,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                        IntechshipTextField(
                          label: 'Duration',
                          hint: 'duration in months',
                          initialValue: viewmodel.listing.duration?.toString(),
                          validator: viewmodel.emptyValidator,
                          onSaved: viewmodel.onDurationSaved,
                          icon: LineIcons.clock,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),
                        IntechshipTextField(
                          label: 'Openings',
                          hint: 'Number of openings',
                          icon: LineIcons.listOl,
                          initialValue:
                              viewmodel.listing.numberOfOpenings?.toString(),
                          validator: viewmodel.emptyValidator,
                          onSaved: viewmodel.onOpeningsSaved,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        IntechshipToggle(
                          selected: viewmodel.remoteSelected,
                          text: 'Is the internship remote?',
                          icons: [LineIcons.times, LineIcons.check],
                          toggleLabels: ['NO', 'YES'],
                          onToggle: viewmodel.onRemoteToggle,
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        IntechshipToggle(
                          selected: viewmodel.paidSelected,
                          text: 'Is the internship paid?',
                          icons: [LineIcons.times, LineIcons.check],
                          toggleLabels: ['NO', 'YES'],
                          onToggle: viewmodel.onPaidToggle,
                        ),
                        if (viewmodel.listing.isPaid)
                          IntechshipTextField(
                            label: 'Salary',
                            hint: 'RM per Month',
                            initialValue: viewmodel.listing.salary?.toString(),
                            validator: viewmodel.emptyValidator,
                            onSaved: viewmodel.onSalarySaved,
                            icon: LineIcons.dollarSign,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                          ),
                      ],
                    ),
                  ),
                if (viewmodel.formPage == 3)
                  Column(
                    children: [
                      Text('Your Listing Card will look like this:',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 5)),
                      ListingCard(
                          positionTitle: viewmodel.listing.positionTitle,
                          company: viewmodel.listing.company,
                          isPaid: viewmodel.listing.isPaid,
                          isRemote: viewmodel.listing.isRemote),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            visualDensity: VisualDensity.compact,
                            value: viewmodel.checkBoxUnchecked,
                            onChanged: viewmodel.toggleCheckbox,
                          ),
                          Expanded(
                            child: Text(
                              'I confirm that I want to submit this data!',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 3,
                ),
                DotsIndicator(
                  dotsCount: 3,
                  position: (viewmodel.formPage - 1).toDouble(),
                  decorator: DotsDecorator(
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                if (viewmodel.formPage == 1)
                  IntechshipButton(
                    onPressed: () {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      if (!viewmodel.form1key.currentState.validate() ||
                          !viewmodel.locationValid) {
                        return;
                      }
                      viewmodel.form1key.currentState.save();
                      viewmodel.onForm1Saved();
                    },
                    text: 'Next',
                  ),
                if (viewmodel.formPage == 2)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IntechshipButton(
                        onPressed: () => viewmodel.changeFormPage(1),
                        text: 'Back',
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 5,
                      ),
                      IntechshipButton(
                        onPressed: () {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          if (!viewmodel.form2key.currentState.validate()) {
                            return;
                          }
                          viewmodel.form2key.currentState.save();
                          viewmodel.onForm2Saved();
                        },
                        text: 'Next',
                      ),
                    ],
                  ),
                if (viewmodel.formPage == 3)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IntechshipButton(
                        onPressed: () => viewmodel.changeFormPage(2),
                        text: 'Back',
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 5,
                      ),
                      IntechshipButton(
                        isDisabled: !viewmodel.checkBoxUnchecked,
                        onPressed: () async {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                          await viewmodel.addNewListing();
                          viewmodel.resetForm();
                          Navigator.pop(context, 'success');
                        },
                        text: 'Submit',
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
