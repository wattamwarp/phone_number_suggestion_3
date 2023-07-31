enum PhoneNumberSuggestionType {
  none,
  phoneNumberSelected,
  closedByUser,
  errorOccurred,
}

class PhoneNumberSuggestionResponse {
  PhoneNumberSuggestionType type;
  String data;

  PhoneNumberSuggestionResponse({
    this.type = PhoneNumberSuggestionType.none,
    this.data = '',
  });

  factory PhoneNumberSuggestionResponse.fromJson(Map<dynamic, dynamic> map) {
    final statusCode = map['statusCode'] ?? 404;
    final data = map['data'] ?? '';

    switch(statusCode){
      case 200:   return PhoneNumberSuggestionResponse(
        type: PhoneNumberSuggestionType.phoneNumberSelected,
        data: data,
      );
      case 204:
        return PhoneNumberSuggestionResponse(
            type: PhoneNumberSuggestionType.closedByUser, data: data);
      default:
        return PhoneNumberSuggestionResponse(
          type: PhoneNumberSuggestionType.errorOccurred,
          data: data,
        );
    }
  }
}
