import '../entities/onboarding_item.dart';

abstract class OnboardingRepository {
  /// Get the list of onboarding items
  Future<List<OnboardingItem>> getOnboardingItems();
  
  /// Mark onboarding as completed
  Future<void> markOnboardingCompleted();
  
  /// Check if onboarding has been completed
  Future<bool> isOnboardingCompleted();
} 