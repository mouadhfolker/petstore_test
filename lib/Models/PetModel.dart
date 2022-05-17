class PetModel {
  final int? id;
  final String? category;
  final String? name;
  final String? tags;
  final String? status;
  final String? Photourls;

  PetModel(
      {this.id,
      this.category,
      this.name,
      this.status,
      this.Photourls,
      this.tags});
  factory PetModel.fromJson(dynamic json) {
    return PetModel(
        name: json['name'] as String,
        id: json['id'] as int,
        category: json['category'] as String,
        tags: json['tags'] as String,
        status: json['status'] as String,
        Photourls: json['photoUrls'] as String);
  }
  static List<PetModel> petFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return PetModel.fromJson(data);
    }).toList();
  }
}
