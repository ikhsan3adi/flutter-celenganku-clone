import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saving.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Saving extends Equatable {
  const Saving({
    required this.savingNominal,
    required this.createdAt,
    required this.message,
  });

  @HiveField(0)
  final int savingNominal;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final String message;

  Saving copyWith({
    int? savingNominal,
    DateTime? createdAt,
    String? message,
  }) {
    return Saving(
      savingNominal: savingNominal ?? this.savingNominal,
      createdAt: createdAt ?? this.createdAt,
      message: message ?? this.message,
    );
  }

  factory Saving.fromJson(Map<String, dynamic> json) => _$SavingFromJson(json);

  Map<String, dynamic> toJson() => _$SavingToJson(this);

  @override
  List<Object?> get props => [savingNominal, createdAt, message];
}
