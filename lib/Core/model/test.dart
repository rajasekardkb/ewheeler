class UserTest {
  String name;
  int age;

  UserTest(this.name, this.age);

  Map toJson() => {
    'name': name,
    'age': age,
  };
}