class ReviewModel {
  final String id;
  final String bookingId;
  final String reviewerId;
  final String reviewerName;
  final String reviewerPhoto;
  final String friendId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  const ReviewModel({
    required this.id,
    required this.bookingId,
    required this.reviewerId,
    required this.reviewerName,
    required this.reviewerPhoto,
    required this.friendId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}
