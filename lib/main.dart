import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_example/data/di/di_container.dart';
import 'package:retrofit_example/screens/home_screen/home_screen.dart';
import 'package:retrofit_example/utils/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ..._router.blocs(),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Get Products',
        home:  HomeScreen(),
      ),
    );
  }
}
