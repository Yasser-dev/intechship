import 'package:flutter/widgets.dart';

import '../../app/dependencies.dart';
import '../../constants/regex.dart';
import '../../models/listing.dart';
import '../../screens/listings/listings_viewmodel.dart';
import '../../services/listings/listings_service.dart';

import '../../models/company.dart';
import '../../screens/viewmodel.dart';

class EmployerViewModel extends Viewmodel {
  ListingsService get dataService => dependency();
  ListingsViewModel get listingsViewModel => dependency();
  int formPage = 1;
  GlobalKey<FormState> form1key = GlobalKey<FormState>();
  GlobalKey<FormState> form2key = GlobalKey<FormState>();
  bool locationValid = false;
  bool checkBoxUnchecked = false;
  Company company = Company();
  Listing listing = Listing(
    isPaid: false,
    isRemote: false,
  );
  int remoteSelected = 0;
  int paidSelected = 0;
  bool remote = false;
  void changeFormPage(int pageNumber) {
    turnBusy();
    if (formPage == pageNumber) return;
    formPage = pageNumber;
    turnIdle();
  }

  String nameValidator(String name) {
    if (name.length < 3)
      return "Name can\'t be less than three characters";
    else if (name.length > 28)
      return "Name is too long, please use a different name";
    else
      return null;
  }

  void onNameSaved(String name) {
    turnBusy();
    company.name = name;
    turnIdle();
  }

  String emailValidator(String email) {
    if (email.isEmpty)
      return "Email can\'t be empty";
    else if (!IntechshipRegExp.email.hasMatch(email))
      return "Invalid Email!";
    else
      return null;
  }

  void onEmailSaved(String email) {
    turnBusy();
    company.email = email;
    turnIdle();
  }

  void locationValidator(String location) {
    turnBusy();
    if (location != null) {
      locationValid = true;
      company.location = location;
    }
    turnIdle();
  }

  String logoUrlValidator(String logoUrl) {
    if (logoUrl.isEmpty)
      return "Logo URL can\'t be empty";
    else if (!IntechshipRegExp.url.hasMatch(logoUrl))
      return "Invalid Logo URL!";
    else
      return null;
  }

  void onLogoUrlSaved(String logoUrl) {
    turnBusy();
    company.logoUrl = logoUrl;
    turnIdle();
  }

  String websiteValidator(String website) {
    if (website.isEmpty)
      return "Website URL can\'t be empty";
    else if (!IntechshipRegExp.url.hasMatch(website))
      return "Invalid Website URL! Must start with http or https";
    else
      return null;
  }

  void onWebsiteSaved(String website) {
    turnBusy();
    company.websiteUrl = website;
    turnIdle();
  }

  void onForm1Saved() {
    turnBusy();
    listing.company = company;
    formPage = 2;
    turnIdle();
  }

  String titleValidator(String title) {
    if (title.isEmpty)
      return "Position title can\'t be empty";
    else if (title.length < 5)
      return "Position title is too short";
    else if (title.length > 28)
      return "Position title is too long";
    else
      return null;
  }

  void onTitleSaved(String title) {
    turnBusy();
    listing.positionTitle = title;
    turnIdle();
  }

  String descriptionValidator(String description) {
    if (description.isEmpty)
      return "Role description can\'t be empty";
    else if (description.length < 15)
      return "Role description is too short";
    else
      return null;
  }

  void onDescriptionSaved(String description) {
    turnBusy();
    listing.roleDescription = description;
    turnIdle();
  }

  String dateValidator(String date) {
    if (date.isEmpty)
      return "Starting Date can\'t be empty";
    else if (!IntechshipRegExp.date.hasMatch(date))
      return "Invalid Date, Please make sure your input is a valid date and follows the format DD/MM/YYYY (including the '/') ";
    else
      return null;
  }

  void onDateSaved(String date) {
    turnBusy();
    listing.startingDate = date;
    turnIdle();
  }

  String emptyValidator(String value) {
    if (value.isEmpty)
      return "You must enter a value!";
    else if (int.parse(value) == 0)
      return "Value can't be 0";
    else
      return null;
  }

  void onDurationSaved(String duration) {
    turnBusy();
    listing.duration = int.parse(duration);
    turnIdle();
  }

  void onOpeningsSaved(String openings) {
    turnBusy();
    listing.numberOfOpenings = int.parse(openings);
    turnIdle();
  }

  void onRemoteToggle(int value) {
    turnBusy();
    remoteSelected = value;
    listing.isRemote = value == 0 ? false : true;
    turnIdle();
  }

  void onPaidToggle(int value) {
    turnBusy();
    paidSelected = value;
    if (value == 1) {
      listing.isPaid = true;
      listing.salary = null;
    } else {
      listing.isPaid = false;
      listing.salary = 0;
    }
    turnIdle();
    // print('value is $value');
  }

  void onSalarySaved(String salary) {
    turnBusy();
    listing.salary = int.parse(salary);
    turnIdle();
  }

  void onForm2Saved() {
    turnBusy();

    formPage = 3;
    turnIdle();
  }

  void resetForm() {
    turnBusy();
    this.company = Company();
    this.listing = Listing(
      isPaid: false,
      isRemote: false,
    );
    checkBoxUnchecked = false;
    this.formPage = 1;
    remoteSelected = 0;
    paidSelected = 0;
    remote = false;
    locationValid = false;
    turnIdle();
  }

  Future<void> addNewListing() async {
    turnBusy();
    final newListing = await dataService.createListing(listing);
    listing.id = newListing;
    Listing addedlisting = listing;
    listingsViewModel.listings.add(addedlisting);
    turnIdle();
  }

  void toggleCheckbox(bool value) {
    turnBusy();
    checkBoxUnchecked = value;
    turnIdle();
  }
}
