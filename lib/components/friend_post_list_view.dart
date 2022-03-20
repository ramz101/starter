import 'package:flutter/material.dart';

import 'components.dart';
import '/models/models.dart';

class FriendPostListView extends StatelessWidget {
  
  final List<Post> friendPost;

  const FriendPostListView({ 
    Key? key,
    required this.friendPost,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16,),
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPost.length,
            itemBuilder: (context, index){
              final post = friendPost[index];
              return FriendPostTile(post: post);
              
            },
            separatorBuilder: (context, index){
              return const SizedBox(height: 16,);
            },
          ),
          const SizedBox(height: 16,)
        ],
      ),
    );
  }
}


