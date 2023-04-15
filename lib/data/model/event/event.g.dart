// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      eventDate: json['eventDate'] as String?,
      details: json['details'] as String?,
      reviews: json['reviews'] as List<dynamic>?,
      location: json['location'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'eventDate': instance.eventDate,
      'details': instance.details,
      'reviews': instance.reviews,
      'location': instance.location,
    };
