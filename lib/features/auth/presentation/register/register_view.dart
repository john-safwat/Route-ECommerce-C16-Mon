import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_contract.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/widgets/auth_textfield.dart';

import '../../../../network/resources.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  RegisterCubit cubit = getIt();

  @override
  void initState() {
    super.initState();
    cubit.navigation.listen((navigationState) {
      switch (navigationState) {
        case ShowRegisterErrorToast():
          {
            CherryToast.error(
              title: Text(
                navigationState.errorMessage,
                style: const TextStyle(color: Colors.black),
              ),
            ).show(context);
          }
        case NavigateToLogin():{
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(AppImages.logo),
                    const SizedBox(height: 24),

                    AuthTextField(
                      title: "Name",
                      hintText: "Name",
                      validator: Validation.validateName,
                      controller: nameController,
                    ),
                    const SizedBox(height: 8),

                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourMail,
                      hintText: AppLocalizations.of(context)!.mail,
                      validator: Validation.validateEmail,
                      controller: emailController,
                    ),
                    const SizedBox(height: 8),

                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourPassword,
                      hintText: AppLocalizations.of(context)!.password,
                      validator: Validation.validatePassword,
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 8),

                    AuthTextField(
                      title: "Confirm Password",
                      hintText: "Confirm Password",
                      validator: (value) {
                        return Validation.validatePasswordConfirmation(
                          passwordController.text,
                          passwordConfirmationController.text,
                        );
                      },
                      obscureText: true,
                      controller: passwordConfirmationController,
                    ),

                    const SizedBox(height: 24),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder:
                          (context, state) => ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.doAction(
                                  RegisterUserAction(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    passwordConfirmationController.text,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                            ),
                            child:
                                state.loginResources.status == Status.loading
                                    ? const CircularProgressIndicator()
                                    : Text(
                                      AppLocalizations.of(context)!.signIn,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: AppColors.darkBlue),
                                    ),
                          ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have Account",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            // todo navigate to login
                          },
                          child: Text(
                            " Login",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
