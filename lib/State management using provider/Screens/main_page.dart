import 'package:flutter/material.dart';
import 'package:luminar_sample_project/State management using provider/Helper Provider/movie_provider.dart';
import 'package:luminar_sample_project/State%20management%20using%20provider/Screens/wishlist_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
      create: (BuildContext context) => MovieProvider(),
      child: const MaterialApp(
        home: HomePage(),
      )));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<MovieProvider>().movieWishList;
    var movies = context.watch<MovieProvider>().movies;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Movie Home Page"),
        ),
        body: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WishListScreen()));
                },
                icon: Icon(Icons.favorite),
                label: Text("Go to Wish List ${wishmovies.length}")),
            Expanded(
                child: ListView.builder(
                    itemCount: movieList.length,
                    itemBuilder: (context, index) {
                      //movies are list<map> here current movie is now a map
                      final currentMovie = movies[index];
                      return Card(
                        child: ListTile(
                          title: Text(currentMovie.title),
                          subtitle: Text(currentMovie.time),
                          trailing: IconButton(
                              onPressed: () {
                                if (!wishmovies.contains(currentMovie)) {
                                  context
                                      .read<MovieProvider>()
                                      .addtoWishList(currentMovie);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .removefromWishList(currentMovie);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: wishmovies.contains(currentMovie)
                                    ? Colors.red
                                    : Colors.grey,
                              )),
                        ),
                      );
                    }))
          ],
        ));
  }
}
