import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends SearchDelegate<String> {
  // final NoteController controller = Get.find();
// t final text = AppFunction.localizeText("search");
  SearchBar({
    String hintText = "",
  }) : super(
          searchFieldDecorationTheme: const InputDecorationTheme(
            isDense: true,
            isCollapsed: true,
            // fillColor: AppColors.seconderyBgColor
          ),
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )

      // child: Image.asset(AppImages.backButtonRightFaced)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final suggestionList = query.isEmpty
    //     ? controller.notes
    //     : controller.notes.where(
    //         (p) {
    //           return p.title!.toLowerCase().contains(query.toLowerCase()) ||
    //               p.content!.toLowerCase().contains(query.toLowerCase());
    //         },
    //       ).toList();
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
      ),
      // child: GridView.builder(
      //   gridDelegate: SliverWovenGridDelegate.count(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 2,
      //     crossAxisSpacing: 2,
      //     pattern: [
      //       const WovenGridTile(1),
      //       const WovenGridTile(
      //         5 / 7,
      //         crossAxisRatio: 0.9,
      //         alignment: AlignmentDirectional.center,
      //       ),
      //     ],
      //   ),
      //   childrenDelegate: SliverChildBuilderDelegate(
      //     childCount: suggestionList.length,
      //     (context, index) => GestureDetector(
      //       onTap: () {
      //         Get.to(NoteScreen(), arguments: index);
      //       },
      //       child: NoteWidget(
      //         flagType: suggestionList[index].flag == "No Flag" ||
      //                 suggestionList[index].flag == ""
      //             ? const SizedBox()
      //             : Row(
      //                 children: [

      //                   SizedBox(
      //                     width: MediaQuery.of(context).size.width * 0.01,
      //                   ),
      //                   Text(
      //                     suggestionList[index].flag ?? "",
      //                     style: TextStyle(
      //                         color: AppColors.liteBlackFontColor,
      //                         fontFamily: AppConstants.mediumFont,
      //                         fontSize: 10.0),
      //                   ),
      //                 ],
      //               ),
      //         timeCreated: suggestionList[index].dateTimeCreated ?? "",
      //         noteTitle: suggestionList[index].title ?? "",
      //         noteBody: suggestionList[index].content ?? "",

      //         dueDate: suggestionList[index].dueDate == null ||
      //                 suggestionList[index].dueDate == ""
      //             ? const SizedBox()
      //             : Row(
      //                 children: [

      //                   SizedBox(
      //                     width: MediaQuery.of(context).size.width * 0.01,
      //                   ),
      //                   Text(
      //                     suggestionList[index].dueDate ?? "",
      //                     style: TextStyle(

      //                         fontSize: 10.0),
      //                   ),
      //                 ],
      //               ),
      //         noteFolder: suggestionList[index].folderName == null ||
      //                 suggestionList[index].folderName == ""
      //             ? const SizedBox()
      //             : Row(
      //                 children: [

      //                   SizedBox(
      //                     width: MediaQuery.of(context).size.width * 0.01,
      //                   ),
      //                   Text(
      //                     suggestionList[index].folderName,
      //                     style: TextStyle(

      //                         fontSize: 10.0),
      //                   ),
      //                 ],
      //               ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
