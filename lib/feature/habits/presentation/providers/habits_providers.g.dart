// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(habitsRepository)
final habitsRepositoryProvider = HabitsRepositoryProvider._();

final class HabitsRepositoryProvider
    extends
        $FunctionalProvider<
          HabitsRepository,
          HabitsRepository,
          HabitsRepository
        >
    with $Provider<HabitsRepository> {
  HabitsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'habitsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$habitsRepositoryHash();

  @$internal
  @override
  $ProviderElement<HabitsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HabitsRepository create(Ref ref) {
    return habitsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HabitsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HabitsRepository>(value),
    );
  }
}

String _$habitsRepositoryHash() => r'110e6ac98de7cbe092838bbb26bef63990d9750f';

@ProviderFor(habitsList)
final habitsListProvider = HabitsListProvider._();

final class HabitsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Habit>>,
          List<Habit>,
          Stream<List<Habit>>
        >
    with $FutureModifier<List<Habit>>, $StreamProvider<List<Habit>> {
  HabitsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'habitsListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$habitsListHash();

  @$internal
  @override
  $StreamProviderElement<List<Habit>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Habit>> create(Ref ref) {
    return habitsList(ref);
  }
}

String _$habitsListHash() => r'1f7a8a87652629cf26e474b8449affc6f37dd1c5';

@ProviderFor(todayCompletions)
final todayCompletionsProvider = TodayCompletionsProvider._();

final class TodayCompletionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<String>>,
          Set<String>,
          Stream<Set<String>>
        >
    with $FutureModifier<Set<String>>, $StreamProvider<Set<String>> {
  TodayCompletionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayCompletionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayCompletionsHash();

  @$internal
  @override
  $StreamProviderElement<Set<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Set<String>> create(Ref ref) {
    return todayCompletions(ref);
  }
}

String _$todayCompletionsHash() => r'7e819a3e33e3beb7ef9a791a0063352f1932c676';
