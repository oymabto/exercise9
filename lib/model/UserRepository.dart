import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'User.dart';

/// Repository (i.e. Model) that provides access to a Firestore
///    database.  Change actions will notify listeners via the associated provider.

// The ChangeNotifier class is a foundation class for implementing the "ChangeNotifier" design pattern
// , which allows objects to notify listeners when their internal state changes.
// We want to be able to provide our repository to the widget tree and have all widgets that use the provider be notified when the data changes (as appropriate).
// The UserRepository class serves as a repository or model that provides access to a Firestore database
// It has an instance variable db that will be used to interact with the Firestore database.
class UserRepository extends ChangeNotifier {
  var db;

  /* Initialize the firestore database and remember that db value */

  // This is the constructor for the UserRepository class.
  // It initializes the db instance variable by assigning it the value of 'FirebaseFirestore.instance'.
  // It ensures that the db variable refers to an instance of the Firestore database.
  UserRepository() {
    db = FirebaseFirestore.instance;
  }

  /// Reads all users from the database and returns a list of User.
  ///   Return value is a future:  Future<List<User>>

  // This method getAllUsers() returns a Future that resolves to a list of User objects.
  // It retrieves all the documents from the "users" collection in the Firestore database.
  // For each document, it creates a User object by parsing the data using User.fromJson()
  // , and adds it to the users list. Finally, it returns the populated list of users.
  Future<List<User>> getAllUsers() async {
    var results = await db.collection("users").get();
    List<User> users = [];
    for (var doc in results.docs) {
      var user = User.fromJson(doc.data());
      users.add(user);
    }

    return users;
  }

  // This method 'getFixedUser()' returns a Future that resolves to a User object.
  // It calls the getUser() method with a fixed username value of "alove" and returns the result
  Future<User> getFixedUser() {
    return getUser(username:"oyma");
  }

  /// Get the user with the given username (which will be unique)

  // This method 'getUser()' retrieves a user document from the Firestore database based on the provided username.
  // It returns a Future that resolves to a User object.
  // It uses 'await' to fetch the document using db.collection("users").doc(username).get().
  // If the document exists (data is not null), it creates a User object by parsing the data using User.fromJson() and returns it.
  // If the document doesn't exist, it prints a message and returns a "no user" object using User.noUser().
  Future<User> getUser({required String username}) async {
    var existing = await db.collection("users").doc(username).get();
    var data = await existing.data();
    if (data == null) {
      print("User $username not found");
      return User.noUser();
    } else {
      var user = User.fromJson(data);
      return user;
    }
  }

  // This method addFixedUser() adds a user to the Firestore database with fixed values.
  // It calls the addUser() method with fixed values for username, first, last, and image.
  void addFixedUser() {
    addUser(username: "alove", first: "Ada", last: "Lovelace", image: null);
  }

  /// Create a new user with the given username (which will be unique)
  ///    and the given first name (required), last name and image url.

  // This method addUser() adds a new user to the Firestore database.
  // It takes username and first as required parameters, and last and image as optional parameters.
  // It first checks if the username already exists in the database.
  // If not, it creates a User object with the provided values and adds a new document to the "users" collection with the username as the document ID
  // using db.collection("users").doc(username).set(user.toJson()).
  // It also notifies listeners of the change using notifyListeners().
  // If the username already exists, it prints a message indicating that a duplicate user is not added.
  void addUser({required String username, required String first,
    String? last, String? image}) async {
    // First check to see if the username already exists
    var existing = await db.collection("users").doc(username).get();
    if (existing.data() == null) {
      final user = User(username: username,
          first: first,
          last: last,
          image: image);

      // Add a new document with the given username
      db.collection("users").doc(username).set(user.toJson());
      notifyListeners();
      print("New user $username added");
    } else {
      print("Duplicate user $username - not added");
    }
  }

  // This method updateFirstNameFixed() updates the first name of a user with a fixed username value of "alove".
  // It calls the updateFirstName() method with the fixed values.
  updateFirstNameFixed() {
    updateFirstName(username: "oyma", first: "Jenni");
  }

  /// Update the user matching the given username with the given first name

  // This method updateFirstName() updates the first name of a user with the provided username.
  // It fetches the user document using db.collection("users").doc(username) and attempts to update the "first" field to
  // the provided first value using user.update({"first": first}).
  // The update method is a Firestore method that allows updating specific fields within a document.
  // If the update is successful, it prints a success message and notifies listeners.
  // If an error occurs, it prints an error message.
  void updateFirstName(
      {required String username, required String first}) async {
    var user = await db.collection("users").doc(username);
    try {
      await user.update({"first": first});
      print("user $username successfully updated");
      notifyListeners();
    } catch (e) {
      print("Error updating user $username: $e");
    }
  }

  // This method deleteFixedUser() deletes a user with a fixed username value of "alove".
  // It calls the deleteUser() method with the fixed value.
  void deleteFixedUser() {
    deleteUser(username: "Al");
  }

  /// Delete the user that matches the given username
  //This method deleteUser() deletes a user from the Firestore database based on the provided username.
  // It fetches the user document using db.collection("users").doc(username) and checks if the document exists.
  // If it doesn't exist, it prints a message indicating that the user was not found.
  // If the document exists, it attempts to delete the document using user.delete().
  // If the deletion is successful, it prints a success message and notifies listeners.
  // If an error occurs, it prints an error message.
  void deleteUser({required String username}) async {
    var user = await db.collection("users").doc(username);
    var doc = await user.get();
    if (doc.data() == null) {
      print("Unable to delete user $username - not found");
    } else {
      try {
        await user.delete();
        print("user $username successfully deleted");
        notifyListeners();
      } catch (e) {
        print("Error deleting user $username: $e");
      }
    }
  }
}