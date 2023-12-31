class ImageItem {
  num id;
  String imageUrl;
  String tags;

//<editor-fold desc="Data Methods">
  ImageItem({
    required this.id,
    required this.imageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          imageUrl == other.imageUrl &&
          tags == other.tags);

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageItem{' +
        ' id: $id,' +
        ' imageUrl: $imageUrl,' +
        ' tags: $tags,' +
        '}';
  }

  ImageItem copyWith({
    num? id,
    String? imageUrl,
    String? tags,
  }) {
    return ImageItem(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'imageUrl': this.imageUrl,
      'tags': this.tags,
    };
  }

  factory ImageItem.fromJson(Map<String, dynamic> map) {
    return ImageItem(
      id: map['id'] as num,
      imageUrl: map['imageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}
