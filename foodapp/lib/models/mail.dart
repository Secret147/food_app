import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Mail {
  String subject;
  String message;
  Mail({
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subject': subject,
      'message': message,
    };
  }

  factory Mail.fromMap(Map<String, dynamic> map) {
    return Mail(
      subject: map['subject'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mail.fromJson(String source) =>
      Mail.fromMap(json.decode(source) as Map<String, dynamic>);
}
