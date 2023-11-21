import 'package:dogs_app/models/dog_breed_model.dart';

abstract class DogState {}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogBreedsLoaded extends DogState {
  final List<DogBreed> breeds;

  DogBreedsLoaded(this.breeds);
}

class DogImagesLoaded extends DogState {
  final List<DogBreed> breeds;

  DogImagesLoaded({required this.breeds});
}

class DogError extends DogState {
  final String message;

  DogError(this.message);
}