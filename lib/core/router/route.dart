import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/api_services.dart';
import 'package:rickandmorty/core/router/app_routes.dart';
import 'package:rickandmorty/feature/home/data/model/result.dart';
import 'package:rickandmorty/feature/home/data/repo/repo.dart';
import 'package:rickandmorty/feature/home/ui/view/characters_details_screen.dart';
import 'package:rickandmorty/feature/home/ui/view/home_screen.dart';
import 'package:rickandmorty/feature/home/ui/view_model/cubit/character_cubit.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(ApiServices(Dio()));
    charactersCubit = CharacterCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => CharacterCubit(charactersRepository),
            child: HomeScreen(),
          ),
        );

      case AppRoutes.charactersDetailsRoute:
         final character = settings.arguments as Result ;
        
         return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(
              character: character,
            ),
          
        );
        default:
        return null;
    }
  }
}