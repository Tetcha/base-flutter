import 'package:flutter/cupertino.dart';

class PageNavigator {
  static Future<dynamic> instant(BuildContext ctx, dynamic page) async {
    return await Navigator.of(ctx)
        .push(PageRouteBuilder(pageBuilder: (c, a1, a2) => page));
  }

  static Future<dynamic> rightToLeft(BuildContext ctx, dynamic page) async {
    return await Navigator.of(ctx).push(PageRouteBuilder(
      pageBuilder: (c, a1, a2) => page,
      transitionsBuilder: (c, anim, a2, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(curve: const Interval(0, 1), parent: anim)),
          child: child),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionDuration: const Duration(milliseconds: 300),
    ));
  }

  static Future<dynamic> leftToRight(BuildContext ctx, dynamic page) async {
    return await Navigator.of(ctx).push(PageRouteBuilder(
      pageBuilder: (c, a1, a2) => page,
      transitionsBuilder: (c, anim, a2, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(curve: const Interval(0, 1), parent: anim)),
          child: child),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionDuration: const Duration(milliseconds: 300),
    ));
  }
}
