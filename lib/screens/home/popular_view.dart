import 'package:flutter/material.dart';
import 'package:movie_api/model/response_movie.dart';
import 'package:movie_api/resource/api_service/base_url.dart';
import 'package:movie_api/resource/api_service/response_api.dart';
import 'package:movie_api/resource/utils/utils.dart';
import 'package:movie_api/screens/details/details_screens.dart';

class PopularView extends StatefulWidget {
  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: ResponseApi().getListPopularMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.62,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 30),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _itemPopular(snapshot.data[index]);
                },
              );
            } else {
              return Center(
                child: Text("Không có dữ liệu"),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _itemPopular(Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsScreen(
                      movie: movie,
                    )));
      },
      child: Column(
        children: [
          //Image
          Expanded(
              flex: 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                BaseUrl().baseUrlPhoto500 + movie.posterPath))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                            stops: [0.5, 1])),
                  ),
                  Positioned(
                      bottom: 12,
                      right: 16,
                      child: Text(
                        Utils().dateFormat(movie.releaseDate),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )),

          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
