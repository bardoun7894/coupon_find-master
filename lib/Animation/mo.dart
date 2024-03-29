import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


import '../appContainer.dart';
class SplashScreen extends StatefulWidget {
	@override
	_SplashScreen createState() => new _SplashScreen();
}
class _SplashScreen extends State<SplashScreen> {

	@override
	void initState() {
	 
		super.initState();
		Timer(
				Duration(seconds: 3),
						()=> {
					Navigator.push(
						context,
						MaterialPageRoute(builder: (context) => NewApp()),
					)
				}
		);
	}

	@override
	Widget build(BuildContext context) {
	 
		return Scaffold(
				body: Stack(
					fit: StackFit.expand,
					children: <Widget>[
						Container(
							decoration: BoxDecoration(color: Colors.red
							,gradient: LinearGradient(
										colors: [new Color(0xff6094e8),new Color(0xffde5cbc)]
												,begin: Alignment.centerRight
											,end: Alignment.centerLeft
									)),
						),
						Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
							Expanded(
								flex: 2,
								child: Container(
										child: Column(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												CircleAvatar(
													backgroundColor: Colors.white,
													radius: 50.0,
													child: Icon(
														Icons.confirmation_number,
														color: Color.fromRGBO( 255, 121, 121 ,1),
														size: 50.0,
													),
												),
												Padding(
													padding: EdgeInsets.only(top:10.0),
												),
											],
										)
								),
							),
							Expanded(
								flex: 1,
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>[
										CircularProgressIndicator(),
										Padding(
											padding: EdgeInsets.only(top:20.0),

										),
										Text(
											"Loading ...",
											style: TextStyle(
													color: Colors.white,
													fontSize: 18.0,
													fontWeight: FontWeight.bold),
										)
									],
								),
							)
						])
					],
				));
	}
}