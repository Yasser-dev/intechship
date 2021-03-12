import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/size_config.dart';
import '../../app/router.dart' as router;
import 'employer_viewmodel.dart';
import '../../screens/view.dart';
import '../../widgets/intechship_button.dart';
import '../../widgets/intechship_appbar.dart';

class EmployerScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => EmployerScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: intecshipAppbar(context),
      body: View<EmployerViewModel>(
        builder: (context, viewmodel, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Want to list your internship offer?',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: SizeConfig.blockSizeHorizontal),
              IntechshipButton(
                text: 'Start Here',
                onPressed: () async {
                  var navresult = await Navigator.pushNamed(
                      context, router.employerFormRoute);
                  if (navresult == null) {
                    return;
                  }
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Success',
                    headerAnimationLoop: false,
                    desc: 'Your listing has been added!',
                  )..show();
                },
              ),
              Divider(
                height: SizeConfig.blockSizeHorizontal * 10,
                color: Colors.grey,
                endIndent: SizeConfig.blockSizeHorizontal * 10,
                indent: SizeConfig.blockSizeHorizontal * 10,
              ),
              Text(
                'Want to Edit your listing?',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: SizeConfig.blockSizeHorizontal),
              TextButton(
                onPressed: () async {
                  try {
                    if (await canLaunch('https://forms.gle/jGfDp47TRJ9k2AUG6'))
                      await launch(
                        'https://forms.gle/jGfDp47TRJ9k2AUG6',
                      );
                  } catch (e) {
                    print(e);
                  }
                },
                style: ButtonStyle(),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: SizeConfig.blockSizeHorizontal * 5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
