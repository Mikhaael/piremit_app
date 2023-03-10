import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

final userRepository = StateNotifierProvider<UserRepository, User?>((ref) {
  return UserRepository(FirebaseAuth.instance.currentUser);
});

  class UserRepository extends StateNotifier<User?> {
    UserRepository(super.state);

    final _google = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
    );
    final _facebook = FacebookAuth.instance;
    final _auth = FirebaseAuth.instance;

    bool get authenticated {
      return _auth.currentUser != null;
    }

    Future<String?> register(
        String name,
        String email,
        String password,
        ) async {
      try {
        final result = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
        );
        if (result.user != null) {
          await result.user?.updateDisplayName(name);
          state = result.user;
          return null;
        }
        return 'An error occurred when creating your account';
      } on FirebaseAuthException catch (e) {
        return e.message ?? 'An error occurred when creating your account';
      } catch (e) {
        return e.toString();
      }
    }

    Future<String?> login(String email, String password) async {
      try {
        final result = await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
        );
        if (result.user != null) {
          state = result.user;
          return null;
        }
        return 'An error occurred when logging to your account';
      } on FirebaseAuthException catch (e) {
        return e.message ?? 'An error occurred when logging into your account';
      } catch (e) {
        return e.toString();
      }
    }

    Future<String?> signInWithGoogle() async {
      final account = await _google.signIn();

      if (account == null) {
        return 'An error occurred while creating your account';
      }

      final auth = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      try {
        final result = await _auth.signInWithCredential(credential);
        if (result.user != null && result.user?.isAnonymous == false) {
          state = result.user;
          return null;
        }
        return 'An error occurred while creating your account';
      } on FirebaseAuthException catch (e) {
        print(e.message);
        return e.message ?? 'An error occurred while creating your account';
      } catch (e) {
        return e.toString();
      }
    }

    Future<String?> signInWithFacebook() async {
      final account = await _facebook.login(
        permissions: ['email', 'public_profile'],
        loginBehavior: LoginBehavior.nativeWithFallback,
      );

      if (account.accessToken?.token == null) {
        return 'An error occurred when creating your account';
      }

      final credential =
      FacebookAuthProvider.credential(account.accessToken!.token);
      try {
        final result = await _auth.signInWithCredential(credential);
        if (result.user != null && result.user?.isAnonymous == false) {
          state = result.user;
          return null;
        }
        return 'An error occurred while creating your account';
      } on FirebaseAuthException catch (e) {
        return e.message ?? 'An error occurred while creating your account';
      } catch (e) {
        return e.toString();
      }
    }

    Future<void> logout() async {
      await _auth.signOut();
      state = null;
    }
  }