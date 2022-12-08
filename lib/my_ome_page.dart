

import 'package:flutter/material.dart';
import 'package:json_task/api/local_api.dart';
import 'package:json_task/user.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: FutureBuilder<List<User>>(
        future: UserApi.getUserLocally(context),
      builder: (context,snapshot){
          final users = snapshot.data;
          return Center(
            child: buildusers(users),
          );
      },

    ),
  );
}

 Widget buildusers(List<User>? users) =>
  ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: users?.length,
      itemBuilder: (context, index){
      final user = users![index];
      return ListTile(
        leading:CircleAvatar(
          backgroundImage: NetworkImage(user.urlAvatar),
        ),
        title:Text(user.username) ,
        subtitle: Text(user.email),
      );
      },

   );
