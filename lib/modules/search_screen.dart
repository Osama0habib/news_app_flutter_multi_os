import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mansour/layout/cubit/cubit.dart';
import 'package:news_app_mansour/layout/cubit/states.dart';
import 'package:news_app_mansour/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var searchlist = NewsCubit.get(context).search;
      return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: const InputDecoration(suffixIcon: Icon(Icons.search),label: Text('Search')),
                  controller: searchController,
                  onChanged: (val) => NewsCubit.get(context).getSearch(val),

                ),
              ),
              Expanded(child: articalBuilder(searchlist, context ,isSearch: true)),
            ],
          ),
        );
      },

    );
  }
}
