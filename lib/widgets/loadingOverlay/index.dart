// loading_overlay.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app_fe/core/providers/ui.provider.dart';

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static _LoadingOverlayState of(BuildContext context) {
    return context.findAncestorStateOfType<_LoadingOverlayState>()!;
  }

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    final UIProvider uiController = Get.find();
    return Stack(
      children: [
        widget.child,
        if (uiController.isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (uiController.isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
