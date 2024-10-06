import 'package:flutter/material.dart';
import 'package:shared_shopping_list/api/api_service.dart';
import 'package:shared_shopping_list/api/models.dart';
import 'package:shared_shopping_list/widgets/household_card.dart';

class MainPage extends StatefulWidget {
  final String username;

  const MainPage(this.username, {super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Home> _homes = List.empty();
  Map<Home, int> _homesMembersCounter = {};
  Map<Home, int> _homesShoppingListCounter = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Récupération des foyers...'),
          duration: Duration(days: 1),
        ),
      );
    });
    fetchHomes();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void fetchHomes() async {
    var fetchedHomes =
        (await ApiService().getUserHouseholds(widget.username)).homes;
    Map<Home, int> homesUsersCount = {};
    Map<Home, int> homesShoppingListItemCount = {};

    for (var home in fetchedHomes) {
      var users = (await ApiService().getHouseholdUsers(home.name)).users;
      var shoppingList = (await ApiService().getShoppingList(home.name)).shoppingList;
      homesUsersCount[home] = users.length;
      homesShoppingListItemCount[home] = shoppingList.length;
    }

    setState(() {
      _homes = fetchedHomes;
      _homesMembersCounter = homesUsersCount;
      _homesShoppingListCounter = homesShoppingListItemCount;

      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Foyers récupérés'),
          duration: Duration(milliseconds: 750),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          for (var home in _homes)
            HouseholdCard(home, _homesMembersCounter[home] ?? 0,
                _homesShoppingListCounter[home] ?? 0)
        ],
      ),
    );
  }
}
