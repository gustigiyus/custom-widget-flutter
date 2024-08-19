import 'package:flutter/material.dart';

import '../assets/assets.dart';
import '../components/components.dart';
import '../constants/colors.dart';

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;
}

extension AlertDialogExt on BuildContext {
  void showDialogSuccess(String title, String subtitle) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.alert.success.svg(
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                const SpaceHeight(32.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SpaceHeight(16.0),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.gray3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showDialogError(String title, String subtitle) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.alert.error.image(
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                const SpaceHeight(32.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SpaceHeight(16.0),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.gray3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

extension NavigatorExt on BuildContext {
  void pop<T extends Object>([T? result]) {
    Navigator.pop(this, result);
  }

  void popToRoot<T extends Object>() {
    Navigator.popUntil(this, (route) => route.isFirst);
  }

  Future<T?> push<T extends Object>(Widget widget, [String? name]) async {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: name),
      ),
    );
  }

  Future<T?> pushReplacement<T extends Object, TO extends Object>(
      Widget widget) async {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(
      Widget widget, bool Function(Route<dynamic> route) predicate) async {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute(builder: (context) => widget),
      predicate,
    );
  }
}
