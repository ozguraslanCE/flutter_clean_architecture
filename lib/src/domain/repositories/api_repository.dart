import 'package:flutter_clean_architecture/src/domain/models/requests/breaking_news_request.dart';
import 'package:flutter_clean_architecture/src/domain/models/responses/breaking_news_response.dart';

import '../../utils/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  });
}
