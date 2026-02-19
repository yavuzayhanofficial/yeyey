import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../config/theme.dart';
import '../../models/user_model.dart';
import '../../models/category_model.dart';
import '../../services/mock_data.dart';
import '../../widgets/friend_card.dart';
import '../../widgets/category_chip.dart';

class HomeScreen extends StatefulWidget {
  final Function(UserModel) onFriendTap;

  const HomeScreen({super.key, required this.onFriendTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCategory;
  final _searchController = TextEditingController();

  List<UserModel> get _filteredFriends {
    var friends = MockData.friends;
    if (_selectedCategory != null) {
      friends = friends.where((f) => f.categories.contains(_selectedCategory)).toList();
    }
    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      friends = friends.where((f) =>
        f.name.toLowerCase().contains(query) ||
        f.city.toLowerCase().contains(query) ||
        f.categories.any((c) => c.toLowerCase().contains(query))
      ).toList();
    }
    return friends;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Merhaba! 👋',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Arkadaş Bul',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Profile Avatar
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary, width: 2),
                          ),
                          child: const CircleAvatar(
                            radius: 24,
                            backgroundColor: AppColors.background,
                            child: Icon(Icons.person, color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Search Bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: 'Arkadaş ara...',
                          prefixIcon: const Icon(Icons.search, color: AppColors.textLight),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.tune_rounded, color: AppColors.primary),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 44,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: CategoryModel.all.length,
                    itemBuilder: (context, index) {
                      final category = CategoryModel.all[index];
                      final isSelected = _selectedCategory == category.id;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CategoryChip(
                          category: category,
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              _selectedCategory = isSelected ? null : category.id;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Featured Friend
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '⭐ Öne Çıkanlar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Tümünü Gör'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: MockData.friends.where((f) => f.rating >= 4.8).length,
                        itemBuilder: (context, index) {
                          final friend = MockData.friends.where((f) => f.rating >= 4.8).toList()[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: _FeaturedCard(
                              friend: friend,
                              onTap: () => widget.onFriendTap(friend),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // All Friends Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Text(
                  _selectedCategory != null
                      ? '${CategoryModel.all.firstWhere((c) => c.id == _selectedCategory).emoji} ${CategoryModel.all.firstWhere((c) => c.id == _selectedCategory).name} Arkadaşları'
                      : '🏠 Tüm Arkadaşlar',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Friend List
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: _filteredFriends.isEmpty
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            const Text('😔', style: TextStyle(fontSize: 48)),
                            const SizedBox(height: 12),
                            Text(
                              'Bu kategoride arkadaş bulunamadı',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final friend = _filteredFriends[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: FriendCard(
                              friend: friend,
                              onTap: () => widget.onFriendTap(friend),
                            ),
                          );
                        },
                        childCount: _filteredFriends.length,
                      ),
                    ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final UserModel friend;
  final VoidCallback onTap;

  const _FeaturedCard({required this.friend, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: CachedNetworkImageProvider(friend.photoUrl ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.7),
              ],
            ),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (friend.isOnline)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Çevrimiçi',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ),
              const Spacer(),
              Text(
                friend.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.accent, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    '${friend.rating}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const Spacer(),
                  Text(
                    '₺${friend.hourlyRate.toInt()}/sa',
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
