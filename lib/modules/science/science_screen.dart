import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news_app_mansour/layout/cubit/cubit.dart';
import 'package:news_app_mansour/layout/cubit/states.dart';
import 'package:news_app_mansour/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var scienceNews  = NewsCubit.get(context).science;
          return articalBuilder(scienceNews, context);
        });
  }
}
