import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/providers/empresa_provider.dart';
import 'package:infowork/screens/chatroom/components/chatroom.dart';
import 'package:stripe_payment/stripe_payment.dart';

import '../../../constans.dart';

List<MensajeModel> demensajes(mensajes) {
  List<MensajeModel> mensa = new List<MensajeModel>();
  mensajes.forEach((data) {
    mensa.add(new MensajeModel(
        autor: data["autor"],
        mensaje: data["mensaje"],
        fecha: data["tiempo"],
        estado: data["status"]));
  });
  return mensa;
}

class ChatScreen extends StatelessWidget {
  final EmpresaModel empresa;
  final EmpresaProvider trabajador = new EmpresaProvider();
  final databaseReference = FirebaseDatabase.instance.reference();

  ChatScreen({
    Key key,
    this.empresa,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return empresa.plan != "gratis"
        ? Scaffold(
            body: StreamBuilder(
              stream: databaseReference
                  .child("Empresa")
                  .child(empresa.nombre)
                  .child("Trabajador")
                  .onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<TrabajadorModel> trabajadores = new List();
                  snapshot.data.snapshot.value.forEach(
                    (index, data) {
                      trabajadores.add(
                        TrabajadorModel(
                            dni: index,
                            nombre: data["nombre"],
                            apellido: data["Apellido"],
                            mensajes: data["mensajes"] != null
                                ? demensajes(data["mensajes"])
                                : null),
                      );
                    },
                  );
                  return Scaffold(
                    backgroundColor: kPrimaryColor,
                    appBar: buildAppBar(),
                    body: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: kBackgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: trabajadores.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final TrabajadorModel chat =
                                        trabajadores[index];
                                    return GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ChatRoomScreen(
                                              empresaModel: empresa,
                                              trabajadorModel: chat),
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40)),
                                                border: Border.all(
                                                  width: 2,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                  )
                                                ],
                                              ),
                                              child: CircleAvatar(
                                                radius: 35,
                                                backgroundImage: AssetImage(
                                                    'assets/images/trabajador.png'),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        chat.nombre +
                                                            " " +
                                                            chat.apellido,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      chat.mensajes != null &&
                                                              chat
                                                                      .mensajes[
                                                                          chat.mensajes.length -
                                                                              1]
                                                                      .autor !=
                                                                  empresa
                                                                      .nombre &&
                                                              chat
                                                                      .mensajes[
                                                                          chat.mensajes.length -
                                                                              1]
                                                                      .estado !=
                                                                  true
                                                          ? Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              width: 7,
                                                              height: 7,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            )
                                                          : Container(
                                                              child: null,
                                                            ),
                                                      Text(
                                                        chat.mensajes != null
                                                            ? chat
                                                                .mensajes[chat
                                                                        .mensajes
                                                                        .length -
                                                                    1]
                                                                .fecha
                                                            : "00:00",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      chat.mensajes != null
                                                          ? chat
                                                              .mensajes[chat
                                                                      .mensajes
                                                                      .length -
                                                                  1]
                                                              .mensaje
                                                          : "Envia un mensaje",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black54,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        : Payment();
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Reclamos"),
      centerTitle: true,
      toolbarHeight: 60,
    );
  }
}

class ModuloPago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("asd"),
      ),
    );
  }
}

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => new _PaymentState();
}

