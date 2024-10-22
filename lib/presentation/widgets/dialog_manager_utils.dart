import 'package:askm/core/context_extensions.dart';
import 'package:askm/presentation/widgets/custom_dialog_widget.dart';
import 'package:flutter/material.dart';

class AlertManagerUtils {
  static Future<void> showSignOutWarning(
    BuildContext context, {
    required VoidCallback onCancel,
    required VoidCallback onSubmit,
  }) async {
    await showDialog(
      context: context,
      builder: (_) => CustomDialogWidget(
        onNo: onCancel,
        onYes: onSubmit,
        topTitle: context.s.logOut,
        title: context.s.areYouSureYouWantToLogOut,
      ),
    );
  }
}
