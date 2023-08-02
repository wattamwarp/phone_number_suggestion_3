sealed class PhoneNumber {}

class Success implements PhoneNumber {
  final String phoneNumber;

  Success({required this.phoneNumber});
}

class Failure implements PhoneNumber {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ClosedByUser implements PhoneNumber {}

/// this is not required for bottom-sheet
class NoneOfTheSelected implements PhoneNumber {}

PhoneNumber fromJson({required Map<dynamic, dynamic> map}) {
  final statusCode = map['statusCode'] ?? 404;
  final data = map['data'] ?? '';

  switch (statusCode) {
    case 200:
      return Success(phoneNumber: data);
    case 204:
      return ClosedByUser();
    default:
      return Failure(errorMessage: data);
  }
}
