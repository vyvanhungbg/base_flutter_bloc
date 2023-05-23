class ParamsSearchUser {
  final String q;

  ParamsSearchUser({required this.q});

  Map<String, dynamic> toJson() => _$ParamsSearchUserToJson(this);
}

Map<String, dynamic> _$ParamsSearchUserToJson(ParamsSearchUser instance) =>
    <String, dynamic>{
      'q': instance.q,
    };
