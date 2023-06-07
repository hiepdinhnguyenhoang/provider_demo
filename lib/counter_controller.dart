import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

class CounterController extends StateNotifier<CounterState> {
  CounterController()
      : super(const CounterState(counter: 1, name: 'Hello world'));

  void add(int value) {
    state = state.copyWith(counter: state.counter + value);
    print('add called ${state.counter}');
  }
}

class CounterState extends Equatable {
  final int counter;
  final String name;

  const CounterState({required this.counter, required this.name});

  CounterState copyWith({
    int? counter,
    String? name,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [counter, name];
}
