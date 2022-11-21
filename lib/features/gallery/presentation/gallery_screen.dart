import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/data/repos/image_repository.dart';
import 'package:gallery_app/features/gallery/domain/repos/i_image_repository.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:gallery_app/features/gallery/presentation/widgets/image_grid_section.dart';
import 'package:gallery_app/features/gallery/presentation/widgets/image_item.dart';
import 'package:gallery_app/injection.dart';

import '../domain/usecases/get_images_usecase.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GalleryBloc>(
          create: (BuildContext context) => getIt<GalleryBloc>()
            ..add(
              const GetGalleryImages(),
            ),
        ),
      ],
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: SafeArea(
            child: ImageGridSection()
          ),
        );
      }),
    );
  }
}
