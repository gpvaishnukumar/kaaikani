import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql/client.dart';

class ApiService {
  late GraphQLClient _client;

  ApiService() {
    final HttpLink httpLink = HttpLink(dotenv.env['VENDURE_API_URL']!);
    _client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  Future<QueryResult> query(String query, {Map<String, dynamic>? variables}) {
    return _client.query(QueryOptions(document: gql(query), variables: variables ?? {}));
  }
}
