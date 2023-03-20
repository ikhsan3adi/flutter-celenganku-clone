// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Saving _$SavingFromJson(Map<String, dynamic> json) => Saving(
      savingNominal: json['savingNominal'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SavingToJson(Saving instance) => <String, dynamic>{
      'savingNominal': instance.savingNominal,
      'createdAt': instance.createdAt.toIso8601String(),
      'message': instance.message,
    };
