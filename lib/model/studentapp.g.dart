// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentapp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentappAdapter extends TypeAdapter<studentapp> {
  @override
  final int typeId = 1;

  @override
  studentapp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return studentapp(
      name: fields[0] as String,
      age: fields[1] as String,
      contact: fields[2] as String,
      email: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, studentapp obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.contact)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentappAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
