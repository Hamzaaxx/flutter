import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated mascot area
                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Decorative rings
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.15),
                              width: 2,
                            ),
                          ),
                        ),
                        // Heart pulse icon as mascot placeholder
                        Icon(
                          Icons.monitor_heart_rounded,
                          size: 80,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ],
                    ),
                  )
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .scale(
                        begin: const Offset(1.0, 1.0),
                        end: const Offset(1.05, 1.05),
                        duration: 2000.ms,
                        curve: Curves.easeInOut,
                      ),
                  const SizedBox(height: 48),
                  const Text(
                    'Meet your health\ncompanion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -1,
                      height: 1.1,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 600.ms)
                      .slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Track your health, get AI-powered insights, and build better habits every day.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.75),
                        height: 1.5,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 500.ms, duration: 600.ms),
                ],
              ),
            ),
            // Feature pills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FeaturePill(
                    icon: Icons.psychology_rounded,
                    label: 'AI Insights',
                  ),
                  const SizedBox(width: 12),
                  _FeaturePill(
                    icon: Icons.bar_chart_rounded,
                    label: 'Analytics',
                  ),
                  const SizedBox(width: 12),
                  _FeaturePill(
                    icon: Icons.notifications_active_rounded,
                    label: 'Alerts',
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(delay: 700.ms, duration: 600.ms),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: GestureDetector(
                onTap: () => context.go('/profile-setup'),
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Let's set up your profile",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(delay: 900.ms, duration: 600.ms)
                .slideY(begin: 0.3, end: 0),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go('/dashboard'),
              child: Text(
                'Skip for now',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _FeaturePill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeaturePill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
