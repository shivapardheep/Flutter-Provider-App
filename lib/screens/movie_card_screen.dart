import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/movies_object_class.dart';
import '../providers/movies_providers.dart';

class MovieCardScreen extends StatefulWidget {
  const MovieCardScreen({Key? key}) : super(key: key);

  @override
  State<MovieCardScreen> createState() => _MovieCardScreenState();
}

class _MovieCardScreenState extends State<MovieCardScreen> {
  @override
  Widget build(BuildContext context) {
    List<MoviesObject> myCardList =
        context.watch<MoviesProvider>().getMyCardList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Card List"),
      ),
      body: ListView.builder(
          itemCount: myCardList.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: ListTile(
                title: Text(myCardList[i].title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(myCardList[i].time),
                trailing: TextButton(
                    onPressed: () {
                      context
                          .read<MoviesProvider>()
                          .removeMyCard(myCardList[i]);
                    },
                    child: const Text(
                      "remove",
                      style: TextStyle(color: Colors.red),
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
          }),
    );
  }
}
