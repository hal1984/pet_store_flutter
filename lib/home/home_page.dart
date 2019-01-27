import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pet_store/second/second_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'MENU',
                style: TextStyle(color: Colors.pink),
              ),
            ),
            ListTile(
              leading: Icon(Icons.format_list_numbered),
              title: Text('Contador'),
              onTap: () {
                // change app state...
                Navigator.pushNamed(context, '/counter'); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.pets),
              title: Text('Pets'),
              onTap: () {
                BlocProvider.of<PetBloc>(context).dispatch(PetEvent.findByStatus);
                // change app state...
                Navigator.pushNamed(context, '/second'); // close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
