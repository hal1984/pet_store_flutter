import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_store/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterEvent, int>(
        bloc: _counterBloc,
        builder: (BuildContext context, int count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          createFloatingButton(bloc: _counterBloc, event: CounterEvent.increment, icon: Icons.add),
          createFloatingButton(bloc: _counterBloc, event: CounterEvent.decrement, icon: Icons.remove),
        ],
      ),
    );
  }
}

Widget createFloatingButton({Bloc bloc, IconData icon, CounterEvent event}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.0),
    child: FloatingActionButton(
      heroTag: event.toString(),
      child: Icon(icon),
      onPressed: () {
        bloc.dispatch(event);
      },
    ),
  );
}
