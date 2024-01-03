class ThemeModel {
  final String primaryColor;

  ThemeModel(
    {
      required this.primaryColor
    }
  );

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      primaryColor: json['primary-color'],
    );
  }

  factory ThemeModel.defaultTheme() {
    return ThemeModel(
      primaryColor: "0xFFFF0052",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primary-color': primaryColor
    };
  }
}
