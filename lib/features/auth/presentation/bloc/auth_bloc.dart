
import 'dart:async';

import 'package:asro/core/service/sharedPrefereces/pref_keys.dart';
import 'package:asro/core/service/sharedPrefereces/shared_pref.dart';
import 'package:asro/features/auth/data/models/login_request_body.dart';
import 'package:asro/features/auth/data/repos/auth_repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }

    final AuthRepos _repo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await result.when(
      success: (loginData) async {
        // user token
        final token = loginData.data.login.accessToken ?? '';
        // save token in shared preferences
        await SharedPref().setString(PrefKeys.accessToken, token);
        // get user role
        final user = await _repo.userRole(token);
        await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
        await SharedPref().setString(PrefKeys.userRole, user.userRole ?? '');
       // await _repo.addUserIdFirebase(userId: user.userId.toString());
        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
