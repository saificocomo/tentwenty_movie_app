import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ten_twenty_movie_app/controllers/movies_controller.dart';
import 'package:ten_twenty_movie_app/utlis/app_color.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({
    Key? key,
  }) : super(key: key);
  MoviesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MoviesController>(builder: (_) {
        return Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${controller.movieDetailsList[0].posterPath}"),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "Watch",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "In Theaters ${controller.movieDetailsList[0].releaseDate}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: MediaQuery.of(context).size.width * 0.60,
                            decoration: BoxDecoration(
                              color: AppColors.liteBlueColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Get Tickets",
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: MediaQuery.of(context).size.width * 0.60,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.liteBlueColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Watch Trailer",
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
