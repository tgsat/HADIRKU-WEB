class CustomFirebaseException implements Exception {
  final String code;

  CustomFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'Terjadi error Firebase yang tidak diketahui. Silakan coba lagi.';
      case 'invalid-custom-token':
        return 'Format custom token salah. Silakan periksa custom token.';
      case 'custom-token-mismatch':
        return 'Custom token sesuai dengan audiens yang berbeda.';
      case 'user-disable':
        return 'Akun pengguna telah dinonaktifkan.';
      case 'user-not-found':
        return 'Tidak ada pengguna yang ditemukan untuk email atau UID yang diberikan.';
      case 'invalid-email':
        return 'Alamat email yang diberikan tidak valid. Tolong masukkan email yang benar.';
      case 'email-already-in-use':
        return 'Alamat email sudah terdaftar. Silakan gunakan email lain.';
      case 'wrong-password':
        return 'Kata sandi Salah. Silakan periksa kata sandi anda dan coba lagi.';
      case 'weak-password':
        return 'Kata sandinya terlalu lemah. Silakan pilih kata sandi yang lebih kuat.';
      case 'provider-already-linked':
        return 'Akun tersebut sudah tertaut dengan penyedia lain.';
      case 'operation-not-allowed':
        return 'Operasi ini tidak diperbolehkan. Hubungi dukungan untuk mendapatkan bantuan.';
      default:
        return 'Terjadi error Firebase yang tidak terduga. Silakan coba lagi.';
    }
  }
}
