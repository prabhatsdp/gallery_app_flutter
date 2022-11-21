import 'package:flutter/material.dart';
import 'package:gallery_app/features/gallery/presentation/gallery_screen.dart';
import 'package:gallery_app/features/gallery/presentation/image_details_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: "/",
      builder: (BuildContext context, state) => const GalleryScreen(),
    ),
    GoRoute(
      path: "/details",
      builder: (BuildContext context, state) {
        var extras = state.extra;
        if(extras != null && extras is Map<String, dynamic>) {
          return ImageDetailsScreen(image: extras["image"]);
        }
        return const ImageDetailsScreen();
      },
    ),
  ],
);
