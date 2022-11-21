import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:gallery_app/core/domain/utils/result.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/get_images_usecase.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

@injectable
class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  int page = 0;
  static const int pageLength = 10;

  final GetImagesUseCase getImagesUseCase;

  GalleryBloc(this.getImagesUseCase) : super(GalleryInitial()) {
    on<GetGalleryImages>((event, emit) async {
      GalleryState currentState = state;
      var oldList = <ImageModel>[];
      if(currentState is GalleryLoading) return;
      if (currentState is GalleryLoaded) {
        oldList = currentState.imageList;
      }
      page++;
      emit(GalleryLoading(oldList, isFirstPage: page == 1));
      Result result = await getImagesUseCase.execute(page);
      if (result is Success<List<ImageModel>>) {
        oldList.addAll(result.data);
        emit(GalleryLoaded(imageList: oldList));
      } else if (result is Failed) {
        emit(GalleryError(error: result.errorMessage));
      } else {
        emit(GalleryError(error: "Something went wrong"));
      }
    });
  }
}
