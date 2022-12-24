import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';

class TextFieldC extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool isPassword;
  final String error;
  final String name;
  final dynamic defaultValue;
  final String hintText;
  final TextInputType keyBoardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final dynamic context;
  const TextFieldC({
    super.key,
    required this.controller,
    this.error = '',
    this.label = '',
    this.name = '',
    this.defaultValue = '',
    this.hintText = '',
    this.isPassword = false,
    this.keyBoardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.context,
  });

  void _presentDatePicker() {
    if (context != null) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }

        controller.text = DateFormat.yMd().format(pickedDate);
      });
    } else {
      // ignore: avoid_print
      print('context is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) {
        final String error = value.errorDetails[name] ?? '';
        return Column(
          children: [
            TextField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: keyBoardType,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: label,
                hintText: hintText,
                prefixIcon: suffixIcon,
                suffixIcon: keyBoardType == TextInputType.datetime
                    ? GestureDetector(
                        onTap: _presentDatePicker,
                        child: prefixIcon ??
                            const Icon(Icons.calendar_today_rounded),
                      )
                    : prefixIcon,
              ),
            ),
            error != '' ? const SizedBox(height: 10) : const SizedBox.shrink(),
            error != ''
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }
}
