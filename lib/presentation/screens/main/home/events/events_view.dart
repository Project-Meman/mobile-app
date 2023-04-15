import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/core/utils/theme/app_colors.dart';
import 'package:meman/data/model/event/event.dart';
import 'package:meman/gen/assets.gen.dart';
import 'package:meman/presentation/widget/page_loader.dart';

class EventsView extends HookConsumerWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: size.height / 5,
            color: AppColors.black,
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: EventCategoryItem.mockEvents.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              itemBuilder: (ctx, index) {
                final event = EventCategoryItem.mockEvents[index];
                return EventCategoryItem(
                  image: event.imageUrl ?? "",
                  eventName: event.name!,
                );
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                final event = EventCategoryItem.mockEvents[index];
                return EventListItem(
                  image: event.imageUrl ?? "",
                  eventName: event.name!,
                  details: event.details!,
                );
              },
              childCount: EventCategoryItem.mockEvents.length,
            ),
          ),
        )
      ],
    );
  }
}

class EventCategoryItem extends HookConsumerWidget {
  final String image;
  final String eventName;

  const EventCategoryItem({
    Key? key,
    required this.image,
    required this.eventName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) => const PageLoader(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.stream),
                  )
                : Assets.images.introBg.image(
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 10),
          Text(eventName, textAlign: TextAlign.center)
        ],
      ),
    );
  }

  static List<Event> get mockEvents => [
        const Event(
          id: "",
          imageUrl: null,
          name: "Game night",
          details: "Game night at Honey suckle",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Event(
          id: "",
          imageUrl: null,
          name: "Festival",
          details: "Asa Bako - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Event(
          id: "",
          imageUrl: null,
          name: "Clubbing",
          details: "Tidal Rave - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Event(
          id: "",
          imageUrl: null,
          name: "Trail running",
          details: "Trail running - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
      ];
}

class EventListItem extends HookConsumerWidget {
  final String image;
  final String eventName;
  final String details;

  const EventListItem({
    Key? key,
    required this.image,
    required this.eventName,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) => const PageLoader(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.stream),
                  )
                : Assets.images.introBg.image(
                    width: size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Text("Weekly"),
              SizedBox(width: 5),
              Icon(FontAwesome5.dot_circle, size: 5),
              SizedBox(width: 10),
              Icon(FontAwesome5Solid.star, size: 10),
              SizedBox(width: 10),
              Text("4.4(477)"),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            eventName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(details),
          const SizedBox(height: 5),
          Row(
            children: const [
              Text("1.3mi"),
              SizedBox(width: 5),
              Icon(FontAwesome5.dot_circle, size: 5),
              SizedBox(width: 5),
              Text("Est 2.6m"),
            ],
          ),
        ],
      ),
    );
  }

  static List<Event> get mockEvents => [
        const Event(
          id: "",
          imageUrl: null,
          name: "Game night",
          details: "Game night at Honey suckle",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Event(
          id: "",
          imageUrl: null,
          name: "Festival",
          details: "Asa Bako - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Event(
          id: "",
          imageUrl: null,
          name: "Clubbing",
          details: "Tidal Rave - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Event(
          id: "",
          imageUrl: null,
          name: "Trail running",
          details: "Trail running - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
      ];
}
