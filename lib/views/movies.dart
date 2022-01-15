// import 'package:flixters/controllers/movies_controller.dart';
// import 'package:flixters/models/movie_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MoviesTiles extends StatelessWidget {
//   final String? url;
//   final String title;
//   final String? desc;

//   MoviesTiles({Key? key, this.url, required this.title, this.desc})
//       : super(key: key);

//   final String myurl =
//       "https://cdn.moviefone.com/admin-uploads/posters/dont-look-up-movie-poster_1637158732.jpg?d=360x540&q=50";

//   final String movieDesc = """
//   I was part of the movie, the first episode suck
//   as much, how ever to make 
//   """;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.network(
//           url,
//           height: 220,
//           width: 160,
//           fit: BoxFit.fitHeight,
//         ),
//         SizedBox(
//           width: 8.0,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               overflow: TextOverflow.ellipsis,
//               style:
//                   const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 18.0),
//               child: Container(
//                 width: 210,
//                 child: Text(
//                   movieDesc,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
