import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_hiring_dot/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form = FormGroup({
    "email": FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    "password": FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
      Validators.pattern(r"(?=.*[a-z])(?=.*[A-Z])\w+"),
    ])
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 30),
            ReactiveTextField(
              formControlName: 'email',
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
              validationMessages: (control) => {
                ValidationMessage.required: 'Email harus diisi',
                ValidationMessage.email: 'Email tidak valid'
              },
            ),
            const SizedBox(height: 10),
            ReactiveTextField(
              formControlName: 'password',
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
              obscureText: true,
              validationMessages: (control) => {
                ValidationMessage.required: 'Password harus diisi',
                ValidationMessage.minLength: 'Password min 6 karakter',
                ValidationMessage.pattern:
                    'Password harus berisi 1 huruf besar dan 1 huruf kecil'
              },
            ),
            const SizedBox(height: 10),
            ReactiveFormConsumer(
              builder: (context, form, child) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: form.valid
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        );
                        Future.delayed(const Duration(seconds: 2), () {
                          SharedPreferences.getInstance()
                              .then((prefs) => prefs.setBool('mykey', true));

                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute<void>(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ));
                        });
                      }
                    : null,
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
