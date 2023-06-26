import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({required this.data});
  final Map<String, dynamic> data;

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List comments = [
    {
      "student": "Ravi Maurya",
      "comment":
          "Dear friend, Thank you for offering to sell me an electric kettle. I appreciate your thoughtfulness and the opportunity to buy from you. Unfortunately, I won’t be able to buy the kettle from you at this time. The reason is that I already have a kettle that is still working well and I don’t need a new one right now. I hope you understand my situation and that this doesn’t affect our friendship. Thank you again for thinking of me and offering to sell me the kettle. Best regards, Ravi Maurya",
      "upvotes": 0,
      "date": "2023-06-25",
      "post": 2,
      "liked": false
    },
    {
      "student": "Akshaj Pal",
      "comment":
          "Dear friend, Thank you for offering to sell me an electric kettle. I am thrilled to hear about this opportunity and would love to buy it from you. I have been looking for a new kettle for some time now and your offer couldn’t have come at a better time. I trust your judgment and know that the kettle you’re selling must be of good quality. Please let me know the details of the kettle and how I can make the payment. I am looking forward to using my new electric kettle and am grateful to you for offering to sell it to me. Best regards, Akshaj Pal",
      "upvotes": 0,
      "date": "2023-06-25",
      "post": 2,
      "liked": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(widget.data['date']);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputDate = DateFormat('MM/dd/yyyy').format(inputDate);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Blog'),
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints.tightForFinite(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(widget.data['title'],
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 10),
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                          radius: 20,
                        ),
                        title: Text("${widget.data['student']}",
                            style: const TextStyle(
                                // color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(outputDate,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                            ))),
                    if ((widget.data['image_url'] as String).isNotEmpty)
                      Image(
                        image: NetworkImage(widget.data['image_url']),
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 10),
                    Text(
                      '${widget.data['content']}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.black38,
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    bool tap = false;

                    return ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 400, minHeight: 100),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                    child: Icon(Icons.person), radius: 30),
                                Text('${comments[index]['student']}'),
                                Spacer(),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (tap == false) {
                                          setState(() {
                                            comments[index]['upvotes']++;
                                            tap = true;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        tap
                                            ? Icons.thumb_up
                                            : Icons.thumb_up_alt_outlined,
                                        size: 10.0,
                                      ),
                                    ),
                                    Text('${comments[index]['upvotes']}')
                                  ],
                                )
                              ],
                            ),
                          ),
                          Text(
                            '${comments[index]['comment']}',
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: comments.length,
                ),
              )
            ],
          ),
        )));
  }
}
