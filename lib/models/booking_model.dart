enum BookingStatus { pending, confirmed, completed, cancelled }

class BookingModel {
  final String id;
  final String clientId;
  final String friendId;
  final String clientName;
  final String friendName;
  final DateTime date;
  final String startTime;
  final String endTime;
  final int hours;
  final double totalPrice;
  final String category;
  final String? note;
  final BookingStatus status;
  final DateTime createdAt;

  const BookingModel({
    required this.id,
    required this.clientId,
    required this.friendId,
    required this.clientName,
    required this.friendName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.hours,
    required this.totalPrice,
    required this.category,
    this.note,
    this.status = BookingStatus.pending,
    required this.createdAt,
  });

  BookingModel copyWith({
    String? id,
    String? clientId,
    String? friendId,
    String? clientName,
    String? friendName,
    DateTime? date,
    String? startTime,
    String? endTime,
    int? hours,
    double? totalPrice,
    String? category,
    String? note,
    BookingStatus? status,
    DateTime? createdAt,
  }) {
    return BookingModel(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      friendId: friendId ?? this.friendId,
      clientName: clientName ?? this.clientName,
      friendName: friendName ?? this.friendName,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      hours: hours ?? this.hours,
      totalPrice: totalPrice ?? this.totalPrice,
      category: category ?? this.category,
      note: note ?? this.note,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
