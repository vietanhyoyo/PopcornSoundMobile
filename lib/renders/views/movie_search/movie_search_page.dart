import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/components/layouts/main_scaffold/main_scaffold.dart';
import 'package:popcorn_sound_mobile/constants/res_text_style.dart';
import 'package:popcorn_sound_mobile/renders/controllers/movie_search/movie_search_controller.dart';

class MovieSearchPage extends GetView<MovieSearchController> {
  const MovieSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        currentIndex: 1,
        body: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Search', style: ResText.titleLarge),
          ]),
        ));
  }
}
