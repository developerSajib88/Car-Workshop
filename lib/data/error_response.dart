import 'dart:convert';

class ErrorResponse {
  final dynamic data;
  final String? message;
  final dynamic stack;

  ErrorResponse({
    this.data,
    this.message,
    this.stack,
  });

  factory ErrorResponse.fromRawJson(String str) =>
      ErrorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        data: json["data"],
        message: json["message"],
        stack: json["stack"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "stack": stack,
      };
}
