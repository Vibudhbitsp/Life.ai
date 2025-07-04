import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_indicator.dart';
import '../providers/onboarding_provider.dart';
import '../../domain/entities/onboarding_item.dart';

@RoutePage()
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onGetStarted() async {
    // Mark onboarding as completed
    await ref.read(onboardingNotifierProvider.notifier).markOnboardingCompleted();
    
    // TODO: Navigate to home or auth page
    // context.router.replace(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    final onboardingItemsAsync = ref.watch(onboardingItemsProvider);

    return Scaffold(
      body: SafeArea(
        child: onboardingItemsAsync.when(
          data: (onboardingItems) => _buildContent(onboardingItems),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(List<OnboardingItem> onboardingItems) {
    return Column(
      children: [
        // Skip button
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: _onGetStarted,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        
        // Page content
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: onboardingItems.length,
            itemBuilder: (context, index) {
              return OnboardingContent(
                item: onboardingItems[index],
              );
            },
          ),
        ),
        
        // Page indicator
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: OnboardingIndicator(
            currentPage: _currentPage,
            totalPages: onboardingItems.length,
          ),
        ),
        
        // Navigation buttons
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Previous button
              if (_currentPage > 0)
                TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text('Previous'),
                )
              else
                const SizedBox(width: 80),
              
              // Next/Get Started button
              ElevatedButton(
                onPressed: () {
                  if (_currentPage < onboardingItems.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _onGetStarted();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _currentPage < onboardingItems.length - 1 ? 'Next' : 'Get Started',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 