import 'package:casino_test/presentation/bloc/character/character_bloc.dart';
import 'package:casino_test/presentation/observer/app_bloc_observer.dart';
import 'package:casino_test/presentation/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injections.dart';

void main() async {
  await init();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CharacterBloc>()..add(CharactersOnGet()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoute.routes,
      ),
    );
  }
}
