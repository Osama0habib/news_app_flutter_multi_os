import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mansour/layout/cubit/app_cubit.dart';
import 'package:news_app_mansour/layout/cubit/states.dart';
import 'package:news_app_mansour/modules/search_screen.dart';
import 'package:news_app_mansour/shared/components/components.dart';
import 'package:news_app_mansour/shared/network/remote/dio_helper.dart';

import 'cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
              actions: [
                IconButton(onPressed: () {
                  navigateTo(context, SearchScreen());
                }, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {
                  AppCubit.get(context).toggleDarkMode();
                }, icon: const Icon(Icons.brightness_4_outlined)),
              ],
            ),

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      );
  }
}
