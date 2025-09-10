void main() {
  String username = 'budi123';
  String password = 'pass123';
  int umur = 17;

  // Validasi username dan password
  bool isUsernameValid = username.length >= 6;
  bool isPasswordValid = password.length >= 6;

  // Validasi umur
  bool isAdult = umur >= 18;

  // Logika izin
  bool canRegister = isUsernameValid && isPasswordValid;
  bool canAccessAdultContent = canRegister && isAdult;

  // Output
  print('Dapat mendaftar: $canRegister');
  print('Dapat mengakses konten dewasa: $canAccessAdultContent');
}
