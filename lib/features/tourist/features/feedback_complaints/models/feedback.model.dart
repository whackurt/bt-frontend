class FeedbackModel {
  final int? id;
  final int? touristId;
  final int? rating;
  final String? commentSuggestion;

  FeedbackModel({
    this.id,
    required this.touristId,
    required this.rating,
    required this.commentSuggestion,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      touristId: json['tourist_id'],
      rating: json['rating'],
      commentSuggestion: json['comment_suggestion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tourist_id': touristId.toString(),
      'rating': rating.toString(),
      'comment_suggestion': commentSuggestion ?? '',
    };
  }
}
