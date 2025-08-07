import 'package:flutter/material.dart';
import 'package:oversize/features/favourite/presentation/widgets/favourite_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist")),
      body: FavouriteBody(),
    );
  }
}
