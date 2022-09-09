import 'dart:async';
import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key}) : super(key: key);

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  List<String> list = [];
  StreamsSockets streamsSockets = StreamsSockets();
  TextEditingController messageController = TextEditingController();

  Stream<int> generateNumber() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now().second;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add("darling");
    streamsSockets.addResponse(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Builder Example"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: streamsSockets.getResponse,
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(snapshot.data![index].toString());
                      },
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "Something went Wrong !",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: Text(
                      "Something went Wrong !",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(hintText: "Enter message"),
                ),
              ),
              IconButton(
                  onPressed: () {
                    list.add(messageController.text.toString());
                    streamsSockets.addResponse(list);
                    messageController.clear();
                  },
                  icon: const Icon(Icons.send_outlined))
            ],
          ),
        ],
      ),
    );
  }
}

class StreamsSockets {
  final _stream = StreamController<List<String>>.broadcast();

  void Function(List<String>) get addResponse => _stream.sink.add;

  Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();
}
