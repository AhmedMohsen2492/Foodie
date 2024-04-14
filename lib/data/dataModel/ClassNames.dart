class ClassNames {
  ClassNames({
    this.classNames,
  });

  List<String>? classNames;

  ClassNames.fromJson(dynamic json) {
    classNames =
        json['class_names'] != null ? json['class_names'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['class_names'] = classNames;
    return map;
  }
}
