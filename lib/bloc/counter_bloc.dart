// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:rxdart/rxdart.dart';


// class CounterBloc extends BlocBase{

//   Observable<int> counter;


//   CounterBloc(){
//     counter = Observable.merge([
//       _increment,
//       _decrement,
//     ]).startWith(0).scan((acc, curr, i) => acc + curr, 0).asBroadcastStream();

//     final _increment =  BehaviorSubject<int>();
//     final _decrement =  BehaviorSubject<int>();
//     void increment() => _increment.add(1);
//     void decrement() => _decrement.add(-1);
//   }
//     @override
//       void dispose() {// will be called automatically
//         _increment.close();
//         _decrement.close();
//       }
// }