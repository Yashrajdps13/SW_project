import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final snap;
  const UserCard({super.key, required this.snap});

  @override
  Widget build(BuildContext context) {
    var outo = 0x000000;
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.only(top: 20),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Color(outo),
            offset: const Offset(1.5, 1),
            blurRadius: 2,
          ),
        ],
        color: const Color.fromARGB(255, 23, 30, 30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${snap['personalInfo']['fullName']}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Phone: ${snap['personalInfo']['phone']}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    snap['applicationStatus']['status'] == "Verified"
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 40,
                          )
                        : snap['applicationStatus']['status'] == "Pending"
                            ? const Icon(
                                Icons.lock_clock_outlined,
                                color: Colors.orange,
                                size: 40,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 40,
                              ),
                    const SizedBox(width: 5),
                    Text(
                      "${snap['applicationStatus']['status']}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  "Status",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
