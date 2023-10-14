import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luminar_sample_project/State management using provider/Helper Provider/movie_provider.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<MovieProvider>().movieWishList;
    return Scaffold(
      appBar: AppBar(title: Text("My Wishlist ${wishmovies.length}")),
      body: ListView.builder(
          itemCount: wishmovies.length,
          itemBuilder: (context, index) {
            final wishMovie = wishmovies[index];
            return Card(
              child: ListTile(
                title: Text(wishMovie.title),
                subtitle: Text(wishMovie.time),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<MovieProvider>().removefromWishList(wishMovie);
                  },
                ),
              ),
            );
          }),
    );
  }
}
