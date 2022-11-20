import 'package:flutter/material.dart';

import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.text,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.initialValue,
  });

  final String? text;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: TextFormField(
        key: const Key('searchSummonerTextField'),
        initialValue: initialValue,
        controller: controller,
        cursorColor: TPColor.darkBlue,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: TPColor.darkBlue),
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: TPColor.darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: TPColor.darkBlue),
          ),
          focusColor: TPColor.darkBlue,
          focusedBorder: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: TPColor.darkBlue),
          ),
          labelText: text,
          labelStyle: TPTexts.t5(
            color: TPColor.darkBlue,
          ),
          prefixIcon: const Icon(Icons.search_rounded, color: TPColor.darkBlue),
          prefixIconColor: TPColor.darkBlue,
          filled: true,
          fillColor: TPColor.blue,
        ),
      ),
    );
  }
}
