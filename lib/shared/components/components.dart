import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news_app_mansour/modules/web_view/web_view_screen.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildArticalItem (article,ctx) => InkWell(
  onTap:()async{
    // navigateTo(ctx, WebViewScreen(url: article['url']));

      if (!await launch(article['url'])) throw 'Could not launch ${article['url']}';
    } ,
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image:
            DecorationImage(

              image:
              NetworkImage(article["urlToImage"] == null ? "https://newsapi.org/images/n-logo-border.png" :

                  '${article["urlToImage"]}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        const SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Expanded(

                  child: Text(

                    "${article["title"]}",

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,



                    style:

                    Theme.of(ctx).textTheme.bodyText1,

                  ),

                ),

                Text(

                  "${article["publishedAt"]}",

                  style: const TextStyle(color: Colors.grey),

                ),

              ],

            ),

          ),

        )

      ],

    ),

  ),
);

Widget articalBuilder(list,ctx,{isSearch =false}) => Conditional.single(
    conditionBuilder: (context) => list.isNotEmpty,
    widgetBuilder: (BuildContext context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          buildArticalItem(list[index],ctx),
      itemCount: list.length,
      separatorBuilder: (BuildContext context, int index) =>
      const Divider(),
    ),
    context: ctx,
    fallbackBuilder: (BuildContext context) => isSearch ? Container() :
     const Center(child: CircularProgressIndicator()));

void navigateTo(context,widget) => Navigator.push(context, MaterialPageRoute(builder: (ctx ) =>  widget));