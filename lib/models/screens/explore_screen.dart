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
          return Center(
            child: Container(
              child: const Text('Show TodayRecipeListView'),
            ),
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