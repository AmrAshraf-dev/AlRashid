// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data_source/data/auth_remote_data_source.dart'
    as _i3;
import '../../features/auth/data_source/data/impl_auth_remote_data_source.dart'
    as _i4;
import '../../features/auth/data_source/repositorise/impl_auth_repositories.dart'
    as _i6;
import '../../features/auth/domain/repositories/repositoris.dart' as _i5;
import '../../features/base/data/data_sources/home_remote_data_source.dart'
    as _i20;
import '../../features/base/data/data_sources/impl_home_remote_data_source.dart'
    as _i21;
import '../../features/base/data/repositories/impl_base_repository.dart' as _i8;
import '../../features/base/domain/repositories/base_repository.dart' as _i7;
import '../http/dio_helper/actions/delete.dart' as _i9;
import '../http/dio_helper/actions/get.dart' as _i14;
import '../http/dio_helper/actions/patch.dart' as _i25;
import '../http/dio_helper/actions/post.dart' as _i26;
import '../http/dio_helper/actions/put.dart' as _i27;
import '../http/dio_helper/utils/dio_header.dart' as _i10;
import '../http/dio_helper/utils/dio_options.dart' as _i11;
import '../http/dio_helper/utils/handle_errors.dart' as _i17;
import '../http/dio_helper/utils/handle_json_response.dart' as _i18;
import '../http/dio_helper/utils/handle_request_body.dart' as _i19;
import '../http/generic_http/generic_http.dart' as _i13;
import '../network/network_info.dart' as _i23;
import 'firebase_analytics_helper.dart' as _i12;
import 'global_context.dart' as _i15;
import 'global_notification.dart' as _i16;
import 'loading_helper.dart' as _i22;
import 'new_version_helper.dart' as _i24;
import 'rate_app_helper.dart' as _i28;
import 'utilities.dart' as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthRemoteDataSource>(() => _i4.ImplAuthRemoteDataSource());
  gh.factory<_i5.AuthRepository>(() => _i6.ImplAuthRepositories());
  gh.factory<_i7.BaseRepository>(() => _i8.ImplBaseRepository());
  gh.lazySingleton<_i9.Delete>(() => _i9.Delete());
  gh.lazySingleton<_i10.DioHeader>(() => _i10.DioHeader());
  gh.lazySingleton<_i11.DioOptions>(() => _i11.DioOptions());
  gh.lazySingleton<_i12.FirebaseAnalyticsHelper>(
      () => _i12.FirebaseAnalyticsHelper());
  gh.lazySingleton<_i13.GenericHttpImpl<dynamic>>(
      () => _i13.GenericHttpImpl<dynamic>());
  gh.lazySingleton<_i14.Get>(() => _i14.Get());
  gh.lazySingleton<_i15.GlobalContext>(() => _i15.GlobalContext());
  gh.lazySingleton<_i16.GlobalNotification>(() => _i16.GlobalNotification());
  gh.lazySingleton<_i17.HandleErrors>(() => _i17.HandleErrors());
  gh.lazySingleton<_i18.HandleJsonResponse<dynamic>>(
      () => _i18.HandleJsonResponse<dynamic>());
  gh.lazySingleton<_i19.HandleRequestBody>(() => _i19.HandleRequestBody());
  gh.factory<_i20.HomeRemoteDataSource>(() => _i21.ImplHomeRemoteDataSource());
  gh.lazySingleton<_i22.LoadingHelper>(() => _i22.LoadingHelper());
  gh.lazySingleton<_i23.NetworkInfoImpl>(() => _i23.NetworkInfoImpl());
  gh.lazySingleton<_i24.NewVersionHelper>(() => _i24.NewVersionHelper());
  gh.lazySingleton<_i25.Patch>(() => _i25.Patch());
  gh.lazySingleton<_i26.Post>(() => _i26.Post());
  gh.lazySingleton<_i27.Put>(() => _i27.Put());
  gh.lazySingleton<_i28.RateAppHelper>(() => _i28.RateAppHelper());
  gh.lazySingleton<_i29.Utilities>(() => _i29.Utilities());
  return get;
}
