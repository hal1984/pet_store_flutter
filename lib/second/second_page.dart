import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pet_store/second/second_bloc.dart';
import 'package:swagger/api.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petBloc = BlocProvider.of<PetBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: BlocBuilder<PetEvent, List<Pet>>(
          bloc: petBloc,
          builder: (context, List<Pet> data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, position) {
                return ListTile(
                  leading: Container(
                    child: data[position].photoUrls.length > 0
                        ? Image.network(
                            data[position].photoUrls[0],
                          )
                        : Image.network(
                            'https://ichef.bbci.co.uk/images/ic/512x512/p04s6908.jpg',                            
                          ),
                    width: 48,
                    height: 48,
                  ),
                  title: Text(
                    data[position].name ?? '',
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pets),
        onPressed: () => petBloc.dispatch(PetEvent.findByStatus),
      ),
    );
  }
}
