class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final String emoji;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.emoji,
  });

  static List<CategoryModel> get all => const [
    CategoryModel(id: 'spor', name: 'Spor', icon: 'sports', emoji: '⚽'),
    CategoryModel(id: 'seyahat', name: 'Seyahat', icon: 'travel', emoji: '✈️'),
    CategoryModel(id: 'yemek', name: 'Yemek', icon: 'food', emoji: '🍕'),
    CategoryModel(id: 'sinema', name: 'Sinema', icon: 'movie', emoji: '🎬'),
    CategoryModel(id: 'oyun', name: 'Oyun', icon: 'game', emoji: '🎮'),
    CategoryModel(id: 'sohbet', name: 'Sohbet', icon: 'chat', emoji: '💬'),
    CategoryModel(id: 'alisveris', name: 'Alışveriş', icon: 'shopping', emoji: '🛍️'),
    CategoryModel(id: 'muzik', name: 'Müzik', icon: 'music', emoji: '🎵'),
    CategoryModel(id: 'egzersiz', name: 'Egzersiz', icon: 'fitness', emoji: '💪'),
    CategoryModel(id: 'dogayuruyusu', name: 'Doğa Yürüyüşü', icon: 'hiking', emoji: '🏔️'),
    CategoryModel(id: 'kahve', name: 'Kahve', icon: 'coffee', emoji: '☕'),
    CategoryModel(id: 'diger', name: 'Diğer', icon: 'other', emoji: '🌟'),
  ];
}
