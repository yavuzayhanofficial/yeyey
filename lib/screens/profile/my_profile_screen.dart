import 'package:flutter/material.dart';
import '../../config/theme.dart';

class MyProfileScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const MyProfileScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Profile Photo
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 3),
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.background,
                      child: Icon(Icons.person, size: 50, color: AppColors.primary),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Yavuz Ayhan Önder',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'İstanbul, Türkiye',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              // Stats
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatColumn(value: '0', label: 'Buluşma'),
                    _StatColumn(value: '0', label: 'Yorum'),
                    _StatColumn(value: '0.0', label: 'Puan'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Menu Items
              _MenuItem(
                icon: Icons.person_outline,
                title: 'Profili Düzenle',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.notifications_outlined,
                title: 'Bildirimler',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.payment_outlined,
                title: 'Ödeme Yöntemleri',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.handshake_outlined,
                title: 'Arkadaş Ol',
                subtitle: 'Kiralık arkadaş olarak para kazan',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.security_outlined,
                title: 'Güvenlik',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.help_outline,
                title: 'Yardım & Destek',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.info_outline,
                title: 'Hakkında',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _MenuItem(
                icon: Icons.logout_rounded,
                title: 'Çıkış Yap',
                iconColor: AppColors.error,
                titleColor: AppColors.error,
                onTap: onLogout,
              ),
              const SizedBox(height: 40),
              Text(
                'YeYeY v1.0.0',
                style: TextStyle(color: AppColors.textLight, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.iconColor,
    this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: (iconColor ?? AppColors.primary).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor ?? AppColors.primary, size: 22),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: titleColor ?? AppColors.textPrimary,
          ),
        ),
        subtitle: subtitle != null
            ? Text(subtitle!, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary))
            : null,
        trailing: Icon(Icons.chevron_right, color: AppColors.textLight),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
