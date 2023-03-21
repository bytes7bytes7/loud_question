// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ProdGameProvider implements ProdGameProvider {
  _ProdGameProvider(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> getState(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/state',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> listenState(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/listen_state',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> setReady(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '${id}/ready',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> setNotReady(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/not_ready',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> startGame(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/start',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> startAnswer(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/start_answer',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> giveAnswer(
    id,
    request,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/give_answer',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> getAnswer(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/get_answer',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  @override
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> restart(
      id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<JsonEitherWrapper<ProblemDetails, GameStateResponse>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/${id}/restart',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonEitherWrapper<ProblemDetails, GameStateResponse>.fromJson(
        _result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
