// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      uuid: fields[0] as String,
      name: fields[1] as String,
      photoUrl: fields[2] as String,
      email: fields[3] as String,
      password: fields[4] as String,
      mobileNumber: fields[5] as int,
      targetWeight: fields[6] as double,
      currentWeight: fields[7] as double,
      height: fields[8] as double,
      gender: fields[9] as String,
      age: fields[10] as DateTime,
      createdAt: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photoUrl)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.mobileNumber)
      ..writeByte(6)
      ..write(obj.targetWeight)
      ..writeByte(7)
      ..write(obj.currentWeight)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.age)
      ..writeByte(11)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
