import 'package:flutter/material.dart';
import 'package:exp_man/widgets/blog_card.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool isLoading = true;
  List data = [];
  String Selectedvalue = 'Lucknow';
  //   Future retrieveBlogPost() async {
  //   try {
  //     final url = Uri.parse("${Base.baseUrl}/v2/posts?auth_token=$apiKey&type=$Selectedvalue");
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       var result = jsonDecode(response.body);
  //       setState(() {
  //         data = result['data'] as List;
  //         isLoading = false;
  //       });
  //       return result;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //   @override
  // void initState() {
  //   super.initState();
  //   retrieveBlogPost();
  // }

  List<String> a = ['Lucknow', 'Agartala', 'Bhubaneshwar'];

  DropdownButton<String> androidDropDown(List<String> a) {
    List<DropdownMenuItem<String>> Dropdownlist = [];
    for (String item in a) {
      var newItem = DropdownMenuItem(child: Text(item), value: item);
      Dropdownlist.add(newItem);
    }
    Dropdownlist;
    return DropdownButton<String>(
        value: Selectedvalue,
        items: Dropdownlist,
        onChanged: (value) {
          setState(() {
            Selectedvalue = value.toString();
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_left_sharp,
          ),
        ),
        title: const Text('Community Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
              child: Row(
                children: [
                  const Spacer(),
                  androidDropDown(a),
                  const Spacer(),
                  const VerticalDivider(
                    width: 5,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  const Text('ONLINE'),
                  const Spacer(),
                ],
              ),
            ),
            Stack(
              children: [
                SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(children: [
                    const SizedBox(height: 15),
                    ...List.generate(
                        data.length,
                        (index) => BlogCard(
                              image:
                                  'data:image/jpeg;base64,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',
                              title: 'jewf gi',
                              desc: 'wljdfo',
                              slug: 'lskdj',
                              author: ';dj wo ',
                              authorImg:
                                  'data:image/jpeg;base64,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',
                              //                       image: data[index]['featured_image'],
                              // title: data[index]['title'],
                              // slug: data[index]['slug'],
                              // desc: data[index]['description'],
                              // author:
                              //     "${data[index]['author']['first_name']} ${data[index]['author']['last_name']}",
                              // authorImg: data[index]['author']['profile_image'],
                            ))
                  ]),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
