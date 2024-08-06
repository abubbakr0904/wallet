import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/bloc/auth_bloc/auth_bloc.dart';
import 'package:wallet/bloc/category_bloc/category_bloc.dart';
import 'package:wallet/bloc/register_bloc/register_bloc.dart';
import 'package:wallet/data/repositories/auth_repository.dart';
import 'package:wallet/data/repositories/category_repository.dart';
import 'package:wallet/screens/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LoginRepository()),
        RepositoryProvider(create: (context) => CategoryRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<LoginRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(
              context.read<LoginRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(categoryRepository: context.read<CategoryRepository>())..add(GetCategoryEvent())
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
