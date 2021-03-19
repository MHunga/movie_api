class Cast {
  int id;
  String name;
  String profilePath;
  String character;

  Cast({
    this.id,
    this.name,
    this.profilePath,
    this.character,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
    character = json['character'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    data['character'] = this.character;
    return data;
  }
}
