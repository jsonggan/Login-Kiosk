class ThemeModel {
  final String primaryColor;
  final String primaryOnFocus;

  ThemeModel(
    {
      required this.primaryColor,
      required this.primaryOnFocus,
    }
  );

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      primaryColor: json['primary-color'],
      primaryOnFocus: json['primary-on-focus'],
    );
  }

  factory ThemeModel.defaultTheme() {
    return ThemeModel(
      primaryColor: "0xFFFF0052",
      primaryOnFocus: '0xFFFFFFFF',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primary-color': primaryColor,
      'primary-on-focus': primaryOnFocus
    };
  }
}
