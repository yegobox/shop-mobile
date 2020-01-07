// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String firstName;
  final String email;
  final String lastName;
  final String name;
  final String gender;
  final String dateOfBirth;
  final String phone;
  final String groupName;
  final int status;
  final int groupId;
  final String avatar;
  UserData(
      {@required this.id,
      @required this.firstName,
      @required this.email,
      @required this.lastName,
      @required this.name,
      @required this.gender,
      @required this.dateOfBirth,
      @required this.phone,
      @required this.groupName,
      @required this.status,
      @required this.groupId,
      this.avatar});
  factory UserData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return UserData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      firstName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      dateOfBirth: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_of_birth']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      groupName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}group_name']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      groupId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}group_id']),
      avatar:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
    );
  }
  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      email: serializer.fromJson<String>(json['email']),
      lastName: serializer.fromJson<String>(json['lastName']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<String>(json['gender']),
      dateOfBirth: serializer.fromJson<String>(json['dateOfBirth']),
      phone: serializer.fromJson<String>(json['phone']),
      groupName: serializer.fromJson<String>(json['groupName']),
      status: serializer.fromJson<int>(json['status']),
      groupId: serializer.fromJson<int>(json['groupId']),
      avatar: serializer.fromJson<String>(json['avatar']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'email': serializer.toJson<String>(email),
      'lastName': serializer.toJson<String>(lastName),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<String>(gender),
      'dateOfBirth': serializer.toJson<String>(dateOfBirth),
      'phone': serializer.toJson<String>(phone),
      'groupName': serializer.toJson<String>(groupName),
      'status': serializer.toJson<int>(status),
      'groupId': serializer.toJson<int>(groupId),
      'avatar': serializer.toJson<String>(avatar),
    };
  }

  @override
  UserCompanion createCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      groupName: groupName == null && nullToAbsent
          ? const Value.absent()
          : Value(groupName),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
    );
  }

  UserData copyWith(
          {int id,
          String firstName,
          String email,
          String lastName,
          String name,
          String gender,
          String dateOfBirth,
          String phone,
          String groupName,
          int status,
          int groupId,
          String avatar}) =>
      UserData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        email: email ?? this.email,
        lastName: lastName ?? this.lastName,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        phone: phone ?? this.phone,
        groupName: groupName ?? this.groupName,
        status: status ?? this.status,
        groupId: groupId ?? this.groupId,
        avatar: avatar ?? this.avatar,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('email: $email, ')
          ..write('lastName: $lastName, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('phone: $phone, ')
          ..write('groupName: $groupName, ')
          ..write('status: $status, ')
          ..write('groupId: $groupId, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          firstName.hashCode,
          $mrjc(
              email.hashCode,
              $mrjc(
                  lastName.hashCode,
                  $mrjc(
                      name.hashCode,
                      $mrjc(
                          gender.hashCode,
                          $mrjc(
                              dateOfBirth.hashCode,
                              $mrjc(
                                  phone.hashCode,
                                  $mrjc(
                                      groupName.hashCode,
                                      $mrjc(
                                          status.hashCode,
                                          $mrjc(groupId.hashCode,
                                              avatar.hashCode))))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.email == this.email &&
          other.lastName == this.lastName &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.dateOfBirth == this.dateOfBirth &&
          other.phone == this.phone &&
          other.groupName == this.groupName &&
          other.status == this.status &&
          other.groupId == this.groupId &&
          other.avatar == this.avatar);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> email;
  final Value<String> lastName;
  final Value<String> name;
  final Value<String> gender;
  final Value<String> dateOfBirth;
  final Value<String> phone;
  final Value<String> groupName;
  final Value<int> status;
  final Value<int> groupId;
  final Value<String> avatar;
  const UserCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.email = const Value.absent(),
    this.lastName = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.phone = const Value.absent(),
    this.groupName = const Value.absent(),
    this.status = const Value.absent(),
    this.groupId = const Value.absent(),
    this.avatar = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    @required String firstName,
    @required String email,
    @required String lastName,
    @required String name,
    @required String gender,
    @required String dateOfBirth,
    @required String phone,
    @required String groupName,
    @required int status,
    @required int groupId,
    this.avatar = const Value.absent(),
  })  : firstName = Value(firstName),
        email = Value(email),
        lastName = Value(lastName),
        name = Value(name),
        gender = Value(gender),
        dateOfBirth = Value(dateOfBirth),
        phone = Value(phone),
        groupName = Value(groupName),
        status = Value(status),
        groupId = Value(groupId);
  UserCompanion copyWith(
      {Value<int> id,
      Value<String> firstName,
      Value<String> email,
      Value<String> lastName,
      Value<String> name,
      Value<String> gender,
      Value<String> dateOfBirth,
      Value<String> phone,
      Value<String> groupName,
      Value<int> status,
      Value<int> groupId,
      Value<String> avatar}) {
    return UserCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
      groupName: groupName ?? this.groupName,
      status: status ?? this.status,
      groupId: groupId ?? this.groupId,
      avatar: avatar ?? this.avatar,
    );
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  GeneratedTextColumn _firstName;
  @override
  GeneratedTextColumn get firstName => _firstName ??= _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn('first_name', $tableName, false,
        maxTextLength: 16);
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn('email', $tableName, false, maxTextLength: 16);
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn('last_name', $tableName, false,
        maxTextLength: 16);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 16);
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedTextColumn _gender;
  @override
  GeneratedTextColumn get gender => _gender ??= _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn('gender', $tableName, false, maxTextLength: 16);
  }

  final VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  GeneratedTextColumn _dateOfBirth;
  @override
  GeneratedTextColumn get dateOfBirth =>
      _dateOfBirth ??= _constructDateOfBirth();
  GeneratedTextColumn _constructDateOfBirth() {
    return GeneratedTextColumn('date_of_birth', $tableName, false,
        maxTextLength: 16);
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn('phone', $tableName, false, maxTextLength: 16);
  }

  final VerificationMeta _groupNameMeta = const VerificationMeta('groupName');
  GeneratedTextColumn _groupName;
  @override
  GeneratedTextColumn get groupName => _groupName ??= _constructGroupName();
  GeneratedTextColumn _constructGroupName() {
    return GeneratedTextColumn('group_name', $tableName, false,
        maxTextLength: 16);
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  GeneratedIntColumn _groupId;
  @override
  GeneratedIntColumn get groupId => _groupId ??= _constructGroupId();
  GeneratedIntColumn _constructGroupId() {
    return GeneratedIntColumn(
      'group_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  GeneratedTextColumn _avatar;
  @override
  GeneratedTextColumn get avatar => _avatar ??= _constructAvatar();
  GeneratedTextColumn _constructAvatar() {
    return GeneratedTextColumn(
      'avatar',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstName,
        email,
        lastName,
        name,
        gender,
        dateOfBirth,
        phone,
        groupName,
        status,
        groupId,
        avatar
      ];
  @override
  $UserTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user';
  @override
  final String actualTableName = 'user';
  @override
  VerificationContext validateIntegrity(UserCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.firstName.present) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableValue(d.firstName.value, _firstNameMeta));
    } else if (firstName.isRequired && isInserting) {
      context.missing(_firstNameMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.lastName.present) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableValue(d.lastName.value, _lastNameMeta));
    } else if (lastName.isRequired && isInserting) {
      context.missing(_lastNameMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.gender.present) {
      context.handle(
          _genderMeta, gender.isAcceptableValue(d.gender.value, _genderMeta));
    } else if (gender.isRequired && isInserting) {
      context.missing(_genderMeta);
    }
    if (d.dateOfBirth.present) {
      context.handle(_dateOfBirthMeta,
          dateOfBirth.isAcceptableValue(d.dateOfBirth.value, _dateOfBirthMeta));
    } else if (dateOfBirth.isRequired && isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (d.phone.present) {
      context.handle(
          _phoneMeta, phone.isAcceptableValue(d.phone.value, _phoneMeta));
    } else if (phone.isRequired && isInserting) {
      context.missing(_phoneMeta);
    }
    if (d.groupName.present) {
      context.handle(_groupNameMeta,
          groupName.isAcceptableValue(d.groupName.value, _groupNameMeta));
    } else if (groupName.isRequired && isInserting) {
      context.missing(_groupNameMeta);
    }
    if (d.status.present) {
      context.handle(
          _statusMeta, status.isAcceptableValue(d.status.value, _statusMeta));
    } else if (status.isRequired && isInserting) {
      context.missing(_statusMeta);
    }
    if (d.groupId.present) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableValue(d.groupId.value, _groupIdMeta));
    } else if (groupId.isRequired && isInserting) {
      context.missing(_groupIdMeta);
    }
    if (d.avatar.present) {
      context.handle(
          _avatarMeta, avatar.isAcceptableValue(d.avatar.value, _avatarMeta));
    } else if (avatar.isRequired && isInserting) {
      context.missing(_avatarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UserCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.firstName.present) {
      map['first_name'] = Variable<String, StringType>(d.firstName.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.lastName.present) {
      map['last_name'] = Variable<String, StringType>(d.lastName.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.gender.present) {
      map['gender'] = Variable<String, StringType>(d.gender.value);
    }
    if (d.dateOfBirth.present) {
      map['date_of_birth'] = Variable<String, StringType>(d.dateOfBirth.value);
    }
    if (d.phone.present) {
      map['phone'] = Variable<String, StringType>(d.phone.value);
    }
    if (d.groupName.present) {
      map['group_name'] = Variable<String, StringType>(d.groupName.value);
    }
    if (d.status.present) {
      map['status'] = Variable<int, IntType>(d.status.value);
    }
    if (d.groupId.present) {
      map['group_id'] = Variable<int, IntType>(d.groupId.value);
    }
    if (d.avatar.present) {
      map['avatar'] = Variable<String, StringType>(d.avatar.value);
    }
    return map;
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(_db, alias);
  }
}

class CartData extends DataClass implements Insertable<CartData> {
  final int id;
  final int refId;
  final String imageUrl;
  final String price;
  final String name;
  final int quantity;
  CartData(
      {@required this.id,
      @required this.refId,
      @required this.imageUrl,
      @required this.price,
      @required this.name,
      @required this.quantity});
  factory CartData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CartData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      refId: intType.mapFromDatabaseResponse(data['${effectivePrefix}ref_id']),
      imageUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
    );
  }
  factory CartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return CartData(
      id: serializer.fromJson<int>(json['id']),
      refId: serializer.fromJson<int>(json['refId']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      price: serializer.fromJson<String>(json['price']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'refId': serializer.toJson<int>(refId),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'price': serializer.toJson<String>(price),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  @override
  CartCompanion createCompanion(bool nullToAbsent) {
    return CartCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      refId:
          refId == null && nullToAbsent ? const Value.absent() : Value(refId),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
    );
  }

  CartData copyWith(
          {int id,
          int refId,
          String imageUrl,
          String price,
          String name,
          int quantity}) =>
      CartData(
        id: id ?? this.id,
        refId: refId ?? this.refId,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('CartData(')
          ..write('id: $id, ')
          ..write('refId: $refId, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('price: $price, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          refId.hashCode,
          $mrjc(
              imageUrl.hashCode,
              $mrjc(
                  price.hashCode, $mrjc(name.hashCode, quantity.hashCode))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is CartData &&
          other.id == this.id &&
          other.refId == this.refId &&
          other.imageUrl == this.imageUrl &&
          other.price == this.price &&
          other.name == this.name &&
          other.quantity == this.quantity);
}

class CartCompanion extends UpdateCompanion<CartData> {
  final Value<int> id;
  final Value<int> refId;
  final Value<String> imageUrl;
  final Value<String> price;
  final Value<String> name;
  final Value<int> quantity;
  const CartCompanion({
    this.id = const Value.absent(),
    this.refId = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.price = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  CartCompanion.insert({
    this.id = const Value.absent(),
    @required int refId,
    @required String imageUrl,
    @required String price,
    @required String name,
    @required int quantity,
  })  : refId = Value(refId),
        imageUrl = Value(imageUrl),
        price = Value(price),
        name = Value(name),
        quantity = Value(quantity);
  CartCompanion copyWith(
      {Value<int> id,
      Value<int> refId,
      Value<String> imageUrl,
      Value<String> price,
      Value<String> name,
      Value<int> quantity}) {
    return CartCompanion(
      id: id ?? this.id,
      refId: refId ?? this.refId,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }
}

class $CartTable extends Cart with TableInfo<$CartTable, CartData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CartTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _refIdMeta = const VerificationMeta('refId');
  GeneratedIntColumn _refId;
  @override
  GeneratedIntColumn get refId => _refId ??= _constructRefId();
  GeneratedIntColumn _constructRefId() {
    return GeneratedIntColumn(
      'ref_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  GeneratedTextColumn _imageUrl;
  @override
  GeneratedTextColumn get imageUrl => _imageUrl ??= _constructImageUrl();
  GeneratedTextColumn _constructImageUrl() {
    return GeneratedTextColumn(
      'image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedIntColumn _quantity;
  @override
  GeneratedIntColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedIntColumn _constructQuantity() {
    return GeneratedIntColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, refId, imageUrl, price, name, quantity];
  @override
  $CartTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cart';
  @override
  final String actualTableName = 'cart';
  @override
  VerificationContext validateIntegrity(CartCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.refId.present) {
      context.handle(
          _refIdMeta, refId.isAcceptableValue(d.refId.value, _refIdMeta));
    } else if (refId.isRequired && isInserting) {
      context.missing(_refIdMeta);
    }
    if (d.imageUrl.present) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableValue(d.imageUrl.value, _imageUrlMeta));
    } else if (imageUrl.isRequired && isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (d.price.present) {
      context.handle(
          _priceMeta, price.isAcceptableValue(d.price.value, _priceMeta));
    } else if (price.isRequired && isInserting) {
      context.missing(_priceMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.quantity.present) {
      context.handle(_quantityMeta,
          quantity.isAcceptableValue(d.quantity.value, _quantityMeta));
    } else if (quantity.isRequired && isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CartData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CartCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.refId.present) {
      map['ref_id'] = Variable<int, IntType>(d.refId.value);
    }
    if (d.imageUrl.present) {
      map['image_url'] = Variable<String, StringType>(d.imageUrl.value);
    }
    if (d.price.present) {
      map['price'] = Variable<String, StringType>(d.price.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.quantity.present) {
      map['quantity'] = Variable<int, IntType>(d.quantity.value);
    }
    return map;
  }

  @override
  $CartTable createAlias(String alias) {
    return $CartTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UserTable _user;
  $UserTable get user => _user ??= $UserTable(this);
  $CartTable _cart;
  $CartTable get cart => _cart ??= $CartTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as Database);
  CartDao _cartDao;
  CartDao get cartDao => _cartDao ??= CartDao(this as Database);
  @override
  List<TableInfo> get allTables => [user, cart];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$CartDaoMixin on DatabaseAccessor<Database> {
  $CartTable get cart => db.cart;
}
mixin _$UserDaoMixin on DatabaseAccessor<Database> {
  $UserTable get user => db.user;
}
