import 'package:askm/core/logger/composite_logger.dart';
import 'package:flutter/material.dart';

class CompositeLoggerHolder extends InheritedWidget {
  const CompositeLoggerHolder({
    super.key,
    required super.child,
    required this.compositeLogger,
  });

  final CompositeLogger compositeLogger;

  static CompositeLogger of(BuildContext context) {
    final CompositeLoggerHolder? result =
        context.dependOnInheritedWidgetOfExactType<CompositeLoggerHolder>();
    assert(result != null, 'No CompositeLoggerHolder found in context');
    return result!.compositeLogger;
  }

  @override
  bool updateShouldNotify(CompositeLoggerHolder oldWidget) =>
      compositeLogger != oldWidget.compositeLogger;
}
