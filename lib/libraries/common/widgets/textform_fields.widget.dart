import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.controller,
      required this.autofocus,
      this.onChanged,
      this.onTap});

  final bool autofocus;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.015,
        horizontal: screenSize.width * 0.02,
      ),
      child: TextFormField(
        autofocus: false,
        controller: controller,
        cursorColor: TPColor.purple,
        onChanged: onChanged,
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
          labelText: 'Pesquise um campeão',
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
