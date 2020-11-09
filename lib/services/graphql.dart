import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService {
  static final HttpLink httpLink = HttpLink(
      uri: "http://192.168.0.5:4000/",
      headers: <String, String>{"Authorization": "Bearer 123"});
  final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    ),
  );
}

final graphqlService = GraphqlService();

final String getUsers = """
query {
  users {
      id,
      username
  }
}
""";
