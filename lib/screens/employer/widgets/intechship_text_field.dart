import 'package:flutter/material.dart';
import '../../../app/size_config.dart';

class IntechshipTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String initialValue;
  final int maxlines;
  final Function(String) onSaved;
  final Function(String) validator;
  final IconData icon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  IntechshipTextField({
    @required this.label,
    this.maxlines = 1,
    this.onSaved,
    this.validator,
    this.initialValue,
    @required this.hint,
    @required this.icon,
    @required this.keyboardType,
    @required this.textInputAction,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeHorizontal * 3),
      child: TextFormField(
        initialValue: initialValue ?? '',
        onSaved: onSaved ?? (val) {},
        validator: validator ??
            (val) {
              return '';
            },
        maxLines: maxlines,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
          alignLabelWithHint: false,
          prefixIcon: Icon(icon),
        ),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
      ),
    );
  }
}
