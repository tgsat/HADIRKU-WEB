class CustomFirebaseAuthException implements Exception {
  final String code;

  CustomFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'Email ini telah digunakan. Silakan pilih email lain!.';
      case 'invalid-email':
        return 'Masukkan email yang benar.';
      case 'weak-password':
        return 'Kata sandi terlalu pendek. Silakan pilih kata sandi yang lebih kuat.';
      case 'operation-not-allowed':
        return 'Akun email/kata sandi telah dinonaktifkan dari database!.';
      case 'too-many-requests':
        return 'Terlalu banyak permintaan. Mohon ulangi beberapa saat lagi.';
      case 'invalid-credential':
        return 'Alamat email / kata sandi tidak terdaftar di database.';
      case 'wrong-password':
        return 'Kata sandi salah.';
      case 'user-not-found':
        return 'Tidak ada pengguna yang sesuai dengan alamat email yang diberikan.';
      case 'user-disabled':
        return 'Pengguna ini telah dinonaktifkan dari database!.';
      case 'invalid-verification-code':
        return 'Kode verifikasi salah. Silakan masukkan kode yang valid.';
      case 'invalid-verification-id':
        return 'ID verifikasi tidak valid. Silakan minta kode verifikasi ulang.';
      case 'quota-exceeded':
        return 'Kuota melebihi. Silakan coba lagi nanti.';
      case 'email-already-exists':
        return 'Alamat email sudah ada. Silakan gunakan email yang berbeda.';
      case 'provider-already-linked':
        return 'Akun tersebut sudah tertaut dengan penyedia lain.';
      case 'requires-recent-login':
        return 'Operasi ini sensitif dan memerlukan autentikasi terkini. Silakan masuk lagi.';
      case 'credential-already-in-use':
        return 'Kredensial ini sudah dikaitkan dengan akun penggunaan yang berbeda.';
      case 'user-mismatch':
        return 'Kredensial yang diberikan tidak sesuai dengan pengguna yang masuk sebelumnya.';
      case 'account-exists-with-different-credential':
        return 'Akun sudah ada dengan email yang sama tetapi kredensial masuknya berbeda.';
      case 'expired-action-code':
        return 'Kode tindakan telah kedaluwarsa. Silakan minta kode tindakan baru.';
      case 'invalid-action-code':
        return 'Kode tindakan tidak valid. Silakan periksa kodenya dan coba lagi.';
      case 'missing-action-code':
        return 'Kode tindakan tidak ada. Harap berikan kode tindakan yang valid.';
      case 'user-token-expired':
        return 'Token pengguna telah kedaluwarsa dan diperlukan autentikasi. Silakan masuk lagi.';
      case 'user-token-revoked':
        return 'Token pengguna telah dicabut. Silakan masuk lagi.';
      case 'invalid-message-payload':
        return 'Payload pesan verifikasi template email tidak valid.';
      case 'invalid-sender':
        return 'Pengirim template email tidak valid. Harap verifikasi email pengirim.';
      default:
        return 'Terjadi error Firebase yang tidak diketahui. Silakan coba lagi.';
    }
  }
}
