import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String? id;
  final String? name;

//<editor-fold desc="Data Methods">
  const Source({
    this.id,
    this.name,
  });
  @override
  String toString() {
    return 'Source{ id: $id, name: $name,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

//</editor-fold>
  @override
  List<Object?> get props => [id, name];
}
