import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/data/model/place/place.dart';
import 'package:meman/gen/assets.gen.dart';
import 'package:meman/presentation/widget/page_loader.dart';

class PlacesView extends HookConsumerWidget {
  const PlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                final place = PlacesListItem.mockEvents[index];
                return PlacesListItem(
                  image: place.imageUrl ?? "",
                  placeName: place.name!,
                  details: place.details!,
                );
              },
              childCount: PlacesListItem.mockEvents.length,
            ),
          ),
        ),
      ],
    );
  }
}

class PlacesListItem extends HookConsumerWidget {
  final String image;
  final String placeName;
  final String details;

  const PlacesListItem({
    Key? key,
    required this.image,
    required this.placeName,
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
                    height: size.height / 3,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 10),
          Text(
            placeName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: const [
              Text("Central Region"),
              SizedBox(width: 5),
              Icon(FontAwesome5.dot_circle, size: 5),
              SizedBox(width: 10),
              Text("National Park"),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Distance"),
                  SizedBox(height: 5),
                  Text(
                    "2.27mi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                child: VerticalDivider(color: Colors.white),
                height: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Capacity"),
                  SizedBox(height: 5),
                  Text(
                    "20,000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                child: VerticalDivider(color: Colors.white),
                height: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Working Hrs."),
                  SizedBox(height: 5),
                  Text(
                    "08:00 - 20:00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  static List<Place> get mockEvents => [
        const Place(
          id: "",
          imageUrl: null,
          name: "Kakum National Park",
          details: "Game night at Honey suckle",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Place(
          id: "",
          imageUrl: null,
          name: "Mole National Park",
          details: "Asa Bako - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Place(
          id: "",
          imageUrl: null,
          name: "Forte George",
          details: "Tidal Rave - Organized by Heny",
          location: {
            "coordinates": {"lat": 0.00081, "lng": -0.000081},
            "long_name": "Accra",
          },
        ),
        const Place(
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
