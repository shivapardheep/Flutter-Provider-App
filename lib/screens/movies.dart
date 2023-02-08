import 'package:flutter/material.dart';
import 'package:flutter_testapp/classes/movies_object_class.dart';
import 'package:flutter_testapp/providers/movies_providers.dart';
import 'package:flutter_testapp/screens/movie_card_screen.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    List<MoviesObject> moviesList =
        context.watch<MoviesProvider>().getMoviesList;
    List<MoviesObject> myCardList =
        context.watch<MoviesProvider>().getMyCardList;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MovieCardScreen()));
                  },
                  icon: const Icon(Icons.favorite_border),
                  label: Text("Go to My list (${myCardList.length})"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: moviesList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                        tileColor: Colors.blue,
                        title: Text(moviesList[i].title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(moviesList[i].time,
                            style: const TextStyle(color: Colors.white)),
                        trailing: InkWell(
                          onTap: () {
                            if (!moviesList[i].isfav) {
                              context
                                  .read<MoviesProvider>()
                                  .addToFav(moviesList[i]);
                            } else {
                              context
                                  .read<MoviesProvider>()
                                  .removeMyCard(moviesList[i]);
                            }
                          },
                          child: Icon(
                            Icons.favorite,
                            color:
                                moviesList[i].isfav ? Colors.red : Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
