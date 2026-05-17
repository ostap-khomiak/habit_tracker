// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(completionsForHabit)
final completionsForHabitProvider = CompletionsForHabitFamily._();

final class CompletionsForHabitProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<DateTime>>,
          Set<DateTime>,
          Stream<Set<DateTime>>
        >
    with $FutureModifier<Set<DateTime>>, $StreamProvider<Set<DateTime>> {
  CompletionsForHabitProvider._({
    required CompletionsForHabitFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'completionsForHabitProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$completionsForHabitHash();

  @override
  String toString() {
    return r'completionsForHabitProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Set<DateTime>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Set<DateTime>> create(Ref ref) {
    final argument = this.argument as String;
    return completionsForHabit(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CompletionsForHabitProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$completionsForHabitHash() =>
    r'3f4e4cecb52e0944e0cf56f1c9401ad2333ee1ba';

final class CompletionsForHabitFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Set<DateTime>>, String> {
  CompletionsForHabitFamily._()
    : super(
        retry: null,
        name: r'completionsForHabitProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CompletionsForHabitProvider call(String habitId) =>
      CompletionsForHabitProvider._(argument: habitId, from: this);

  @override
  String toString() => r'completionsForHabitProvider';
}
