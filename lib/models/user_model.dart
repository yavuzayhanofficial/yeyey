class UserModel {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String? bio;
  final String city;
  final int age;
  final String gender;
  final bool isFriendForRent;
  final double hourlyRate;
  final double rating;
  final int totalReviews;
  final int totalBookings;
  final List<String> categories;
  final List<String> interests;
  final List<String> languages;
  final List<String> photos;
  final bool isVerified;
  final bool isOnline;
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    this.bio,
    required this.city,
    required this.age,
    required this.gender,
    this.isFriendForRent = false,
    this.hourlyRate = 0,
    this.rating = 0,
    this.totalReviews = 0,
    this.totalBookings = 0,
    this.categories = const [],
    this.interests = const [],
    this.languages = const ['Türkçe'],
    this.photos = const [],
    this.isVerified = false,
    this.isOnline = false,
    required this.createdAt,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    String? bio,
    String? city,
    int? age,
    String? gender,
    bool? isFriendForRent,
    double? hourlyRate,
    double? rating,
    int? totalReviews,
    int? totalBookings,
    List<String>? categories,
    List<String>? interests,
    List<String>? languages,
    List<String>? photos,
    bool? isVerified,
    bool? isOnline,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      city: city ?? this.city,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      isFriendForRent: isFriendForRent ?? this.isFriendForRent,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      rating: rating ?? this.rating,
      totalReviews: totalReviews ?? this.totalReviews,
      totalBookings: totalBookings ?? this.totalBookings,
      categories: categories ?? this.categories,
      interests: interests ?? this.interests,
      languages: languages ?? this.languages,
      photos: photos ?? this.photos,
      isVerified: isVerified ?? this.isVerified,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
