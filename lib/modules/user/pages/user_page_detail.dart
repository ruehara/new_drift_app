import 'package:flutter/material.dart';
import 'package:new_app_drift/app/library.dart';
import '../model/user_model.dart';

class UserDetail extends StatelessWidget {
  final UserModel object;
  const UserDetail({
    Key? key,
    required this.object,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: List.empty(),
        title: Text(context.l10n.detail_title),
      ),
      body: Column(
        children: [
          Center(
            child: Hero(
              tag: object.avatar,
              child: Image.network(
                object.avatar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}