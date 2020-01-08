import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final User user = User();
  String confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context)
                            .translate('FIRSTNAME');
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.firstName = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)
                          .translate('ENTERUSERNAME'),
                      labelText:
                          AppLocalizations.of(context).translate('FIRSTNAME'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context)
                            .translate('ENTEREMAIL');
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.email = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context).translate('ENTEREMAIL'),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppLocalizations.of(context)
                            .translate('PHONENUMBER');
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.phone = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context).translate('PHONENUMBER'),
                      labelText: 'phone',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocalizations.of(context)
                              .translate('PLEASEENTERPASSWORD');
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.password = value;
                        });
                      },
                      onChanged: (text) {
                        user.password = text;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)
                            .translate('PLEASEENTERPASSWORD'),
                        labelText: 'Password',
                      ),
                      obscureText: true),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppLocalizations.of(context)
                          .translate('PLEASEENTERPASSWORDCONFIRMATION');
                    } else if (user.password != confirmPassword) {
                      return AppLocalizations.of(context)
                          .translate('PASSWORDDONOTMATCH');
                    } else if (user.password == confirmPassword) {
                      user.passwordConfirmation = confirmPassword;
                    }
                    return null;
                  },
                  onChanged: (text) {
                    confirmPassword = text;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Same Password',
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Consumer<AuthBlock>(builder:
                        (BuildContext context, AuthBlock auth, Widget child) {
                      return RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: auth.loading && auth.loadingType == 'register'
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text('Sign Up'),
                        onPressed: () {
                          if (_formKey.currentState.validate() &&
                              !auth.loading) {
                            _formKey.currentState.save();
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            auth.register(user, context: context);
                            if (auth.registered) {
                              toast(AppLocalizations.of(context)
                                  .translate('ACCOUNTCREATED'));
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/');
                            }
                          }
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toast(String message) {
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
