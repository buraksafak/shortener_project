import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly_project/state/url_shortener_state.dart';

//link list will be here.
class LinkList extends StatefulWidget {
  const LinkList({Key? key}) : super(key: key);

  @override
  _LinkListState createState() => _LinkListState();
}

class _LinkListState extends State<LinkList> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final state = Provider.of<UrlShortnerState>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.08,
            ),
            const Text(
              "Your Link History",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.08),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                width: screenWidth,
                height: screenHeight * 0.28,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OriginalUrlTextWidget(state: state),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ShortUrlTextWidget(state: state),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CopyButtonWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Copy elevated button
class CopyButtonWidget extends StatelessWidget {
  const CopyButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.cyan)),
      child: const Text('COPY'),
      onPressed: () {
        //Copy code will be here.
      },
    );
  }
}

class ShortUrlTextWidget extends StatelessWidget {
  const ShortUrlTextWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UrlShortnerState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.shortUrlMessage,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.cyan,
      ),
    );
  }
}

class OriginalUrlTextWidget extends StatelessWidget {
  const OriginalUrlTextWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final UrlShortnerState state;

  @override
  Widget build(BuildContext context) {
    return Text(
      state.urlController.text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
