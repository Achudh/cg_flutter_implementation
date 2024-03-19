// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactsImpl _$$ContactsImplFromJson(Map<String, dynamic> json) =>
    _$ContactsImpl(
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContactsImplToJson(_$ContactsImpl instance) =>
    <String, dynamic>{
      'contacts': instance.contacts,
    };
