import 'package:flutter/material.dart';

import '/components/components.dart';
import '/models/models.dart';
import '/api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot){
        // TODO: Add Nested List Views
        if(snapshot.connectionState == ConnectionState.done){
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes?? []),
              const SizedBox(height: 16,),
              FriendPostListView(friendPost: snapshot.data?.friendPosts ?? []),
              Container(
                height: 400,
                color: Colors.green,
              )
            ],
          );
        } else {
          return const Center(
            child:CircularProgressIndicator() ,
            );
        }
      },
    );
  }
}