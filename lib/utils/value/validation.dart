class Validator {
  // Validation Empty Text
  static String? validateEmptyText(String? field, String? value) {
    if (value == null || value.isEmpty) {
      return '$field tidak boleh kosong.';
    }
    return null;
  }

  // Validation Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong.';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    // final emailRegExp = RegExp(
    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Format alamat email salah';
    }
    return null;
  }

  // Validation Username
  static String? validateUsernmae(String? username) {
    if (username == null || username.isEmpty) {
      return 'Nama Pengguna tidak boleh kosong.';
    }

    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";
    final regex = RegExp(pattern);
    bool isValid = regex.hasMatch(username);
    if (isValid) {
      isValid = !username.startsWith('_') &&
          !username.startsWith('-') &&
          !username.endsWith('_') &&
          !username.endsWith('-');
    }
    if (isValid) {
      return 'Nama pengguna tidak valid.';
    }
    return null;
  }

  // Validation Password
  static String? validatePassword(String? field, value) {
    if (value == null || value.isEmpty) {
      return '$field tidak boleh kosong.';
    }

    if (value.length < 6) {
      return '$field harus lebih dari 6 karakter.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return '$field harus mengandung setidaknya satu huruf besar.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return '$field harus berisi setidaknya satu angka.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return '$field setidaknya harus mengandung karakter spesial.';
    }
    return null;
  }

  // Validation Password Confirm
  static String? validatePasswordConfirm(String? field, value, String match) {
    if (value == null || value.isEmpty) {
      return '$field tidak boleh kosong.';
    }

    if (value.length < 6) {
      return '$field harus lebih dari 6 karakter.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return '$field harus mengandung setidaknya satu huruf besar.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return '$field harus berisi setidaknya satu angka.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return '$field setidaknya harus mengandung karakter spesial.';
    }

    if (value != match) {
      return '$field berbeda dengan password.';
    }
    return null;
  }

  // Validation Phone Number
  static String? validatePhoneNumber(String? field, value) {
    if (value == null || value.isEmpty) {
      return '$field tidak boleh kosong.';
    }

    if (value.length < 9) {
      return '$field terlalu pendek, minimal 9 digit.';
    }

    if (value.length > 13) {
      return '$field terlalu panjang, maksimal 13 digit.';
    }
    return null;
  }
}
