class CreateUserEntity {
  String email;
  String password;
  String confirmPassword;

  CreateUserEntity(this.email, this.password, this.confirmPassword);

  bool checkPasswords() {
    if (password == confirmPassword) {
      return true;
    }
    return false;
  }
}
