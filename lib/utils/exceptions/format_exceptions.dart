class CustomFormatException implements Exception {
  final String message;

  const CustomFormatException(
      [this.message =
          'Terjadi kesalahan format yang tidak terduga. Silakan periksa input Anda.']);

  factory CustomFormatException.fromMessage(String mesaage) {
    return CustomFormatException(mesaage);
  }

  String get formattedMessage => message;

  factory CustomFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const CustomFormatException(
            'Format alamat email tidak valid. Tolong masukkan email yang benar.');
      case 'invalid-phone-number-format':
        return const CustomFormatException(
            'Format nomor telepon yang diberikan tidak valid. Silakan masukkan nomor yang valid.');
      case 'invalid-date-format':
        return const CustomFormatException(
            'Format tanggal tidak valid. Silakan masukkan tanggal yang valid.');
      case 'invalid-url-format':
        return const CustomFormatException(
            'Format URL tidak valid. Silakan masukkan URL yang valid.');
      case 'invalid-credit-card-format':
        return const CustomFormatException(
            'Format kartu kredit tidak valid. Silakan masukkan nomor kartu kredit yang valid.');
      case 'invalid-numeric-format':
        return const CustomFormatException(
            'Input harus dalam format numerik yang valid.');
      default:
        return const CustomFormatException('');
    }
  }
}
