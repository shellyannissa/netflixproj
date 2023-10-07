import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:netflixproj/cubits/cubits.dart';
import 'package:netflixproj/data/data.dart';
import 'package:netflixproj/widgets/conten_header.dart';
import 'package:netflixproj/widgets/conten_list.dart';
import 'package:netflixproj/widgets/custom_app_bar.dart';
import 'package:netflixproj/widgets/previews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey,
            child: const Icon(Icons.cast),
            onPressed: () => print(sintelContent)),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: BlocBuilder<AppBarCubit, double>(
            builder: (context, scrollOffset) {
              return CustomAppBar(scrollOffset: scrollOffset);
            },
          ),
        ),
        body: CustomScrollView(controller: _scrollController, slivers: [
          SliverToBoxAdapter(
              child: ContentHeader(featuredContent: sintelContent)),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
                child: Previews(
              title: 'Previews',
              contentList: previews,
            )),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Netflix Originals',
              contentList: myList,
              isOriginals: true,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Trending',
              contentList: myList,
            ),
          ),
        ]));
  }
}
