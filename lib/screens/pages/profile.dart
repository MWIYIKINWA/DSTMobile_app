import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dstmobileapp/models/dstprofile.dart';
import 'package:dstmobileapp/utils/sharedprefs.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<DstProfile?>(
        future: _fetchUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No user data found."));
          } else {
            final DstProfile userProfile = snapshot.data!;
            return _buildProfileContent(userProfile);
          }
        },
      ),
    );
  }

  // Fetch user profile from SharedPrefs
  Future<DstProfile?> _fetchUserProfile() async {
    final SharedPrefs sharedPrefs = SharedPrefs();
    final String? userJson = await sharedPrefs.getUser();

    if (userJson != null) {
      final Map<String, dynamic> userMap = jsonDecode(userJson);
      return DstProfile.fromJson(userMap);
    }
    return null;
  }

  // Build the profile content
  Widget _buildProfileContent(DstProfile userProfile) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(
              userName: userProfile.dstName ?? "No Name",
              userEmail: userProfile.dstEmail ?? "No Email",
            ),
            const SizedBox(height: 24), // Spacing

            // User Details
            _buildUserDetails(
              userPhone: userProfile.dstPhone ?? "No Phone",
              userLocation: userProfile.auuid ??
                  "No auuid", // Replace with actual location if available
            ),
            const SizedBox(height: 24), // Spacing
          ],
        ),
      ),
    );
  }

  // Helper method to build the profile header
  Widget _buildProfileHeader({
    required String userName,
    required String userEmail,
  }) {
    return Column(
      children: [
        // Profile Picture
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile_picture.png'),
        ),
        const SizedBox(height: 16), // Spacing

        // User Name
        Text(
          userName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8), // Spacing

        // User Email
        Text(
          userEmail,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper method to build user details
  Widget _buildUserDetails({
    required String userPhone,
    required String userLocation,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Phone Number
            _buildDetailRow(
              icon: Icons.phone,
              label: "Phone",
              value: userPhone,
            ),
            const Divider(height: 24), // Divider

            // Location
            _buildDetailRow(
              icon: Icons.perm_identity,
              label: "AUUID",
              value: userLocation,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a detail row
  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.red,
        ),
        const SizedBox(width: 16), // Spacing
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4), // Spacing
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Helper method to build profile actions
}
