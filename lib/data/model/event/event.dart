import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    String? name,
    String? imageUrl,
    String? eventDate,
    String? details,
    List? reviews,
    Map<String, dynamic>? location,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);
}
