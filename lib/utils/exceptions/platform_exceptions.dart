class CustomPlatformException implements Exception {
  final String code;

  CustomPlatformException(this.code);

  String get message {
    switch (code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'Email has alread been registered.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Kredensial masuk tidak valid. Silakan periksa kembali informasi Anda.';
      case 'too-many-requests':
        return 'Terlalu banyak permintaan. Silakan coba lagi nanti.';
      case 'invalid-argument':
        return 'Argumen yang diberikan pada metode autentikasi tidak valid.';
      case 'invalid-password':
        return 'Kata kunci Salah. Silakan coba lagi.';
      case 'invalid-phone-number':
        return 'Nomor telepon yang diberikan tidak valid.';
      case 'operation-not-allowed':
        return 'Penyedia login dinonaktifkan untuk project Firebase Anda.';
      case 'session-cookie-expired':
        return 'Cookie sesi Firebase telah kedaluwarsa. Silakan masuk lagi.';
      case 'uid-already-exists':
        return 'ID pengguna yang diberikan sudah digunakan pengguna lain.';
      case 'sign_in_failed':
        return 'Gagal masuk. Silakan coba lagi.';
      case 'network-request-failed':
        return 'Pemulihan jaringan gagal. Silakan periksa koneksi internet Anda.';
      case 'internal-error':
        return 'Kesalahan internal. Silakan coba lagi nanti.';
      case 'invalid-verification-code':
        return 'Kode verifikasi tidak benar. Silakan masukkan kode yang valid.';
      case 'invalid-verification-id':
        return 'ID verifikasi tidak valid. Silakan minta kode verifikasi baru.';
      case 'quota-exceeded':
        return 'Kuota terlalu banyak. Silakan coba lagi nanti.';
      default:
        return 'Terjadi kesalahan platform yang tidak terduga. Silakan coba lagi.';
    }
  }
}
