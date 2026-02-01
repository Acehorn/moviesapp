class Character {
  final int id;
  final String name;
  final String gender;
  final String species;
  final String status;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.gender,
    required this.species,
    required this.status,
    required this.image,
  });

factory Character.fromJson(Map<String, dynamic> json) {
  final image = json['image'] ?? '';

  return Character(
    id: json['id'],
    name: json['name'] ?? 'Unknown',
    gender: json['gender'] ?? 'UNKNOWN',
    species: json['species'] ?? 'UNKNOWN',
    status: json['status'] ?? '',
    image: image is String ? image : '',
  );
}
}
