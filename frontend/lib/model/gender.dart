enum Gender { male, female, nonBinary }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.nonBinary:
        return 'Non-Binary';
      default:
        return '';
    }
  }

  static Gender fromName(String name) {
    switch (name) {
      case 'Male':
        return Gender.male;
      case 'Female':
        return Gender.female;
      case 'Non-Binary':
        return Gender.nonBinary;
      default:
        throw Exception('Invalid gender name: $name');
    }
  }
}
