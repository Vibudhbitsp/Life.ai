import '../entities/onboarding_item.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingItemsUseCase {
  final OnboardingRepository repository;

  GetOnboardingItemsUseCase(this.repository);

  Future<List<OnboardingItem>> call() async {
    return await repository.getOnboardingItems();
  }
} 