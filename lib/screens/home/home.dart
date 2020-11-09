import 'package:cucumber_market_app/services/graphql.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: Query(
            options: QueryOptions(documentNode: gql(getUsers)),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.loading) {
                return Text("loading");
              } else {
                List users = result.data['users'];
                if (users == null) {
                  return Text("user is null");
                } else {
                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Text(user['username']);
                      });
                }
              }
            }));
  }
}
