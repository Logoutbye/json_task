
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_task/user.dart';

class UserApi{
  static Future<List<User>> getUserLocally(BuildContext context) async{
    final assestsBundle =  DefaultAssetBundle.of(context);
    final data =await assestsBundle.loadString('assests/file.json');
    final body = json.decode(data);

    return body.map<User>(User.fromJson).toList();

  }

}