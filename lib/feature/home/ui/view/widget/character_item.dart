import 'package:flutter/material.dart';
import 'package:rickandmorty/core/constant/my_color.dart';
import 'package:rickandmorty/core/router/app_routes.dart';
import 'package:rickandmorty/core/router/route.dart';
import 'package:rickandmorty/feature/home/data/model/result.dart';

class CharacterItem extends StatelessWidget {
  final Result character;

  const CharacterItem({super.key, required this.character, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.charactersDetailsRoute , arguments: character);
        },
        child: GridTile(
          child: Hero(
            tag: 1,//character.id,
            child: Container(
              color: MyColors.myGrey,
              child:   character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,// character.name,
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}