
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/constant/my_color.dart';
import 'package:rickandmorty/feature/home/data/model/characters.dart';
import 'package:rickandmorty/feature/home/data/model/result.dart';
import 'package:rickandmorty/feature/home/ui/view/widget/character_item.dart';
import 'package:rickandmorty/feature/home/ui/view_model/cubit/character_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
     late CharactersModel allCharacters;
  List<Result> searchedForCharacters = [];
   bool _isSearching = false;
  final _searchTextController = TextEditingController();
 

    @override
  void initState() {
    super.initState();
context.read<CharacterCubit>().fetchCharacter();
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('assets/images/no_internet.png')
          ],
        ),
      ),
    );
  }



  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {

    setState(() {
searchedForCharacters = allCharacters.results
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    });

  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
   Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }
   Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: _isSearching
            ? BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body:  _buildBlocBuilder()
    
    );
  }

  BlocBuilder<CharacterCubit, CharacterState> _buildBlocBuilder() {
    return BlocBuilder<CharacterCubit, CharacterState>(
    builder: (context, state) {
      if (state is CharacterLoading) {
        return showLoadingIndicator();
      } else if (state is CharacterLoaded) {
        allCharacters = state.characters;
        return _buildGridView();
      } else  {
        return Text('data is null');
      } 
    }
   
  );
  }

  Widget _buildGridView() {
    return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),

    padding: EdgeInsets.zero,
    itemCount: _searchTextController.text.isEmpty
        ? allCharacters.results.length
        : searchedForCharacters.length,
    itemBuilder: (ctx, index) {
      return CharacterItem(
        character:  _searchTextController.text.isEmpty
            ? allCharacters.results[index]
            : searchedForCharacters[index],
      );
    }
        );
  }
  
  
}