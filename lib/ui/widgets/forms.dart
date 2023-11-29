import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obsecuretext;
  final TextEditingController? controller;
  final bool showtitle;
  final TextInputType? keyboardtype;
  const CustomFormField({
    key,
    required this.title,
    this.obsecuretext = false,
    this.controller,
    this.showtitle = true,
    this.keyboardtype,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showtitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: obsecuretext,
          controller: controller,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
            hintText: !showtitle ? title : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
