import 'package:dogs_app/models/dog_breed_model.dart';
import 'package:dogs_app/service/dog_service.dart';
import 'package:dogs_app/viewmodels/dog_event.dart';
import 'package:dogs_app/viewmodels/dog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogService dogService;
  String randomImageUrl = "";
  DogBloc(this.dogService) : super(DogInitial()) {
    on<DogEventLoadBreeds>((event, emit) async {
      emit(DogLoading());
      final List<DogBreed> dList = await dogService.fetchDogBreeds();
      emit(DogBreedsLoaded(dList));
    });
  }
  Future<String> randomDogImage(String name) async {
    randomImageUrl = await dogService.fetchDogImage(name);

    return randomImageUrl;
  }
}

  // Stream<DogState> mapEventToState(DogEvent event) async* {
  //   if (event is DogEventLoadBreeds) {
  //     yield DogLoading();
  //     try {
  //       final breeds = await dogService.fetchDogBreeds();
  //       yield DogBreedsLoaded(breeds);
  //     } catch (e) {
  //       yield DogError('Failed to load breeds: $e');
  //     }
  //   } else if (event is DogEventLoadImages) {
  //     yield DogLoading();
  //     try {
  //       final breedList =
  //           await dogService.fetchDogImagesForBreeds(event.breeds);
  //       yield DogImagesLoaded(breeds: breedList);
  //     } catch (e) {
  //       yield DogError('Failed to load images: $e');
  //     }
  //   }
  // }

