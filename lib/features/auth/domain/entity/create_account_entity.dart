class CreateAccountEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  CreateAccountEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
  @override
  String toString() { 
    return 'CreateAccountEntity(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }
}