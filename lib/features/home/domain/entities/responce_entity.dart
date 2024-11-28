import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;

  const ResponseEntity(
      this.id, this.name, this.year, this.color, this.pantoneValue);

  @override
  List<Object?> get props => [id, name, year, color, pantoneValue];
}
