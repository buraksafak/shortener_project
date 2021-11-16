import 'package:flutter/material.dart';
import 'package:shortly_project/screens/link_list.dart';
import 'package:shortly_project/state/url_shortener_state.dart';

//Container, Textformfield and Elevatedbutton in bottom.
// ignore: camel_case_types
class constBottom extends StatelessWidget {
  const constBottom({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.state,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final UrlShortnerState state;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: screenWidth,
      height: screenHeight * 0.3,
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.3,
            color: Colors.deepPurple.shade700,
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.1),
            child: Column(
              children: [
                TextFormField(
                  controller: state.urlController,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Please add a link here";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(color: Colors.transparent)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Shorten a link here..',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  // color: Colors.white10,
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      state.handleGetLinkButton();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LinkList()),
                      );
                    },
                    child: const Text(
                      'SHORTEN IT!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
