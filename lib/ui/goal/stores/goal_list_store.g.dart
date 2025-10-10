// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GoalListStore on _GoalListStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_GoalListStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_GoalListStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$goalsAtom = Atom(name: '_GoalListStore.goals', context: context);

  @override
  ObservableList<GoalEntity> get goals {
    _$goalsAtom.reportRead();
    return super.goals;
  }

  @override
  set goals(ObservableList<GoalEntity> value) {
    _$goalsAtom.reportWrite(value, super.goals, () {
      super.goals = value;
    });
  }

  late final _$fetchGoalsAsyncAction = AsyncAction(
    '_GoalListStore.fetchGoals',
    context: context,
  );

  @override
  Future<void> fetchGoals() {
    return _$fetchGoalsAsyncAction.run(() => super.fetchGoals());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
goals: ${goals}
    ''';
  }
}
