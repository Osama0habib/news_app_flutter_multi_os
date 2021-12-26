abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorsState extends NewsStates{
   final String  error;

  NewsGetBusinessErrorsState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorsState extends NewsStates{
  final String  error;

  NewsGetSportsErrorsState(this.error);
}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorsState extends NewsStates{
  final String  error;

  NewsGetScienceErrorsState(this.error);
}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorsState extends NewsStates{
  final String  error;

  NewsGetSearchErrorsState(this.error);
}
class NewsLoadingState extends NewsStates{}

