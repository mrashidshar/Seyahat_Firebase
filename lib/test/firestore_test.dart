import 'package:seyahat/models/place_model.dart';
import 'package:seyahat/services/place_service.dart';

class TestData {
  final PlaceService placeService = PlaceService();

  void createSamplePlace() async {
    Place samplePlace = Place(
      name: 'Historical Monument',
      longitude: 67.0099,
      latitude: 24.8607,
      description: 'A beautiful historical monument in Sukkur.',
      gallery: ['https://example.com/image1.jpg'],
      starRating: 4,
      thumbnail: 'https://example.com/thumbnail.jpg', id: '',
    );

    await placeService.addPlace(samplePlace);
  }
}
