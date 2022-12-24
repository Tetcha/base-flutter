import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) {
        final String error = value.errorDetails['errorMessage'] ?? '';
        return error != ''
            ? Align(
                alignment: Alignment.topLeft,
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