class _PaymentState extends State<Payment> {
  Token _paymentToken;
  PaymentMethod _paymentMethod;
  String _error;
  final String _currentSecret =
      "sk_test_51I66VVLh36qDsj0JHRhRrMM0xS4u9gmXTLe0uvxhGDxMiH6ECXmQzfvBoZ8M62j7KGJPzx9nH8HGx9THDetYYIqb00ryQVLgzh"; //set this yourself, e.g using curl
  PaymentIntentResult _paymentIntent;
  Source _source;

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: '4111111111111111',
    expMonth: 08,
    expYear: 22,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51I66VVLh36qDsj0JP1ZPofOY5UZI5xgdd2fraYEcfzBMCKXv843B6BhAuZ12LT2DPL43x33WcbVkdVq1fXTgNkb300FPUAUwZH",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  void setError(dynamic error) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(
          'Stripe Payment Demo',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _source = null;
                _paymentIntent = null;
                _paymentMethod = null;
                _paymentToken = null;
              });
            },
          )
        ],
      ),
      body: ListView(
        controller: _controller,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          RaisedButton(
            child: Text("Create Source"),
            onPressed: () {
              StripePayment.createSourceWithParams(SourceParams(
                type: 'ideal',
                amount: 2102,
                currency: 'eur',
                returnURL: 'example://stripe-redirect',
              )).then((source) {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text('Received ${source.sourceId}')));
                setState(() {
                  _source = source;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          RaisedButton(
            child: Text("Create Token with Card Form"),
            onPressed: () {
              StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
                  .then((paymentMethod) {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          RaisedButton(
            child: Text("Create Token with Card"),
            onPressed: () {
              StripePayment.createTokenWithCard(
                testCard,
              ).then((token) {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text('Received ${token.tokenId}')));
                setState(() {
                  _paymentToken = token;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          RaisedButton(
            child: Text("Create Payment Method with Card"),
            onPressed: () {
              StripePayment.createPaymentMethod(
                PaymentMethodRequest(
                  card: testCard,
                ),
              ).then((paymentMethod) {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          RaisedButton(
            child: Text("Create Payment Method with existing token"),
            onPressed: _paymentToken == null
                ? null
                : () {
                    StripePayment.createPaymentMethod(
                      PaymentMethodRequest(
                        card: CreditCard(
                          token: _paymentToken.tokenId,
                        ),
                      ),
                    ).then((paymentMethod) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Received ${paymentMethod.id}')));
                      setState(() {
                        _paymentMethod = paymentMethod;
                      });
                    }).catchError(setError);
                  },
          ),
          Divider(),
          RaisedButton(
            child: Text("Confirm Payment Intent"),
            onPressed: _paymentMethod == null || _currentSecret == null
                ? null
                : () {
                    StripePayment.confirmPaymentIntent(
                      PaymentIntent(
                        clientSecret: _currentSecret,
                        paymentMethodId: _paymentMethod.id,
                      ),
                    ).then((paymentIntent) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              'Received ${paymentIntent.paymentIntentId}')));
                      setState(() {
                        _paymentIntent = paymentIntent;
                      });
                    }).catchError(setError);
                  },
          ),
          RaisedButton(
            child: Text("Authenticate Payment Intent"),
            onPressed: _currentSecret == null
                ? null
                : () {
                    StripePayment.authenticatePaymentIntent(
                            clientSecret: _currentSecret)
                        .then((paymentIntent) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              'Received ${paymentIntent.paymentIntentId}')));
                      setState(() {
                        _paymentIntent = paymentIntent;
                      });
                    }).catchError(setError);
                  },
          ),
          Divider(),
          RaisedButton(
            child: Text("Native payment"),
            onPressed: () {
              if (Platform.isIOS) {
                _controller.jumpTo(450);
              }
              StripePayment.paymentRequestWithNativePay(
                androidPayOptions: AndroidPayPaymentRequest(
                  totalPrice: "2.40",
                  currencyCode: "EUR",
                ),
                applePayOptions: ApplePayPaymentOptions(
                  countryCode: 'DE',
                  currencyCode: 'EUR',
                  items: [
                    ApplePayItem(
                      label: 'Test',
                      amount: '27',
                    )
                  ],
                ),
              ).then((token) {
                setState(() {
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text('Received ${token.tokenId}')));
                  _paymentToken = token;
                });
              }).catchError(setError);
            },
          ),
          RaisedButton(
            child: Text("Complete Native Payment"),
            onPressed: () {
              StripePayment.completeNativePayRequest().then((_) {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text('Completed successfully')));
              }).catchError(setError);
            },
          ),
          Divider(),
          Text('Current source:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_source?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current token:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_paymentToken?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment method:'),
          Text(
            JsonEncoder.withIndent('  ')
                .convert(_paymentMethod?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment intent:'),
          Text(
            JsonEncoder.withIndent('  ')
                .convert(_paymentIntent?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current error: $_error'),
        ],
      ),
    );
  }
}
