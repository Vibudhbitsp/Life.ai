import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_repository_impl.dart';
import '../../domain/entities/onboarding_item.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/usecases/get_onboarding_items_usecase.dart';
import '../../domain/usecases/mark_onboarding_completed_usecase.dart';

// Repository provider
final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepositoryImpl();
});

// Use cases providers
final getOnboardingItemsUseCaseProvider = Provider<GetOnboardingItemsUseCase>((ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return GetOnboardingItemsUseCase(repository);
});

final markOnboardingCompletedUseCaseProvider = Provider<MarkOnboardingCompletedUseCase>((ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return MarkOnboardingCompletedUseCase(repository);
});

// State providers
final onboardingItemsProvider = FutureProvider<List<OnboardingItem>>((ref) async {
  final useCase = ref.watch(getOnboardingItemsUseCaseProvider);
  return await useCase();
});

final onboardingCompletedProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(onboardingRepositoryProvider);
  return await repository.isOnboardingCompleted();
});

// Notifier for onboarding completion
class OnboardingNotifier extends StateNotifier<AsyncValue<void>> {
  final MarkOnboardingCompletedUseCase _markCompletedUseCase;

  OnboardingNotifier(this._markCompletedUseCase) : super(const AsyncValue.data(null));

  Future<void> markOnboardingCompleted() async {
    state = const AsyncValue.loading();
    try {
      await _markCompletedUseCase();
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final onboardingNotifierProvider = StateNotifierProvider<OnboardingNotifier, AsyncValue<void>>((ref) {
  final useCase = ref.watch(markOnboardingCompletedUseCaseProvider);
  return OnboardingNotifier(useCase);
}); 