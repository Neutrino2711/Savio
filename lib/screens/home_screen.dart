import 'package:exp_man/utilities/circular_icon_card.dart';
import 'package:flutter/material.dart';
import 'package:exp_man/utilities/graph_generator.dart';
import 'package:exp_man/widgets/transaction_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Student student = Provider.of<Student>(
    //     context); //listen ko false na dene se stl widget hote hue bhi build har baar run hoga jab jab provider value change hoga
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
              ),
              const GraphGenerator(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircularIconCard(),
                  const CircularIconCard(),
                  elongatedContainer(size),
                ],
              ),
              const TransactionTileBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded elongatedContainer(Size size) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 8, top: 8),
          height: size.width * 0.15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                offset: Offset(0, 1),
                color: Color.fromARGB(255, 194, 194, 194),
              ),
            ],
          ),
          child: const Center(
            child: Text('monthly saving'),
          ),
        ),
      ),
    );
  }
}
