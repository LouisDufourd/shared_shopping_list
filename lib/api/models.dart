class LoginResponse {
  final bool loginSuccess;

  LoginResponse(this.loginSuccess);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(json['loginSuccess'] ?? false);
  }
}

class UserHomesResponse {
  final List<Home> homes;

  UserHomesResponse(this.homes);

  factory UserHomesResponse.fromJson(Map<String, dynamic> json) {
    return UserHomesResponse(
      (json['homes'] as List<dynamic>).map((homeJson) => Home.fromJson(homeJson)).toList(),
    );
  }
}

class HomeUsersResponse {
  final List<User> users;

  HomeUsersResponse(this.users);

  factory HomeUsersResponse.fromJson(Map<String, dynamic> json) {
    return HomeUsersResponse(
      (json['users'] as List<dynamic>).map((userJson) => User.fromJson(userJson)).toList(),
    );
  }
}

class ShoppingListResponse {
  final List<ShoppingListItem> shoppingList;

  ShoppingListResponse(this.shoppingList);

  factory ShoppingListResponse.fromJson(Map<String, dynamic> json) {
    return ShoppingListResponse(
      (json['shoppingList'] as List<dynamic>).map((shoppingListJson) => ShoppingListItem.fromJson(shoppingListJson)).toList(),
    );
  }
}

class Home {
  final int id;
  final String name;

  Home(this.id, this.name);

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(json['id'] ?? 0, json['name'] ?? "");
  }
}


class User {
  final int id;
  final String username;
  final String password;
  final String email;
  final LocaleDateTime createTime;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.createTime,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      createTime: LocaleDateTime.fromJson(json['createTime']),
    );
  }
}

class Product {
  int id;
  String name;

  Product({required this.id, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Unit {
  int id;
  String name;
  String compressedName;
  bool isMathematical;

  Unit({required this.id, required this.name, required this.compressedName, required this.isMathematical});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      name: json['name'],
      compressedName: json['compressedName'],
      isMathematical: json['isMathematical'],
    );
  }
}

class ShoppingListItem {
  User user;
  Home home;
  Product product;
  Unit unit;
  int quantity;
  String description;
  bool isBought;
  LocaleDateTime addedTime;

  ShoppingListItem({
    required this.user,
    required this.home,
    required this.product,
    required this.unit,
    required this.quantity,
    this.description = '',
    required this.isBought,
    required this.addedTime,
  });

  factory ShoppingListItem.fromJson(Map<String, dynamic> json) {
    return ShoppingListItem(
      user: User.fromJson(json['user']),
      home: Home.fromJson(json['home']),
      product: Product.fromJson(json['product']),
      unit: Unit.fromJson(json['unit']),
      quantity: json['quantity'],
      description: json['description'] ?? '',
      isBought: json['isBought'],
      addedTime: LocaleDateTime.fromJson(json['addedTime']),
    );
  }
}


class LocaleDateTime {
  final Date date;
  final Time time;

  LocaleDateTime({required this.date, required this.time});

  factory LocaleDateTime.fromJson(Map<String, dynamic> json) {
    return LocaleDateTime(
      date: Date.fromJson(json['date']),
      time: Time.fromJson(json['time']),
    );
  }
}

class Date {
  final int year;
  final int month;
  final int day;

  Date({required this.year, required this.month, required this.day});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      year: json['year'],
      month: json['month'],
      day: json['day'],
    );
  }
}

class Time {
  final int hour;
  final int minute;
  final int second;
  final int nano;

  Time({required this.hour, required this.minute, required this.second, required this.nano});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      hour: json['hour'],
      minute: json['minute'],
      second: json['second'],
      nano: json['nano'],
    );
  }
}