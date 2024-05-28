// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckBoxStateAdapter extends TypeAdapter<CheckBoxState> {
  @override
  final int typeId = 0;

  @override
  CheckBoxState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckBoxState(
      title: fields[0] as String,
      sessionTitle: fields[2] as String,
      value: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CheckBoxState obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.sessionTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckBoxStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
