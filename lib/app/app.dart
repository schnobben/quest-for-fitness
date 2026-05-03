import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routing/app_router.dart';
import 'theme/app_theme.dart';

class QuestForFitnessApp extends StatefulWidget {
  const QuestForFitnessApp({super.key});

  @override
  State<QuestForFitnessApp> createState() => _QuestForFitnessAppState();
}

class _QuestForFitnessAppState extends State<QuestForFitnessApp> {
  late final GoRouter _router = createAppRouter();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quest for Fitness',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: _router,
    );
  }
}
