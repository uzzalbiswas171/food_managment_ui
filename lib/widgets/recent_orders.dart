import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';



class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);

  buildrecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
                height: 118,
                width: 120,
                fit: BoxFit.cover,
                image: AssetImage('${order.food!.imageUrl}')),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${order.food!.name}'),
                Text('${order.restaurant!.name}'),
                Text('${order.date}'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(50)),
            height: 50,
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Recent Order',
          style: TextStyle(fontSize: 24.0),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders!.length,
              itemBuilder: (context, index) {
                Order order = currentUser.orders![index];
                return buildrecentOrder(context, order);
              }),
        ),
      ],
    );
  }
}
