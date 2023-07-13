part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article> articles;
  final bool noMoreData;
  final DioException? exception;
  const RemoteArticlesState(
      {this.articles = const [], this.noMoreData = true, this.exception});
  @override
  List<Object?> get props => [articles, noMoreData, exception];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesSuccess extends RemoteArticlesState {
  const RemoteArticlesSuccess({super.articles, super.noMoreData});
}

class RemoteArticlesFiled extends RemoteArticlesState {
  const RemoteArticlesFiled({super.exception});
}

class RemoteArticlesInitial extends RemoteArticlesState {
  @override
  List<Object?> get props => [articles, noMoreData, exception];
}
