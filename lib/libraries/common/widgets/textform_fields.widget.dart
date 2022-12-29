import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.controller,
      this.onChanged,
      this.onTap,
      this.text,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.initialValue});

  final String? text;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.015,
        horizontal: screenSize.width * 0.02,
      ),
      child: TextFormField(
        key: const Key('searchSummonerTextField'),
        initialValue: initialValue,
        controller: controller,
        cursorColor: TPColor.purple,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: TPColor.purple),
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: TPColor.purple),
          ),
          enabledBorder: OutlineInputBorder(
              gapPadding: 5,
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: TPColor.purple)),
          labelText: text,
          labelStyle: TPTexts.t5(
            color: TPColor.purple,
          ),
          prefixIcon: const Icon(Icons.search_rounded),
          prefixIconColor: TPColor.purple,
          filled: true,
          fillColor: TPColor.purple.withOpacity(0.1),
        ),
      ),
    );
  }
}
