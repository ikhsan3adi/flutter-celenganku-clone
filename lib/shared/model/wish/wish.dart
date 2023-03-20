import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wish.g.dart';

enum SavingPlan { daily, weekly, monthly }

@JsonSerializable()
class Wish extends Equatable {
  const Wish({
    required this.id,
    required this.name,
    required this.savingTarget,
    required this.savingPlan,
    required this.savingNominal,
    required this.listSaving,
    required this.createdAt,
    this.completedAt,
    this.imagePath,
  });

  final String id;

  final String name;
  final int savingTarget;
  final SavingPlan savingPlan;
  final int savingNominal;

  final List<Saving> listSaving;

  final DateTime createdAt;
  final DateTime? completedAt;

  final String? imagePath;

  Wish copyWith({
    String? name,
    int? savingTarget,
    SavingPlan? savingPlan,
    int? savingNominal,
    List<Saving>? listSaving,
    DateTime? createdAt,
    DateTime? completedAt,
    String? imagePath,
  }) {
    return Wish(
      id: id,
      name: name ?? this.name,
      savingTarget: savingTarget ?? this.savingTarget,
      savingPlan: savingPlan ?? this.savingPlan,
      savingNominal: savingNominal ?? this.savingNominal,
      listSaving: listSaving ?? this.listSaving,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  factory Wish.fromJson(Map<String, dynamic> json) => _$WishFromJson(json);

  Map<String, dynamic> toJson() => _$WishToJson(this);

  @override
  List<Object?> get props {
    return [
      name,
      savingTarget,
      savingPlan,
      savingNominal,
      listSaving,
      createdAt,
      completedAt,
    ];
  }
}
