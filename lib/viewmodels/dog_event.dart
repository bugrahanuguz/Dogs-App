import 'package:dogs_app/models/dog_breed_model.dart';

abstract class DogEvent {}

class DogEventLoadBreeds extends DogEvent {}

class DogEventLoadImages extends DogEvent {
  final List<DogBreed> breeds;

  DogEventLoadImages(this.breeds);
}