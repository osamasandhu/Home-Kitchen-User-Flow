import 'package:flutter/material.dart';
import 'package:home_kitchen_user_app/src/base/assets.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/app_bar_widget.dart';
import 'package:home_kitchen_user_app/src/ui/widgets/kitchen_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      getAppBarWidget(title: 'Favorites'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (ctx, index) => const KitchenWidget(
            image: AppAssets.favoriteFood,
            title: 'Patty’s Home Delights',
          ),
          itemCount: 50,
        ),
      ),
    );
  }
}
