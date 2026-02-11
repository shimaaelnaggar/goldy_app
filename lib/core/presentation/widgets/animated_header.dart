import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';

class AnimatedHeader extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const AnimatedHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor = AppColors.goldColor,
  });

  @override
  State<AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          children: [
            Icon(widget.icon, size: 60, color: widget.iconColor),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
