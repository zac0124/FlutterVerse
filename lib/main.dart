import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_weekly_widget/bloc/bloc_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => BlocController()),
      ],
      dependencies: [],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyWidget()),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BlocController bloc = BlocProvider.getBloc<BlocController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment(),
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: bloc.outCounter,
        builder: (context, snapshot) {
          return Text(
            'Number of pressed: ${snapshot.data}',
            style: Theme.of(context).textTheme.displaySmall,
          );
        },
      ),
    );
  }
}
