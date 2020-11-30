import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/screens/login/components/login_screen.dart';
import 'package:test/test.dart';

void main() {
  test(
    "Login",
    () async {
      //give
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      var auth = AuthenticationService(FirebaseAuth.instance);
      expect(
        await auth
            .signIn(
          email: "joselipa123ochoa123@gmail.com",
          password: "123456",
        )
            .then(
          (value) {
            if (value == true) {
              return value;
            }
          },
        ),
        true,
      );
    },
  );
  test(
    "Login Incorrect",
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      var auth = AuthenticationService(FirebaseAuth.instance);
      print(
        await auth
            .signIn(
          email: "joselipa123ochoa123@gmail.com",
          password: "1234567",
        )
            .then(
          (value) {
            if (value == true) {
              return value;
            } else {
              return value;
            }
          },
        ).catchError(
          (error) {
            return false;
          },
        ),
      );
      expect(
        await auth
            .signIn(
          email: "joselipa123ochoa123@gmail.com",
          password: "1234567",
        )
            .then(
          (value) {
            if (value == true) {
              return value;
            } else {
              return value;
            }
          },
        ).then(
          (value) {
            if (value == true) {
              return value;
            } else {
              return value;
            }
          },
        ).catchError(
          (error) {
            return false;
          },
        ),
        false,
      );
    },
  );
  test(
    "Logout",
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      var auth = AuthenticationService(FirebaseAuth.instance);
      await auth
          .signIn(
        email: "joselipa123ochoa123@gmail.com",
        password: "123456",
      )
          .then(
        (value) {
          if (value == true) {
            return value;
          } else {
            return value;
          }
        },
      ).catchError(
        (error) {
          return false;
        },
      );
      expect(
        await auth.signOut().then(
          (value) {
            return value;
          },
        ),
        true,
      );
    },
  );
  test(
    "InformacionTrabajador",
    () {
      final trabajador = new TrabajadorModel();
      expect(trabajador, isNotNull);
    },
  );
}

Future<void> asd() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
