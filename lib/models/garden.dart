class Garden {
  final String name;
  final String description;
  final String img;

  Garden({required this.name, required this.description, required this.img});

  factory Garden.fromDate(dynamic data) {
    return Garden(
        name: data['name'], description: data['description'], img: data['img']);
  }
}
