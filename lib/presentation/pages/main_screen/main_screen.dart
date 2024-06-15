import 'package:askm/service_locator.dart';
import 'package:askm/data/repository/repository.dart';
import 'package:askm/presentation/pages/main_screen/bloc/main_bloc.dart';
import 'package:askm/presentation/pages/main_screen/main_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const nameRoute = '/MainScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(getIt<Repository>()),
      child: const MainLayout(),
    );
  }
}
