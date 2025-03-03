import 'package:flutter/material.dart';
import 'package:rickandmorty/core/router/route.dart';
import 'package:rickandmorty/feature/home/ui/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MaterialApp(
      
debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      title: 'Rick and Morty',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    
    );
  }
}
