import 'package:flutter/material.dart';
import 'package:to_do_app/common/widgets/add_to_do_dialog.dart';
import 'package:to_do_app/common/widgets/remove_to_do_dialog.dart';

mixin DialogBuilderMixin<T extends StatefulWidget> on State<T> {
  Future<bool> addToDoDialog() => _showDialog(const AddToDoDialog());

  Future<bool> removeToDoDialog() => _showDialog(const RemoveToDoDialog());

  Future<bool> _showDialog(Widget dialog) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => dialog,
    ).then((v) => v ?? false);
  }
}
