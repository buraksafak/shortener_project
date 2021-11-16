import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shortly_project/state/url_shortener_state.dart';
import 'package:shortly_project/widgets/const_bottom.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final String logoAssetName = 'assets/images/logo.svg';
  final String illustrationAssetName = 'assets/images/illustration.svg';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UrlShortnerState>(context, listen: true);

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final Widget logoSvg = SvgPicture.asset(
      logoAssetName,
      height: screenHeight * 0.03,
    );

    final Widget illustrationSvg = SvgPicture.asset(
      illustrationAssetName,
      fit: BoxFit.contain,
      height: screenHeight * 0.37,
    );

    const String startedTextBold = "Let's get started!";
    const String startedText = "Paste your first link into the to shorten it";

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.06,
            ),
            logoSvg,
            SizedBox(
              height: screenHeight * 0.06,
            ),
            illustrationSvg,
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      startedTextBold,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05),
                    ),
                    Text(
                      startedText,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: screenWidth * 0.05),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: screenHeight * 0.06,
            ),
            // const bottom widgets
            constBottom(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                state: state),
          ],
        ),
      ),
    );
  }
}
