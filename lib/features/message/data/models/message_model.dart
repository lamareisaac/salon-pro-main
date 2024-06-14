enum MessageType { customer, artist }

class MessageModel {
  final String name;
  final String shortMessage;
  final MessageType type;
  final String date;
  final bool readed;

  MessageModel({
    required this.name,
    required this.shortMessage,
    required this.type,
    required this.date,
    this.readed = false,
  });

  String get typeLabel => type == MessageType.customer ? 'Client' : 'Artiste';

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      name: json['name'],
      shortMessage: json['message'],
      type: json['type'] == 'customer'
          ? MessageType.customer
          : MessageType.artist,
      date: json['date'],
    );
  }
}
