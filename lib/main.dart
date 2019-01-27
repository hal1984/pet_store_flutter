import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pet_store/counter/counter_bloc.dart';
import 'package:flutter_pet_store/counter/counter_page.dart';
import 'package:flutter_pet_store/home/home_page.dart';
import 'package:flutter_pet_store/second/second_bloc.dart';
import 'package:flutter_pet_store/second/second_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  final CounterBloc _counterBloc = CounterBloc();
  final PetBloc _petBloc = PetBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      bloc: _counterBloc,
      child: BlocProvider<PetBloc>(
        bloc: _petBloc,
        child: MaterialApp(
          title: 'Flutter Demo',
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(),
            '/counter': (context) => CounterPage(),
            '/second': (context) => SecondScreen(),
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
