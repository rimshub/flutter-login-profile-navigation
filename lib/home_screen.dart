// Profile Screen - Task 2

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String imageName;
  final String phone;
  final String email;
  final bool biometric;
  final String address;

  const HomeScreen({
    super.key,
    required this.name,
    required this.imageName,
    required this.phone,
    required this.email,
    required this.biometric,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageName),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.phone,
                                color: Colors.amber,
                              ),
                              Text(
                                'Phone',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            phone,
                            style: const TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.email,
                                color: Colors.amber,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            email,
                            style: const TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.fingerprint,
                                color: Color.fromARGB(255, 227, 207, 146),
                              ),
                              Text(
                                'Biometric',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            biometric ? 'Yes' : 'No',
                            style: const TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Colors.amber,
                              ),
                              Text(
                                'Address',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            address,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Top Tab Navigation'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/top_tab');
                  },
                ),
                ElevatedButton(
                  child: const Text('Bottom Tab Navigation'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/bottom_tab');
                  },
                ),
              ],
            ),
          ),
        ]));
  }
}
