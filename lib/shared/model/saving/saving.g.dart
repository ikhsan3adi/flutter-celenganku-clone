// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavingAdapter extends TypeAdapter<Saving> {
  @override
  final int typeId = 2;

  @override
  Saving read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Saving(
      savingNominal: fields[0] as int,
      createdAt: fields[1] as DateTime,
      message: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Saving obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.savingNominal)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
