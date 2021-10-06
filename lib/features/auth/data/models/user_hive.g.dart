// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'user_hive.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class UserHiveAdapter extends TypeAdapter<UserHive> {
//   @override
//   final int typeId = 0;
//
//   @override
//   UserHive read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return UserHive()
//       ..email = fields[0] as String?
//       ..id = fields[1] as String
//       ..name = fields[2] as String?
//       ..photo = fields[3] as String?;
//   }
//
//   @override
//   void write(BinaryWriter writer, UserHive obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.email)
//       ..writeByte(1)
//       ..write(obj.id)
//       ..writeByte(2)
//       ..write(obj.name)
//       ..writeByte(3)
//       ..write(obj.photo);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is UserHiveAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
