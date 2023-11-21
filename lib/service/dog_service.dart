import 'dart:async';
import 'dart:convert';
import 'package:dogs_app/models/dog_breed_model.dart';
import 'package:http/http.dart' as http;

class DogService {
  Future<List<DogBreed>> fetchDogBreeds() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body)['message'];
      final List<DogBreed> breeds = [];

      data.forEach((name, subBreeds) {
        final DogBreed breed = DogBreed(
            name: name, image: '', subBreeds: List<String>.from(subBreeds));
        breeds.add(breed);
      });
      final List<Future<void>> futures = [];

      for (final breed in breeds) {
        final Future<void> future =
            fetchDogImage(breed.name).then((imageUrl) async {
          breed.image = imageUrl;
        });
        futures.add(future);
      }

      await Future.wait(futures);
      return breeds;
    } else {
      throw Exception('Failed to load dog breeds');
    }
  }

  Future<String> fetchDogImage(String breed) async {
    final response = await http
        .get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));

    if (response.statusCode == 200) {
      final String imageUrl = jsonDecode(response.body)['message'];
      return imageUrl;
    } else {
      throw Exception('Failed to load dog image for $breed');
    }
  }

  Future<List<DogBreed>> fetchDogImagesForBreeds(List<DogBreed> breeds) async {
    final List<Future<void>> futures = [];

    for (final breed in breeds) {
      final Future<void> future = fetchDogImage(breed.name).then((imageUrl) {
        breed.image = imageUrl;
      });
      futures.add(future);
    }

    await Future.wait(futures);

    return breeds;
  }
}
