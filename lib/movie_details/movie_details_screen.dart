import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ten_twenty_movie_app/controllers/movies_controller.dart';
import 'package:ten_twenty_movie_app/ticket_screens/select_seat_screen.dart';
import 'package:ten_twenty_movie_app/utlis/app_color.dart';

import '../reusable_widgets/custom_button.dart';

class MovieDetails extends StatelessWidget {
  int movieId;
  MovieDetails({Key? key, required this.movieId}) : super(key: key);
  MoviesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MoviesController>(builder: (_) {
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.58,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${controller.movieDetailsList[0].posterPath}"),
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.whiteColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Watch",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                  ),
                  SizedBox(
                    height: 180,
                    // height: MediaQuery.of(context).size.height * 0.010,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "In Theaters ${controller.movieDetailsList[0].releaseDate}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const SelectSeatScreen());
                          },
                          child: CustomButton(
                              buttonText: "Get Tickets", buttonWidth: 0.60),
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
                                style: TextStyle(
                                    color: AppColors.whiteColor, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Genres",
                      style:
                          TextStyle(color: AppColors.navBarColor, fontSize: 16),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          genresContainer(
                              context, "Action", AppColors.greenColor),
                          genresContainer(
                              context, "Thriller", AppColors.pinkColor),
                          genresContainer(
                              context, "Science", AppColors.indigoColor),
                          genresContainer(
                              context, "Fiction", AppColors.yellowColor),
                        ],
                      ),
                    ),
                    Text(
                      "Overview",
                      style:
                          TextStyle(color: AppColors.navBarColor, fontSize: 16),
                    ),
                    Expanded(
                      child: Text(
                        controller.movieDetailsList[0].overview,
                        style: TextStyle(
                            color: AppColors.liteGreyColor, fontSize: 12),
                      ),
                    ),
                  ]),
            )
          ],
        );
      }),
    );
  }

  Container genresContainer(BuildContext context, String text, Color color) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.030,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(text,
            style: TextStyle(color: AppColors.whiteColor, fontSize: 12)),
      ),
    );
  }
}
