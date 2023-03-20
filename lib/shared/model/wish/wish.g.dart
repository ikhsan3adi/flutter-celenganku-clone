// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wish _$WishFromJson(Map<String, dynamic> json) => Wish(
      id: json['id'] as String,
      name: json['name'] as String,
      savingTarget: json['savingTarget'] as int,
      savingPlan: $enumDecode(_$SavingPlanEnumMap, json['savingPlan']),
      savingNominal: json['savingNominal'] as int,
      listSaving: (json['listSaving'] as List<dynamic>)
          .map((e) => Saving.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$WishToJson(Wish instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'savingTarget': instance.savingTarget,
      'savingPlan': _$SavingPlanEnumMap[instance.savingPlan]!,
      'savingNominal': instance.savingNominal,
      'listSaving': instance.listSaving,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'imagePath': instance.imagePath,
    };

const _$SavingPlanEnumMap = {
  SavingPlan.daily: 'daily',
  SavingPlan.weekly: 'weekly',
  SavingPlan.monthly: 'monthly',
};
