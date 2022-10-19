import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ten_twenty_movie_app/controllers/movies_controller.dart';
import 'package:ten_twenty_movie_app/movie_details/movie_details_screen.dart';
import 'package:ten_twenty_movie_app/utlis/app_color.dart';

import '../search_screen/search_bar.dart';

class WatchScreen extends StatelessWidget {
  WatchScreen({Key? key}) : super(key: key);
  MoviesController moviesController = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Watch",
          style: TextStyle(color: AppColors.navBarColor, fontSize: 20),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: SearchBar());
              },
              child: Icon(
                Icons.search,
                color: AppColors.navBarColor,
              )),
        ],
      ),
      body: Container(
        color: AppColors.liteWhiteColor,
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<MoviesController>(
          builder: ((controller) {
            return ListView.separated(
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  );
                }),
                itemCount: moviesController.upComingMoviesList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      // HttpService().getMovieDetails(
                      //     moviesController.upComingMoviesList[index].id);
                      Get.to(MovieDetails(
                          movieId:
                              moviesController.upComingMoviesList[index].id));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${moviesController.upComingMoviesList[index].posterPath}"),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Text(
                            moviesController.upComingMoviesList[index].title
                                .toString(),
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  );
                }));
          }),
        ),
      ),
    );
  }
}
