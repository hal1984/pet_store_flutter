import 'package:bloc/bloc.dart';
import 'package:swagger/api.dart';

enum PetEvent { findByStatus }

class PetBloc extends Bloc<PetEvent, List<Pet>> {

  PetApi petApi = PetApi();

  @override
  List<Pet> get initialState => [];

  @override
  Stream<List<Pet>> mapEventToState( List<Pet> currentState, PetEvent event) {
    switch (event) {
      case PetEvent.findByStatus:
        var pets = this.petApi.findPetsByStatus(['available']).asStream();
        return pets;
      default:
        return Future.value(currentState).asStream();
    }
  }
}