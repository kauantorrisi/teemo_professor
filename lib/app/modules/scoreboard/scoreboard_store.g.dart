// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScoreboardStore on _ScoreboardStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ScoreboardStoreBase.isLoading', context: context);

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

  late final _$isErrorAtom =
      Atom(name: '_ScoreboardStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$_ScoreboardStoreBaseActionController =
      ActionController(name: '_ScoreboardStoreBase', context: context);

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$_ScoreboardStoreBaseActionController.startAction(
        name: '_ScoreboardStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_ScoreboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsError(bool value) {
    final _$actionInfo = _$_ScoreboardStoreBaseActionController.startAction(
        name: '_ScoreboardStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_ScoreboardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
