// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishAdapter extends TypeAdapter<Wish> {
  @override
  final int typeId = 0;

  @override
  Wish read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wish(
      id: fields[0] as String,
      name: fields[1] as String,
      savingTarget: fields[2] as int,
      savingPlan: fields[3] as SavingPlan,
      savingNominal: fields[4] as int,
      listSaving: (fields[5] as List).cast<Saving>(),
      createdAt: fields[6] as DateTime,
      completedAt: fields[7] as DateTime?,
      imagePath: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Wish obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.savingTarget)
      ..writeByte(3)
      ..write(obj.savingPlan)
      ..writeByte(4)
      ..write(obj.savingNominal)
      ..writeByte(5)
      ..write(obj.listSaving)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.completedAt)
      ..writeByte(8)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SavingPlanAdapter extends TypeAdapter<SavingPlan> {
  @override
  final int typeId = 1;

  @override
  SavingPlan read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SavingPlan.daily;
      case 1:
        return SavingPlan.weekly;
      case 2:
        return SavingPlan.monthly;
      default:
        return SavingPlan.daily;
    }
  }

  @override
  void write(BinaryWriter writer, SavingPlan obj) {
    switch (obj) {
      case SavingPlan.daily:
        writer.writeByte(0);
        break;
      case SavingPlan.weekly:
        writer.writeByte(1);
        break;
      case SavingPlan.monthly:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavingPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
