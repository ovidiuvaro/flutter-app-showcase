// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:luca/core/utils/mvp_extensions.dart';
import 'package:luca/features/auth/login/login_presentation_model.dart';
import 'package:luca/features/auth/login/login_presenter.dart';
import 'package:luca/localization/app_localizations_utils.dart';

class LoginPage extends StatefulWidget with HasPresenter<LoginPresenter> {
  const LoginPage({
    required this.presenter,
    super.key,
  });

  @override
  final LoginPresenter presenter;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with PresenterStateMixin<LoginViewModel, LoginPresenter, LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff77a1d3),
                Color(0xff79cbca),
                Color(0xffe684ae),
              ],
              stops: [
                0,
                0.5,
                1,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: appLocalizations.usernameHint,
                ),
                onChanged: (text) => presenter.onUsernameChanged(text),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: appLocalizations.passwordHint,
                ),
                onChanged: (text) => presenter.onPasswordChanged(text),
              ),
              const SizedBox(height: 16),
              stateObserver(
                builder: (context, state) => state.isLoading
                    ? const CircularProgressIndicator()
                    : Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: state.isLoginEnabled
                                  ? () => presenter.login(
                                        username: state.username,
                                        password: state.password,
                                      )
                                  : null,
                              child: Text(
                                appLocalizations.logInAction,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      );
}
