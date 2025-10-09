// ignore: avoid_classes_with_only_static_members
class FieldValidators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  static String? Function(String?) minLength(int minLength) {
    return (String? value) {
      if (value != null && value.length < minLength) {
        return 'Deve ter no mínimo $minLength caracteres';
      }
      return null;
    };
  }

  static String? Function(String?) maxLength(int maxLength) {
    return (String? value) {
      if (value != null && value.length > maxLength) {
        return 'Deve ter no máximo $maxLength caracteres';
      }
      return null;
    };
  }

  static String? email(String? value) {
    if (value != null &&
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Insira um email válido';
    }
    return null;
  }

  static String? number(String? value) {
    if (value != null && double.tryParse(value.replaceAll(',', '.')) == null) {
      return 'Insira um número válido';
    }
    return null;
  }

  static String? date(DateTime? value) {
    if (value == null) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  static String? Function(String?) compose(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }
}
