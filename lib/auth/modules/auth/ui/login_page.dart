import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/common_widgets/progress_view.dart';
import '../../../utils/common_widgets/validation_utils.dart';
import '../../../utils/constants/string_constants.dart';
import '../providers/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginProvider? provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider = Provider.of<LoginProvider?>(context, listen: false);
      provider?.initAllBasics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringConstants.appName)),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, _, widget) {
      return ProgressView(
        progressMsg: 'Loading',
        loading: _.loggingIn,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                buildTitle(context),
                buildForm(_, context),
              ],
            ),
          ),
        ),
      );
    });
  }

  Container buildTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'Login',
        style: Theme.of(context).textTheme.headlineSmall, // Updated for MD3
      ),
    );
  }

  Form buildForm(LoginProvider _, BuildContext context) {
    return Form(
      key: provider?.form,
      autovalidateMode: _.autoValidationMode,
      child: AutofillGroup(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            TextFormField(
              controller: provider?.email,
              focusNode: provider?.emailFocus,
              validator: (value) => ValidationUtils.validateEmail(value ?? ''),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: provider?.password,
              focusNode: provider?.pwFocus,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) =>
                  ValidationUtils.validateValue(value ?? '', StringConstants.passRequired),
              obscureText: _.obscurePass,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    _.toggleShowPassword();
                  },
                  icon: Icon(
                    Icons.vpn_key,
                    color: _.obscurePass ? Colors.grey : Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodyMedium, // Updated for MD3
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            buildLoginButton(_),
          ],
        ),
      ),
    );
  }

  TextButton buildLoginButton(LoginProvider _) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      onPressed: () {
        if (provider?.form.currentState?.validate() ?? false) {
          _.loginAction(context);
        } else {
          _.changeAutoValidation();
        }
      },
      child: const Text('Login', style: TextStyle(color: Colors.white)),
    );
  }
}
