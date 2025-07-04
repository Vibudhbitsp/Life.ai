import 'package:flutter/material.dart';
import '../../domain/entities/onboarding_item.dart';

class OnboardingContent extends StatefulWidget {
  final OnboardingItem item;

  const OnboardingContent({
    super.key,
    required this.item,
  });

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with animation
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: widget.item.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  widget.item.icon,
                  size: 60,
                  color: widget.item.color,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Title with animation
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                widget.item.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.headlineMedium?.color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Description with animation
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                widget.item.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 