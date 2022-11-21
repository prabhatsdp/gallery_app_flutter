// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/repos/image_repository.dart' as _i5;
import 'core/data/sources/remote/gallery_service.dart' as _i3;
import 'core/di/app_module.dart' as _i8;
import 'features/gallery/domain/repos/i_image_repository.dart' as _i4;
import 'features/gallery/domain/usecases/get_images_usecase.dart' as _i6;
import 'features/gallery/presentation/bloc/gallery_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i3.GalleryService>(
    () => appModule.galleryService,
    preResolve: true,
  );
  gh.factory<_i4.IImageRepository>(
      () => _i5.ImageRepository(get<_i3.GalleryService>()));
  gh.factory<_i6.GetImagesUseCase>(
      () => _i6.GetImagesUseCase(get<_i4.IImageRepository>()));
  gh.factory<_i7.GalleryBloc>(
      () => _i7.GalleryBloc(get<_i6.GetImagesUseCase>()));
  return get;
}

class _$AppModule extends _i8.AppModule {}
