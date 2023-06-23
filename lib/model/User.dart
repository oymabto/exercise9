class User {
  final String username;
  final String first;

  // It is an optional String variable (nullable) that represents the last name of the user.
  // The ? denotes that the variable can either be assigned a String value or null.
  final String? last;
  final String? image;

  // Constructor taking named parameters, which means I need to specify the parameter names when calling the constructor.
  // The required keyword indicates that this parameter must be provided when creating a User object.
  User({required this.username, required this.first, this.last, this.image});

  /* Named constructor called 'noUser()' to return a user object representing "no user"
       to avoid dealing with nulls (e.g., when a user is not found).
       Named constructors provide alternative ways to create objects.
   */
  User.noUser()
      : username = "",
        first = "",
        last = "",
        image = "";

  // This method checks whether the 'username' is an empty string, indicating that the user is a "no user" or null user.
  bool isNoUser() {
    return username == "";
  }

  // Named constructor
  //  It takes a Map object as a parameter, which represents a JSON object.
  // The constructor is used to create a User object by parsing the values from the provided JSON map.
  // It assigns the values to the instance variables username, first, last, and image based on the corresponding keys in the JSON map.
  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        first = json['first'],
        last = json['last'],
        image = json['image'];

  // This method 'toJson()' converts a User object into a JSON map.
  // It returns a Map object where the keys are strings representing the variable names (username, first, last, image),
  // and the values are the corresponding values of the instance variables.
  // This method is useful when you need to serialize a User object to JSON, for example, when sending data to an API.
  Map<String, dynamic> toJson() =>
      {'username': username, 'first': first, 'last': last, 'image': image};
}
