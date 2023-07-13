import 'package:equatable/equatable.dart';

import '../article.dart';

class BreakingNewsResponse extends Equatable {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

//<editor-fold desc="Data Methods">
  const BreakingNewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  @override
  String toString() {
    return 'BreakingNewsResponse{ status: $status, totalResults: $totalResults, articles: $articles,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }

  factory BreakingNewsResponse.fromMap(Map<String, dynamic> map) {
    return BreakingNewsResponse(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: map['articles'] as List<Article>,
    );
  }

//</editor-fold>

  @override
  List<Object?> get props => [status, totalResults, articles];
}
