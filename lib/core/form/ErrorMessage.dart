import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiController = Get.find();
    final String error = apiController.errorDetails['errorMessage'] ?? '';
    return error != ''
        ? Align(
            alignment: Alignment.topLeft,
            child: Text(
              error,
              style: const TextStyle(color: Colors.red),
            ),
          )
        : const SizedBox.shrink();
  }
}
