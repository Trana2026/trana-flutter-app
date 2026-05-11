enum UserRole { seller, buyer }

extension UserRoleMeta on UserRole {
  String get label => switch (this) {
        UserRole.seller => "판매",
        UserRole.buyer => "구매",
      };
}
