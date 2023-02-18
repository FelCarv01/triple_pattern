import 'package:equatable/equatable.dart';
import 'package:flutter_triple/src/stores/notifier_store.dart';

class MockStore extends NotifierStore<String, int> {
  MockStore() : super(0);

  void updateWithValue(int state) => update(state);

  void updateWithError(String error) => setError(error);

  void enableLoading() => setLoading(true);

  void disableLoading() => setLoading(false);
}

class MockDistinctStore extends NotifierStore<String, CountState> {
  MockDistinctStore() : super(CountState(1));

  void updateWithIncrement() => update(CountState(state.value + 1));

  void updateWithdecrement() => update(CountState(state.value - 1));

  void updateWithValue(int value) => update(CountState(value));

  void updateError(String error) => setError(error);

  void enableLoading() => setLoading(true);

  void disableLoading() => setLoading(false);
}

class CountState with EquatableMixin {
  final int value;
  int? id;
  CountState(
    this.value, {
    this.id,
  }) {
    id = DateTime.now().microsecondsSinceEpoch;
  }

  @override
  List<Object?> get props => [value, id];
}
