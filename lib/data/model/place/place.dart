import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

part 'place.g.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String id,
    String? name,
    String? imageUrl,
    String? eventDate,
    String? details,
    List? reviews,
    Map<String, dynamic>? location,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
