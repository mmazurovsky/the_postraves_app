import 'package:freezed_annotation/freezed_annotation.dart';

import '../../error/failures.dart';

part 'response_sealed.freezed.dart';

@freezed
class ResponseSealed<DATA> with _$ResponseSealed {
  const factory ResponseSealed.success(DATA data) = SuccessResponse;
  const factory ResponseSealed.failure(Failure failure,
      [String? failureMessage]) = FailureResponse;
}
