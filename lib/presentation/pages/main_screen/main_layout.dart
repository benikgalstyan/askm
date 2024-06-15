import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/generated/l10n.dart';
import 'package:askm/presentation/pages/main_screen/bloc/main_bloc.dart';
import 'package:askm/presentation/pages/second_screen/second_screen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    context.read<MainBloc>().add(LoadingFactsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Localization test
            Text(
              S.of(context).hello_world,
              style: const TextStyle(fontSize: Spacings.xxxL),
            ),
            Image.asset(
              Assets.images.test.keyName,
              color: Colors.green,
            ),
            const SizedBox(
              height: Spacings.xxxL,
            ),
            // Routing test
            ElevatedButton(
              onPressed: () =>
                  AutoRouter.of(context).pushNamed(SecondScreen.nameRoute),
              child: const Text('Button'),
            ),
            Column(
              children: [
                // Bloc test
                BlocBuilder<MainBloc, MainState>(
                  builder: (BuildContext _, MainState state) {
                    return switch (state) {
                      MainInitialState() =>
                        const Center(child: Text('Loading')),
                      MainLoadingState() =>
                        const Center(child: CircularProgressIndicator()),
                      MainLoadedState() => SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemBuilder: (_, index) =>
                                Center(child: Text(state.facts.facts)),
                            itemCount: 1,
                          ),
                        ),
                      MainErrorState() => const Text('Error'),
                    };
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
