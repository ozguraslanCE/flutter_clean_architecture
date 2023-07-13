import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/domain/models/requests/breaking_news_request.dart';
import 'package:flutter_clean_architecture/src/presentation/cubits/base_cubits.dart';
import 'package:flutter_clean_architecture/src/utils/constants/nums.dart';
import 'package:flutter_clean_architecture/src/utils/resources/data_state.dart';

import '../../../domain/models/article.dart';
import '../../../domain/repositories/api_repository.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;
  RemoteArticlesCubit(this._apiRepository) : super(RemoteArticlesInitial(), []);
  int _page = 1;
  Future<void> getBreakingNewsArticles() async {
    if (isBusy) return;
    await run(() async {
      print("response");
      final response = await _apiRepository.getBreakingNewsArticles(
        request: BreakingNewsRequest(page: _page),
      );
      print(response);
      if (response is DataSuccess) {
        final articles = response.data!.articles;
        final noMoreData = articles!.length < defaultPageSize;

        data.addAll(articles);
        _page++;
        emit(RemoteArticlesSuccess(articles: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(RemoteArticlesFiled(exception: response.exception));
      }
    });
  }
}
