import 'package:flixters/controllers/movies_controller.dart';
import 'package:flixters/models/movie_model.dart';
import 'package:flixters/services/remote_services.dart';
import 'package:flixters/views/movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieList extends StatefulWidget {
  MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = RemoteServices.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        title: const Text(
          'Now playing',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Column(
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'search',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: FutureBuilder<List<Album>>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Album>? album = snapshot.data;
                      return ListView.builder(
                          itemCount: album!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Image.network(
                                  album[index].thumbnailUrl,
                                  height: 220,
                                  width: 160,
                                  fit: BoxFit.fitHeight,
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      album[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 18.0),
                                      child: Container(
                                        width: 210,
                                        child: Text(
                                          album[index].title,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ); //Text(album[index].title);
                          });
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
