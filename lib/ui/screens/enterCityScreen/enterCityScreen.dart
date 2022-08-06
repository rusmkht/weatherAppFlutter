import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather_app/ui/navigation/main_navigation/main_navigation.dart';

class EnterCityScreen extends StatelessWidget {
  const EnterCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _MyAppBar(),
        body: const _MyBodyWidget(),
      ),
    );
  }

  AppBar _MyAppBar() => AppBar(title: const Text("Weather"), centerTitle: true);
}

class _MyBodyWidget extends StatefulWidget {
  const _MyBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_MyBodyWidget> createState() => _MyBodyWidgetState();
}

class _MyBodyWidgetState extends State<_MyBodyWidget> {
  final textEditingController = TextEditingController();
  final _cityForm = GlobalKey<FormState>();
  final _formFocus = FocusNode();

  @override
  void initState() {
    // 
    super.initState();
    _formFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //const Text("Напишите имя города"),
        Form(
          key: _cityForm,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp("[0-9]+"))
                    ],
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Введите название города',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: 'Алматы',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Заполните поле";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(onPressed: goNextPage, child: const Text("Перейти"))
      ],
    );
  }

  Function? goNextPage() {
    if (!_cityForm.currentState!.validate()) {
      return null;
    }
    Navigator.of(context).pushNamed(MainNavigationRouteNames.cityWeather,
        arguments: textEditingController.text);
    return null;
  }
}
