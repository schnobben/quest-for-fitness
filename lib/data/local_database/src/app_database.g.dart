// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _equipmentMeta = const VerificationMeta(
    'equipment',
  );
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
    'equipment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _primaryMusclesMeta = const VerificationMeta(
    'primaryMuscles',
  );
  @override
  late final GeneratedColumn<String> primaryMuscles = GeneratedColumn<String>(
    'primary_muscles',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _movementPatternMeta = const VerificationMeta(
    'movementPattern',
  );
  @override
  late final GeneratedColumn<String> movementPattern = GeneratedColumn<String>(
    'movement_pattern',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultUnitMeta = const VerificationMeta(
    'defaultUnit',
  );
  @override
  late final GeneratedColumn<String> defaultUnit = GeneratedColumn<String>(
    'default_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('kg'),
  );
  static const VerificationMeta _isBodyweightMeta = const VerificationMeta(
    'isBodyweight',
  );
  @override
  late final GeneratedColumn<bool> isBodyweight = GeneratedColumn<bool>(
    'is_bodyweight',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bodyweight" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isUnilateralMeta = const VerificationMeta(
    'isUnilateral',
  );
  @override
  late final GeneratedColumn<bool> isUnilateral = GeneratedColumn<bool>(
    'is_unilateral',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unilateral" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    equipment,
    primaryMuscles,
    movementPattern,
    defaultUnit,
    isBodyweight,
    isUnilateral,
    isCustom,
    isArchived,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('equipment')) {
      context.handle(
        _equipmentMeta,
        equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta),
      );
    }
    if (data.containsKey('primary_muscles')) {
      context.handle(
        _primaryMusclesMeta,
        primaryMuscles.isAcceptableOrUnknown(
          data['primary_muscles']!,
          _primaryMusclesMeta,
        ),
      );
    }
    if (data.containsKey('movement_pattern')) {
      context.handle(
        _movementPatternMeta,
        movementPattern.isAcceptableOrUnknown(
          data['movement_pattern']!,
          _movementPatternMeta,
        ),
      );
    }
    if (data.containsKey('default_unit')) {
      context.handle(
        _defaultUnitMeta,
        defaultUnit.isAcceptableOrUnknown(
          data['default_unit']!,
          _defaultUnitMeta,
        ),
      );
    }
    if (data.containsKey('is_bodyweight')) {
      context.handle(
        _isBodyweightMeta,
        isBodyweight.isAcceptableOrUnknown(
          data['is_bodyweight']!,
          _isBodyweightMeta,
        ),
      );
    }
    if (data.containsKey('is_unilateral')) {
      context.handle(
        _isUnilateralMeta,
        isUnilateral.isAcceptableOrUnknown(
          data['is_unilateral']!,
          _isUnilateralMeta,
        ),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      equipment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment'],
      ),
      primaryMuscles: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_muscles'],
      ),
      movementPattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}movement_pattern'],
      ),
      defaultUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_unit'],
      )!,
      isBodyweight: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bodyweight'],
      )!,
      isUnilateral: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unilateral'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final String id;
  final String name;
  final String category;
  final String? equipment;
  final String? primaryMuscles;
  final String? movementPattern;
  final String defaultUnit;
  final bool isBodyweight;
  final bool isUnilateral;
  final bool isCustom;
  final bool isArchived;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Exercise({
    required this.id,
    required this.name,
    required this.category,
    this.equipment,
    this.primaryMuscles,
    this.movementPattern,
    required this.defaultUnit,
    required this.isBodyweight,
    required this.isUnilateral,
    required this.isCustom,
    required this.isArchived,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || equipment != null) {
      map['equipment'] = Variable<String>(equipment);
    }
    if (!nullToAbsent || primaryMuscles != null) {
      map['primary_muscles'] = Variable<String>(primaryMuscles);
    }
    if (!nullToAbsent || movementPattern != null) {
      map['movement_pattern'] = Variable<String>(movementPattern);
    }
    map['default_unit'] = Variable<String>(defaultUnit);
    map['is_bodyweight'] = Variable<bool>(isBodyweight);
    map['is_unilateral'] = Variable<bool>(isUnilateral);
    map['is_custom'] = Variable<bool>(isCustom);
    map['is_archived'] = Variable<bool>(isArchived);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      equipment: equipment == null && nullToAbsent
          ? const Value.absent()
          : Value(equipment),
      primaryMuscles: primaryMuscles == null && nullToAbsent
          ? const Value.absent()
          : Value(primaryMuscles),
      movementPattern: movementPattern == null && nullToAbsent
          ? const Value.absent()
          : Value(movementPattern),
      defaultUnit: Value(defaultUnit),
      isBodyweight: Value(isBodyweight),
      isUnilateral: Value(isUnilateral),
      isCustom: Value(isCustom),
      isArchived: Value(isArchived),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      equipment: serializer.fromJson<String?>(json['equipment']),
      primaryMuscles: serializer.fromJson<String?>(json['primaryMuscles']),
      movementPattern: serializer.fromJson<String?>(json['movementPattern']),
      defaultUnit: serializer.fromJson<String>(json['defaultUnit']),
      isBodyweight: serializer.fromJson<bool>(json['isBodyweight']),
      isUnilateral: serializer.fromJson<bool>(json['isUnilateral']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'equipment': serializer.toJson<String?>(equipment),
      'primaryMuscles': serializer.toJson<String?>(primaryMuscles),
      'movementPattern': serializer.toJson<String?>(movementPattern),
      'defaultUnit': serializer.toJson<String>(defaultUnit),
      'isBodyweight': serializer.toJson<bool>(isBodyweight),
      'isUnilateral': serializer.toJson<bool>(isUnilateral),
      'isCustom': serializer.toJson<bool>(isCustom),
      'isArchived': serializer.toJson<bool>(isArchived),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Exercise copyWith({
    String? id,
    String? name,
    String? category,
    Value<String?> equipment = const Value.absent(),
    Value<String?> primaryMuscles = const Value.absent(),
    Value<String?> movementPattern = const Value.absent(),
    String? defaultUnit,
    bool? isBodyweight,
    bool? isUnilateral,
    bool? isCustom,
    bool? isArchived,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Exercise(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    equipment: equipment.present ? equipment.value : this.equipment,
    primaryMuscles: primaryMuscles.present
        ? primaryMuscles.value
        : this.primaryMuscles,
    movementPattern: movementPattern.present
        ? movementPattern.value
        : this.movementPattern,
    defaultUnit: defaultUnit ?? this.defaultUnit,
    isBodyweight: isBodyweight ?? this.isBodyweight,
    isUnilateral: isUnilateral ?? this.isUnilateral,
    isCustom: isCustom ?? this.isCustom,
    isArchived: isArchived ?? this.isArchived,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      primaryMuscles: data.primaryMuscles.present
          ? data.primaryMuscles.value
          : this.primaryMuscles,
      movementPattern: data.movementPattern.present
          ? data.movementPattern.value
          : this.movementPattern,
      defaultUnit: data.defaultUnit.present
          ? data.defaultUnit.value
          : this.defaultUnit,
      isBodyweight: data.isBodyweight.present
          ? data.isBodyweight.value
          : this.isBodyweight,
      isUnilateral: data.isUnilateral.present
          ? data.isUnilateral.value
          : this.isUnilateral,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('equipment: $equipment, ')
          ..write('primaryMuscles: $primaryMuscles, ')
          ..write('movementPattern: $movementPattern, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('isBodyweight: $isBodyweight, ')
          ..write('isUnilateral: $isUnilateral, ')
          ..write('isCustom: $isCustom, ')
          ..write('isArchived: $isArchived, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    equipment,
    primaryMuscles,
    movementPattern,
    defaultUnit,
    isBodyweight,
    isUnilateral,
    isCustom,
    isArchived,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.equipment == this.equipment &&
          other.primaryMuscles == this.primaryMuscles &&
          other.movementPattern == this.movementPattern &&
          other.defaultUnit == this.defaultUnit &&
          other.isBodyweight == this.isBodyweight &&
          other.isUnilateral == this.isUnilateral &&
          other.isCustom == this.isCustom &&
          other.isArchived == this.isArchived &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String?> equipment;
  final Value<String?> primaryMuscles;
  final Value<String?> movementPattern;
  final Value<String> defaultUnit;
  final Value<bool> isBodyweight;
  final Value<bool> isUnilateral;
  final Value<bool> isCustom;
  final Value<bool> isArchived;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.equipment = const Value.absent(),
    this.primaryMuscles = const Value.absent(),
    this.movementPattern = const Value.absent(),
    this.defaultUnit = const Value.absent(),
    this.isBodyweight = const Value.absent(),
    this.isUnilateral = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String id,
    required String name,
    required String category,
    this.equipment = const Value.absent(),
    this.primaryMuscles = const Value.absent(),
    this.movementPattern = const Value.absent(),
    this.defaultUnit = const Value.absent(),
    this.isBodyweight = const Value.absent(),
    this.isUnilateral = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Exercise> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? equipment,
    Expression<String>? primaryMuscles,
    Expression<String>? movementPattern,
    Expression<String>? defaultUnit,
    Expression<bool>? isBodyweight,
    Expression<bool>? isUnilateral,
    Expression<bool>? isCustom,
    Expression<bool>? isArchived,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (equipment != null) 'equipment': equipment,
      if (primaryMuscles != null) 'primary_muscles': primaryMuscles,
      if (movementPattern != null) 'movement_pattern': movementPattern,
      if (defaultUnit != null) 'default_unit': defaultUnit,
      if (isBodyweight != null) 'is_bodyweight': isBodyweight,
      if (isUnilateral != null) 'is_unilateral': isUnilateral,
      if (isCustom != null) 'is_custom': isCustom,
      if (isArchived != null) 'is_archived': isArchived,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String?>? equipment,
    Value<String?>? primaryMuscles,
    Value<String?>? movementPattern,
    Value<String>? defaultUnit,
    Value<bool>? isBodyweight,
    Value<bool>? isUnilateral,
    Value<bool>? isCustom,
    Value<bool>? isArchived,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      equipment: equipment ?? this.equipment,
      primaryMuscles: primaryMuscles ?? this.primaryMuscles,
      movementPattern: movementPattern ?? this.movementPattern,
      defaultUnit: defaultUnit ?? this.defaultUnit,
      isBodyweight: isBodyweight ?? this.isBodyweight,
      isUnilateral: isUnilateral ?? this.isUnilateral,
      isCustom: isCustom ?? this.isCustom,
      isArchived: isArchived ?? this.isArchived,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (primaryMuscles.present) {
      map['primary_muscles'] = Variable<String>(primaryMuscles.value);
    }
    if (movementPattern.present) {
      map['movement_pattern'] = Variable<String>(movementPattern.value);
    }
    if (defaultUnit.present) {
      map['default_unit'] = Variable<String>(defaultUnit.value);
    }
    if (isBodyweight.present) {
      map['is_bodyweight'] = Variable<bool>(isBodyweight.value);
    }
    if (isUnilateral.present) {
      map['is_unilateral'] = Variable<bool>(isUnilateral.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('equipment: $equipment, ')
          ..write('primaryMuscles: $primaryMuscles, ')
          ..write('movementPattern: $movementPattern, ')
          ..write('defaultUnit: $defaultUnit, ')
          ..write('isBodyweight: $isBodyweight, ')
          ..write('isUnilateral: $isUnilateral, ')
          ..write('isCustom: $isCustom, ')
          ..write('isArchived: $isArchived, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CampaignsTable extends Campaigns
    with TableInfo<$CampaignsTable, Campaign> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CampaignsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSeedContentMeta = const VerificationMeta(
    'isSeedContent',
  );
  @override
  late final GeneratedColumn<bool> isSeedContent = GeneratedColumn<bool>(
    'is_seed_content',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_seed_content" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    startDate,
    endDate,
    isActive,
    isSeedContent,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'campaigns';
  @override
  VerificationContext validateIntegrity(
    Insertable<Campaign> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_seed_content')) {
      context.handle(
        _isSeedContentMeta,
        isSeedContent.isAcceptableOrUnknown(
          data['is_seed_content']!,
          _isSeedContentMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Campaign map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Campaign(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isSeedContent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_seed_content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CampaignsTable createAlias(String alias) {
    return $CampaignsTable(attachedDatabase, alias);
  }
}

class Campaign extends DataClass implements Insertable<Campaign> {
  final String id;
  final String name;
  final String? description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final bool isSeedContent;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Campaign({
    required this.id,
    required this.name,
    this.description,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.isSeedContent,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['is_active'] = Variable<bool>(isActive);
    map['is_seed_content'] = Variable<bool>(isSeedContent);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CampaignsCompanion toCompanion(bool nullToAbsent) {
    return CampaignsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isActive: Value(isActive),
      isSeedContent: Value(isSeedContent),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Campaign.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Campaign(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isSeedContent: serializer.fromJson<bool>(json['isSeedContent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'isActive': serializer.toJson<bool>(isActive),
      'isSeedContent': serializer.toJson<bool>(isSeedContent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Campaign copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
    bool? isSeedContent,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Campaign(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    isActive: isActive ?? this.isActive,
    isSeedContent: isSeedContent ?? this.isSeedContent,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Campaign copyWithCompanion(CampaignsCompanion data) {
    return Campaign(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isSeedContent: data.isSeedContent.present
          ? data.isSeedContent.value
          : this.isSeedContent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Campaign(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    startDate,
    endDate,
    isActive,
    isSeedContent,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Campaign &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isActive == this.isActive &&
          other.isSeedContent == this.isSeedContent &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CampaignsCompanion extends UpdateCompanion<Campaign> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isActive;
  final Value<bool> isSeedContent;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CampaignsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CampaignsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    this.isActive = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       startDate = Value(startDate),
       endDate = Value(endDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Campaign> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isActive,
    Expression<bool>? isSeedContent,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isActive != null) 'is_active': isActive,
      if (isSeedContent != null) 'is_seed_content': isSeedContent,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CampaignsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<bool>? isActive,
    Value<bool>? isSeedContent,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CampaignsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      isSeedContent: isSeedContent ?? this.isSeedContent,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isSeedContent.present) {
      map['is_seed_content'] = Variable<bool>(isSeedContent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CampaignsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTemplatesTable extends WorkoutTemplates
    with TableInfo<$WorkoutTemplatesTable, WorkoutTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceCampaignIdMeta = const VerificationMeta(
    'sourceCampaignId',
  );
  @override
  late final GeneratedColumn<String> sourceCampaignId = GeneratedColumn<String>(
    'source_campaign_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES campaigns (id)',
    ),
  );
  static const VerificationMeta _isSeedContentMeta = const VerificationMeta(
    'isSeedContent',
  );
  @override
  late final GeneratedColumn<bool> isSeedContent = GeneratedColumn<bool>(
    'is_seed_content',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_seed_content" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    sourceCampaignId,
    isSeedContent,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('source_campaign_id')) {
      context.handle(
        _sourceCampaignIdMeta,
        sourceCampaignId.isAcceptableOrUnknown(
          data['source_campaign_id']!,
          _sourceCampaignIdMeta,
        ),
      );
    }
    if (data.containsKey('is_seed_content')) {
      context.handle(
        _isSeedContentMeta,
        isSeedContent.isAcceptableOrUnknown(
          data['is_seed_content']!,
          _isSeedContentMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sourceCampaignId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_campaign_id'],
      ),
      isSeedContent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_seed_content'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WorkoutTemplatesTable createAlias(String alias) {
    return $WorkoutTemplatesTable(attachedDatabase, alias);
  }
}

class WorkoutTemplate extends DataClass implements Insertable<WorkoutTemplate> {
  final String id;
  final String name;
  final String? description;
  final String? sourceCampaignId;
  final bool isSeedContent;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const WorkoutTemplate({
    required this.id,
    required this.name,
    this.description,
    this.sourceCampaignId,
    required this.isSeedContent,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sourceCampaignId != null) {
      map['source_campaign_id'] = Variable<String>(sourceCampaignId);
    }
    map['is_seed_content'] = Variable<bool>(isSeedContent);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  WorkoutTemplatesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sourceCampaignId: sourceCampaignId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceCampaignId),
      isSeedContent: Value(isSeedContent),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory WorkoutTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTemplate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sourceCampaignId: serializer.fromJson<String?>(json['sourceCampaignId']),
      isSeedContent: serializer.fromJson<bool>(json['isSeedContent']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sourceCampaignId': serializer.toJson<String?>(sourceCampaignId),
      'isSeedContent': serializer.toJson<bool>(isSeedContent),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  WorkoutTemplate copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> sourceCampaignId = const Value.absent(),
    bool? isSeedContent,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => WorkoutTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    sourceCampaignId: sourceCampaignId.present
        ? sourceCampaignId.value
        : this.sourceCampaignId,
    isSeedContent: isSeedContent ?? this.isSeedContent,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  WorkoutTemplate copyWithCompanion(WorkoutTemplatesCompanion data) {
    return WorkoutTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      sourceCampaignId: data.sourceCampaignId.present
          ? data.sourceCampaignId.value
          : this.sourceCampaignId,
      isSeedContent: data.isSeedContent.present
          ? data.isSeedContent.value
          : this.isSeedContent,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceCampaignId: $sourceCampaignId, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    sourceCampaignId,
    isSeedContent,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sourceCampaignId == this.sourceCampaignId &&
          other.isSeedContent == this.isSeedContent &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WorkoutTemplatesCompanion extends UpdateCompanion<WorkoutTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> sourceCampaignId;
  final Value<bool> isSeedContent;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const WorkoutTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sourceCampaignId = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutTemplatesCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.sourceCampaignId = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<WorkoutTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sourceCampaignId,
    Expression<bool>? isSeedContent,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sourceCampaignId != null) 'source_campaign_id': sourceCampaignId,
      if (isSeedContent != null) 'is_seed_content': isSeedContent,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? sourceCampaignId,
    Value<bool>? isSeedContent,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return WorkoutTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sourceCampaignId: sourceCampaignId ?? this.sourceCampaignId,
      isSeedContent: isSeedContent ?? this.isSeedContent,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sourceCampaignId.present) {
      map['source_campaign_id'] = Variable<String>(sourceCampaignId.value);
    }
    if (isSeedContent.present) {
      map['is_seed_content'] = Variable<bool>(isSeedContent.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceCampaignId: $sourceCampaignId, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTemplateExercisesTable extends WorkoutTemplateExercises
    with TableInfo<$WorkoutTemplateExercisesTable, WorkoutTemplateExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTemplateExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workoutTemplateIdMeta = const VerificationMeta(
    'workoutTemplateId',
  );
  @override
  late final GeneratedColumn<String> workoutTemplateId =
      GeneratedColumn<String>(
        'workout_template_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workout_templates (id)',
        ),
      );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetSetsMeta = const VerificationMeta(
    'targetSets',
  );
  @override
  late final GeneratedColumn<int> targetSets = GeneratedColumn<int>(
    'target_sets',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetRepsMeta = const VerificationMeta(
    'targetReps',
  );
  @override
  late final GeneratedColumn<String> targetReps = GeneratedColumn<String>(
    'target_reps',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetWeightMeta = const VerificationMeta(
    'targetWeight',
  );
  @override
  late final GeneratedColumn<double> targetWeight = GeneratedColumn<double>(
    'target_weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetRpeMeta = const VerificationMeta(
    'targetRpe',
  );
  @override
  late final GeneratedColumn<double> targetRpe = GeneratedColumn<double>(
    'target_rpe',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restGuidanceMeta = const VerificationMeta(
    'restGuidance',
  );
  @override
  late final GeneratedColumn<String> restGuidance = GeneratedColumn<String>(
    'rest_guidance',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workoutTemplateId,
    exerciseId,
    sortOrder,
    targetSets,
    targetReps,
    targetWeight,
    targetRpe,
    restGuidance,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_template_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTemplateExercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workout_template_id')) {
      context.handle(
        _workoutTemplateIdMeta,
        workoutTemplateId.isAcceptableOrUnknown(
          data['workout_template_id']!,
          _workoutTemplateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutTemplateIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('target_sets')) {
      context.handle(
        _targetSetsMeta,
        targetSets.isAcceptableOrUnknown(data['target_sets']!, _targetSetsMeta),
      );
    }
    if (data.containsKey('target_reps')) {
      context.handle(
        _targetRepsMeta,
        targetReps.isAcceptableOrUnknown(data['target_reps']!, _targetRepsMeta),
      );
    }
    if (data.containsKey('target_weight')) {
      context.handle(
        _targetWeightMeta,
        targetWeight.isAcceptableOrUnknown(
          data['target_weight']!,
          _targetWeightMeta,
        ),
      );
    }
    if (data.containsKey('target_rpe')) {
      context.handle(
        _targetRpeMeta,
        targetRpe.isAcceptableOrUnknown(data['target_rpe']!, _targetRpeMeta),
      );
    }
    if (data.containsKey('rest_guidance')) {
      context.handle(
        _restGuidanceMeta,
        restGuidance.isAcceptableOrUnknown(
          data['rest_guidance']!,
          _restGuidanceMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTemplateExercise map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTemplateExercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      workoutTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_template_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      targetSets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_sets'],
      ),
      targetReps: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_reps'],
      ),
      targetWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_weight'],
      ),
      targetRpe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_rpe'],
      ),
      restGuidance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rest_guidance'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $WorkoutTemplateExercisesTable createAlias(String alias) {
    return $WorkoutTemplateExercisesTable(attachedDatabase, alias);
  }
}

class WorkoutTemplateExercise extends DataClass
    implements Insertable<WorkoutTemplateExercise> {
  final String id;
  final String workoutTemplateId;
  final String exerciseId;
  final int sortOrder;
  final int? targetSets;
  final String? targetReps;
  final double? targetWeight;
  final double? targetRpe;
  final String? restGuidance;
  final String? notes;
  const WorkoutTemplateExercise({
    required this.id,
    required this.workoutTemplateId,
    required this.exerciseId,
    required this.sortOrder,
    this.targetSets,
    this.targetReps,
    this.targetWeight,
    this.targetRpe,
    this.restGuidance,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workout_template_id'] = Variable<String>(workoutTemplateId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || targetSets != null) {
      map['target_sets'] = Variable<int>(targetSets);
    }
    if (!nullToAbsent || targetReps != null) {
      map['target_reps'] = Variable<String>(targetReps);
    }
    if (!nullToAbsent || targetWeight != null) {
      map['target_weight'] = Variable<double>(targetWeight);
    }
    if (!nullToAbsent || targetRpe != null) {
      map['target_rpe'] = Variable<double>(targetRpe);
    }
    if (!nullToAbsent || restGuidance != null) {
      map['rest_guidance'] = Variable<String>(restGuidance);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  WorkoutTemplateExercisesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTemplateExercisesCompanion(
      id: Value(id),
      workoutTemplateId: Value(workoutTemplateId),
      exerciseId: Value(exerciseId),
      sortOrder: Value(sortOrder),
      targetSets: targetSets == null && nullToAbsent
          ? const Value.absent()
          : Value(targetSets),
      targetReps: targetReps == null && nullToAbsent
          ? const Value.absent()
          : Value(targetReps),
      targetWeight: targetWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(targetWeight),
      targetRpe: targetRpe == null && nullToAbsent
          ? const Value.absent()
          : Value(targetRpe),
      restGuidance: restGuidance == null && nullToAbsent
          ? const Value.absent()
          : Value(restGuidance),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory WorkoutTemplateExercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTemplateExercise(
      id: serializer.fromJson<String>(json['id']),
      workoutTemplateId: serializer.fromJson<String>(json['workoutTemplateId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      targetSets: serializer.fromJson<int?>(json['targetSets']),
      targetReps: serializer.fromJson<String?>(json['targetReps']),
      targetWeight: serializer.fromJson<double?>(json['targetWeight']),
      targetRpe: serializer.fromJson<double?>(json['targetRpe']),
      restGuidance: serializer.fromJson<String?>(json['restGuidance']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workoutTemplateId': serializer.toJson<String>(workoutTemplateId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'targetSets': serializer.toJson<int?>(targetSets),
      'targetReps': serializer.toJson<String?>(targetReps),
      'targetWeight': serializer.toJson<double?>(targetWeight),
      'targetRpe': serializer.toJson<double?>(targetRpe),
      'restGuidance': serializer.toJson<String?>(restGuidance),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  WorkoutTemplateExercise copyWith({
    String? id,
    String? workoutTemplateId,
    String? exerciseId,
    int? sortOrder,
    Value<int?> targetSets = const Value.absent(),
    Value<String?> targetReps = const Value.absent(),
    Value<double?> targetWeight = const Value.absent(),
    Value<double?> targetRpe = const Value.absent(),
    Value<String?> restGuidance = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => WorkoutTemplateExercise(
    id: id ?? this.id,
    workoutTemplateId: workoutTemplateId ?? this.workoutTemplateId,
    exerciseId: exerciseId ?? this.exerciseId,
    sortOrder: sortOrder ?? this.sortOrder,
    targetSets: targetSets.present ? targetSets.value : this.targetSets,
    targetReps: targetReps.present ? targetReps.value : this.targetReps,
    targetWeight: targetWeight.present ? targetWeight.value : this.targetWeight,
    targetRpe: targetRpe.present ? targetRpe.value : this.targetRpe,
    restGuidance: restGuidance.present ? restGuidance.value : this.restGuidance,
    notes: notes.present ? notes.value : this.notes,
  );
  WorkoutTemplateExercise copyWithCompanion(
    WorkoutTemplateExercisesCompanion data,
  ) {
    return WorkoutTemplateExercise(
      id: data.id.present ? data.id.value : this.id,
      workoutTemplateId: data.workoutTemplateId.present
          ? data.workoutTemplateId.value
          : this.workoutTemplateId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      targetSets: data.targetSets.present
          ? data.targetSets.value
          : this.targetSets,
      targetReps: data.targetReps.present
          ? data.targetReps.value
          : this.targetReps,
      targetWeight: data.targetWeight.present
          ? data.targetWeight.value
          : this.targetWeight,
      targetRpe: data.targetRpe.present ? data.targetRpe.value : this.targetRpe,
      restGuidance: data.restGuidance.present
          ? data.restGuidance.value
          : this.restGuidance,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplateExercise(')
          ..write('id: $id, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('targetSets: $targetSets, ')
          ..write('targetReps: $targetReps, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('targetRpe: $targetRpe, ')
          ..write('restGuidance: $restGuidance, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workoutTemplateId,
    exerciseId,
    sortOrder,
    targetSets,
    targetReps,
    targetWeight,
    targetRpe,
    restGuidance,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTemplateExercise &&
          other.id == this.id &&
          other.workoutTemplateId == this.workoutTemplateId &&
          other.exerciseId == this.exerciseId &&
          other.sortOrder == this.sortOrder &&
          other.targetSets == this.targetSets &&
          other.targetReps == this.targetReps &&
          other.targetWeight == this.targetWeight &&
          other.targetRpe == this.targetRpe &&
          other.restGuidance == this.restGuidance &&
          other.notes == this.notes);
}

class WorkoutTemplateExercisesCompanion
    extends UpdateCompanion<WorkoutTemplateExercise> {
  final Value<String> id;
  final Value<String> workoutTemplateId;
  final Value<String> exerciseId;
  final Value<int> sortOrder;
  final Value<int?> targetSets;
  final Value<String?> targetReps;
  final Value<double?> targetWeight;
  final Value<double?> targetRpe;
  final Value<String?> restGuidance;
  final Value<String?> notes;
  final Value<int> rowid;
  const WorkoutTemplateExercisesCompanion({
    this.id = const Value.absent(),
    this.workoutTemplateId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.targetSets = const Value.absent(),
    this.targetReps = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.targetRpe = const Value.absent(),
    this.restGuidance = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutTemplateExercisesCompanion.insert({
    required String id,
    required String workoutTemplateId,
    required String exerciseId,
    required int sortOrder,
    this.targetSets = const Value.absent(),
    this.targetReps = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.targetRpe = const Value.absent(),
    this.restGuidance = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       workoutTemplateId = Value(workoutTemplateId),
       exerciseId = Value(exerciseId),
       sortOrder = Value(sortOrder);
  static Insertable<WorkoutTemplateExercise> custom({
    Expression<String>? id,
    Expression<String>? workoutTemplateId,
    Expression<String>? exerciseId,
    Expression<int>? sortOrder,
    Expression<int>? targetSets,
    Expression<String>? targetReps,
    Expression<double>? targetWeight,
    Expression<double>? targetRpe,
    Expression<String>? restGuidance,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutTemplateId != null) 'workout_template_id': workoutTemplateId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (targetSets != null) 'target_sets': targetSets,
      if (targetReps != null) 'target_reps': targetReps,
      if (targetWeight != null) 'target_weight': targetWeight,
      if (targetRpe != null) 'target_rpe': targetRpe,
      if (restGuidance != null) 'rest_guidance': restGuidance,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutTemplateExercisesCompanion copyWith({
    Value<String>? id,
    Value<String>? workoutTemplateId,
    Value<String>? exerciseId,
    Value<int>? sortOrder,
    Value<int?>? targetSets,
    Value<String?>? targetReps,
    Value<double?>? targetWeight,
    Value<double?>? targetRpe,
    Value<String?>? restGuidance,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return WorkoutTemplateExercisesCompanion(
      id: id ?? this.id,
      workoutTemplateId: workoutTemplateId ?? this.workoutTemplateId,
      exerciseId: exerciseId ?? this.exerciseId,
      sortOrder: sortOrder ?? this.sortOrder,
      targetSets: targetSets ?? this.targetSets,
      targetReps: targetReps ?? this.targetReps,
      targetWeight: targetWeight ?? this.targetWeight,
      targetRpe: targetRpe ?? this.targetRpe,
      restGuidance: restGuidance ?? this.restGuidance,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workoutTemplateId.present) {
      map['workout_template_id'] = Variable<String>(workoutTemplateId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (targetSets.present) {
      map['target_sets'] = Variable<int>(targetSets.value);
    }
    if (targetReps.present) {
      map['target_reps'] = Variable<String>(targetReps.value);
    }
    if (targetWeight.present) {
      map['target_weight'] = Variable<double>(targetWeight.value);
    }
    if (targetRpe.present) {
      map['target_rpe'] = Variable<double>(targetRpe.value);
    }
    if (restGuidance.present) {
      map['rest_guidance'] = Variable<String>(restGuidance.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplateExercisesCompanion(')
          ..write('id: $id, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('targetSets: $targetSets, ')
          ..write('targetReps: $targetReps, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('targetRpe: $targetRpe, ')
          ..write('restGuidance: $restGuidance, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramTemplatesTable extends ProgramTemplates
    with TableInfo<$ProgramTemplatesTable, ProgramTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceCampaignIdMeta = const VerificationMeta(
    'sourceCampaignId',
  );
  @override
  late final GeneratedColumn<String> sourceCampaignId = GeneratedColumn<String>(
    'source_campaign_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES campaigns (id)',
    ),
  );
  static const VerificationMeta _isSeedContentMeta = const VerificationMeta(
    'isSeedContent',
  );
  @override
  late final GeneratedColumn<bool> isSeedContent = GeneratedColumn<bool>(
    'is_seed_content',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_seed_content" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    sourceCampaignId,
    isSeedContent,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'program_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgramTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('source_campaign_id')) {
      context.handle(
        _sourceCampaignIdMeta,
        sourceCampaignId.isAcceptableOrUnknown(
          data['source_campaign_id']!,
          _sourceCampaignIdMeta,
        ),
      );
    }
    if (data.containsKey('is_seed_content')) {
      context.handle(
        _isSeedContentMeta,
        isSeedContent.isAcceptableOrUnknown(
          data['is_seed_content']!,
          _isSeedContentMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sourceCampaignId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_campaign_id'],
      ),
      isSeedContent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_seed_content'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProgramTemplatesTable createAlias(String alias) {
    return $ProgramTemplatesTable(attachedDatabase, alias);
  }
}

class ProgramTemplate extends DataClass implements Insertable<ProgramTemplate> {
  final String id;
  final String name;
  final String? description;
  final String? sourceCampaignId;
  final bool isSeedContent;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProgramTemplate({
    required this.id,
    required this.name,
    this.description,
    this.sourceCampaignId,
    required this.isSeedContent,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sourceCampaignId != null) {
      map['source_campaign_id'] = Variable<String>(sourceCampaignId);
    }
    map['is_seed_content'] = Variable<bool>(isSeedContent);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProgramTemplatesCompanion toCompanion(bool nullToAbsent) {
    return ProgramTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sourceCampaignId: sourceCampaignId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceCampaignId),
      isSeedContent: Value(isSeedContent),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProgramTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramTemplate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sourceCampaignId: serializer.fromJson<String?>(json['sourceCampaignId']),
      isSeedContent: serializer.fromJson<bool>(json['isSeedContent']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sourceCampaignId': serializer.toJson<String?>(sourceCampaignId),
      'isSeedContent': serializer.toJson<bool>(isSeedContent),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProgramTemplate copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> sourceCampaignId = const Value.absent(),
    bool? isSeedContent,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ProgramTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    sourceCampaignId: sourceCampaignId.present
        ? sourceCampaignId.value
        : this.sourceCampaignId,
    isSeedContent: isSeedContent ?? this.isSeedContent,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ProgramTemplate copyWithCompanion(ProgramTemplatesCompanion data) {
    return ProgramTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      sourceCampaignId: data.sourceCampaignId.present
          ? data.sourceCampaignId.value
          : this.sourceCampaignId,
      isSeedContent: data.isSeedContent.present
          ? data.isSeedContent.value
          : this.isSeedContent,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceCampaignId: $sourceCampaignId, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    sourceCampaignId,
    isSeedContent,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sourceCampaignId == this.sourceCampaignId &&
          other.isSeedContent == this.isSeedContent &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProgramTemplatesCompanion extends UpdateCompanion<ProgramTemplate> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> sourceCampaignId;
  final Value<bool> isSeedContent;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProgramTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sourceCampaignId = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramTemplatesCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.sourceCampaignId = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProgramTemplate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sourceCampaignId,
    Expression<bool>? isSeedContent,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sourceCampaignId != null) 'source_campaign_id': sourceCampaignId,
      if (isSeedContent != null) 'is_seed_content': isSeedContent,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? sourceCampaignId,
    Value<bool>? isSeedContent,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProgramTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sourceCampaignId: sourceCampaignId ?? this.sourceCampaignId,
      isSeedContent: isSeedContent ?? this.isSeedContent,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sourceCampaignId.present) {
      map['source_campaign_id'] = Variable<String>(sourceCampaignId.value);
    }
    if (isSeedContent.present) {
      map['is_seed_content'] = Variable<bool>(isSeedContent.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sourceCampaignId: $sourceCampaignId, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CampaignPhasesTable extends CampaignPhases
    with TableInfo<$CampaignPhasesTable, CampaignPhase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CampaignPhasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _campaignIdMeta = const VerificationMeta(
    'campaignId',
  );
  @override
  late final GeneratedColumn<String> campaignId = GeneratedColumn<String>(
    'campaign_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES campaigns (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phaseOrderMeta = const VerificationMeta(
    'phaseOrder',
  );
  @override
  late final GeneratedColumn<int> phaseOrder = GeneratedColumn<int>(
    'phase_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    campaignId,
    name,
    phaseOrder,
    startDate,
    endDate,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'campaign_phases';
  @override
  VerificationContext validateIntegrity(
    Insertable<CampaignPhase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('campaign_id')) {
      context.handle(
        _campaignIdMeta,
        campaignId.isAcceptableOrUnknown(data['campaign_id']!, _campaignIdMeta),
      );
    } else if (isInserting) {
      context.missing(_campaignIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phase_order')) {
      context.handle(
        _phaseOrderMeta,
        phaseOrder.isAcceptableOrUnknown(data['phase_order']!, _phaseOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_phaseOrderMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CampaignPhase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CampaignPhase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      campaignId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phaseOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}phase_order'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CampaignPhasesTable createAlias(String alias) {
    return $CampaignPhasesTable(attachedDatabase, alias);
  }
}

class CampaignPhase extends DataClass implements Insertable<CampaignPhase> {
  final String id;
  final String campaignId;
  final String name;
  final int phaseOrder;
  final DateTime startDate;
  final DateTime endDate;
  final String? notes;
  const CampaignPhase({
    required this.id,
    required this.campaignId,
    required this.name,
    required this.phaseOrder,
    required this.startDate,
    required this.endDate,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['campaign_id'] = Variable<String>(campaignId);
    map['name'] = Variable<String>(name);
    map['phase_order'] = Variable<int>(phaseOrder);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CampaignPhasesCompanion toCompanion(bool nullToAbsent) {
    return CampaignPhasesCompanion(
      id: Value(id),
      campaignId: Value(campaignId),
      name: Value(name),
      phaseOrder: Value(phaseOrder),
      startDate: Value(startDate),
      endDate: Value(endDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory CampaignPhase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CampaignPhase(
      id: serializer.fromJson<String>(json['id']),
      campaignId: serializer.fromJson<String>(json['campaignId']),
      name: serializer.fromJson<String>(json['name']),
      phaseOrder: serializer.fromJson<int>(json['phaseOrder']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'campaignId': serializer.toJson<String>(campaignId),
      'name': serializer.toJson<String>(name),
      'phaseOrder': serializer.toJson<int>(phaseOrder),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  CampaignPhase copyWith({
    String? id,
    String? campaignId,
    String? name,
    int? phaseOrder,
    DateTime? startDate,
    DateTime? endDate,
    Value<String?> notes = const Value.absent(),
  }) => CampaignPhase(
    id: id ?? this.id,
    campaignId: campaignId ?? this.campaignId,
    name: name ?? this.name,
    phaseOrder: phaseOrder ?? this.phaseOrder,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    notes: notes.present ? notes.value : this.notes,
  );
  CampaignPhase copyWithCompanion(CampaignPhasesCompanion data) {
    return CampaignPhase(
      id: data.id.present ? data.id.value : this.id,
      campaignId: data.campaignId.present
          ? data.campaignId.value
          : this.campaignId,
      name: data.name.present ? data.name.value : this.name,
      phaseOrder: data.phaseOrder.present
          ? data.phaseOrder.value
          : this.phaseOrder,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CampaignPhase(')
          ..write('id: $id, ')
          ..write('campaignId: $campaignId, ')
          ..write('name: $name, ')
          ..write('phaseOrder: $phaseOrder, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, campaignId, name, phaseOrder, startDate, endDate, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CampaignPhase &&
          other.id == this.id &&
          other.campaignId == this.campaignId &&
          other.name == this.name &&
          other.phaseOrder == this.phaseOrder &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.notes == this.notes);
}

class CampaignPhasesCompanion extends UpdateCompanion<CampaignPhase> {
  final Value<String> id;
  final Value<String> campaignId;
  final Value<String> name;
  final Value<int> phaseOrder;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String?> notes;
  final Value<int> rowid;
  const CampaignPhasesCompanion({
    this.id = const Value.absent(),
    this.campaignId = const Value.absent(),
    this.name = const Value.absent(),
    this.phaseOrder = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CampaignPhasesCompanion.insert({
    required String id,
    required String campaignId,
    required String name,
    required int phaseOrder,
    required DateTime startDate,
    required DateTime endDate,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       campaignId = Value(campaignId),
       name = Value(name),
       phaseOrder = Value(phaseOrder),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<CampaignPhase> custom({
    Expression<String>? id,
    Expression<String>? campaignId,
    Expression<String>? name,
    Expression<int>? phaseOrder,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (campaignId != null) 'campaign_id': campaignId,
      if (name != null) 'name': name,
      if (phaseOrder != null) 'phase_order': phaseOrder,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CampaignPhasesCompanion copyWith({
    Value<String>? id,
    Value<String>? campaignId,
    Value<String>? name,
    Value<int>? phaseOrder,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return CampaignPhasesCompanion(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      name: name ?? this.name,
      phaseOrder: phaseOrder ?? this.phaseOrder,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phaseOrder.present) {
      map['phase_order'] = Variable<int>(phaseOrder.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CampaignPhasesCompanion(')
          ..write('id: $id, ')
          ..write('campaignId: $campaignId, ')
          ..write('name: $name, ')
          ..write('phaseOrder: $phaseOrder, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScheduledWorkoutsTable extends ScheduledWorkouts
    with TableInfo<$ScheduledWorkoutsTable, ScheduledWorkout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledWorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _campaignIdMeta = const VerificationMeta(
    'campaignId',
  );
  @override
  late final GeneratedColumn<String> campaignId = GeneratedColumn<String>(
    'campaign_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES campaigns (id)',
    ),
  );
  static const VerificationMeta _programTemplateIdMeta = const VerificationMeta(
    'programTemplateId',
  );
  @override
  late final GeneratedColumn<String> programTemplateId =
      GeneratedColumn<String>(
        'program_template_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES program_templates (id)',
        ),
      );
  static const VerificationMeta _workoutTemplateIdMeta = const VerificationMeta(
    'workoutTemplateId',
  );
  @override
  late final GeneratedColumn<String> workoutTemplateId =
      GeneratedColumn<String>(
        'workout_template_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workout_templates (id)',
        ),
      );
  static const VerificationMeta _scheduledForMeta = const VerificationMeta(
    'scheduledFor',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
    'scheduled_for',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('planned'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    campaignId,
    programTemplateId,
    workoutTemplateId,
    scheduledFor,
    status,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_workouts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduledWorkout> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('campaign_id')) {
      context.handle(
        _campaignIdMeta,
        campaignId.isAcceptableOrUnknown(data['campaign_id']!, _campaignIdMeta),
      );
    }
    if (data.containsKey('program_template_id')) {
      context.handle(
        _programTemplateIdMeta,
        programTemplateId.isAcceptableOrUnknown(
          data['program_template_id']!,
          _programTemplateIdMeta,
        ),
      );
    }
    if (data.containsKey('workout_template_id')) {
      context.handle(
        _workoutTemplateIdMeta,
        workoutTemplateId.isAcceptableOrUnknown(
          data['workout_template_id']!,
          _workoutTemplateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutTemplateIdMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
        _scheduledForMeta,
        scheduledFor.isAcceptableOrUnknown(
          data['scheduled_for']!,
          _scheduledForMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduledWorkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledWorkout(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      campaignId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_id'],
      ),
      programTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_template_id'],
      ),
      workoutTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_template_id'],
      )!,
      scheduledFor: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_for'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ScheduledWorkoutsTable createAlias(String alias) {
    return $ScheduledWorkoutsTable(attachedDatabase, alias);
  }
}

class ScheduledWorkout extends DataClass
    implements Insertable<ScheduledWorkout> {
  final String id;
  final String? campaignId;
  final String? programTemplateId;
  final String workoutTemplateId;
  final DateTime scheduledFor;
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ScheduledWorkout({
    required this.id,
    this.campaignId,
    this.programTemplateId,
    required this.workoutTemplateId,
    required this.scheduledFor,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || campaignId != null) {
      map['campaign_id'] = Variable<String>(campaignId);
    }
    if (!nullToAbsent || programTemplateId != null) {
      map['program_template_id'] = Variable<String>(programTemplateId);
    }
    map['workout_template_id'] = Variable<String>(workoutTemplateId);
    map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ScheduledWorkoutsCompanion toCompanion(bool nullToAbsent) {
    return ScheduledWorkoutsCompanion(
      id: Value(id),
      campaignId: campaignId == null && nullToAbsent
          ? const Value.absent()
          : Value(campaignId),
      programTemplateId: programTemplateId == null && nullToAbsent
          ? const Value.absent()
          : Value(programTemplateId),
      workoutTemplateId: Value(workoutTemplateId),
      scheduledFor: Value(scheduledFor),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ScheduledWorkout.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledWorkout(
      id: serializer.fromJson<String>(json['id']),
      campaignId: serializer.fromJson<String?>(json['campaignId']),
      programTemplateId: serializer.fromJson<String?>(
        json['programTemplateId'],
      ),
      workoutTemplateId: serializer.fromJson<String>(json['workoutTemplateId']),
      scheduledFor: serializer.fromJson<DateTime>(json['scheduledFor']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'campaignId': serializer.toJson<String?>(campaignId),
      'programTemplateId': serializer.toJson<String?>(programTemplateId),
      'workoutTemplateId': serializer.toJson<String>(workoutTemplateId),
      'scheduledFor': serializer.toJson<DateTime>(scheduledFor),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ScheduledWorkout copyWith({
    String? id,
    Value<String?> campaignId = const Value.absent(),
    Value<String?> programTemplateId = const Value.absent(),
    String? workoutTemplateId,
    DateTime? scheduledFor,
    String? status,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ScheduledWorkout(
    id: id ?? this.id,
    campaignId: campaignId.present ? campaignId.value : this.campaignId,
    programTemplateId: programTemplateId.present
        ? programTemplateId.value
        : this.programTemplateId,
    workoutTemplateId: workoutTemplateId ?? this.workoutTemplateId,
    scheduledFor: scheduledFor ?? this.scheduledFor,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ScheduledWorkout copyWithCompanion(ScheduledWorkoutsCompanion data) {
    return ScheduledWorkout(
      id: data.id.present ? data.id.value : this.id,
      campaignId: data.campaignId.present
          ? data.campaignId.value
          : this.campaignId,
      programTemplateId: data.programTemplateId.present
          ? data.programTemplateId.value
          : this.programTemplateId,
      workoutTemplateId: data.workoutTemplateId.present
          ? data.workoutTemplateId.value
          : this.workoutTemplateId,
      scheduledFor: data.scheduledFor.present
          ? data.scheduledFor.value
          : this.scheduledFor,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledWorkout(')
          ..write('id: $id, ')
          ..write('campaignId: $campaignId, ')
          ..write('programTemplateId: $programTemplateId, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    campaignId,
    programTemplateId,
    workoutTemplateId,
    scheduledFor,
    status,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledWorkout &&
          other.id == this.id &&
          other.campaignId == this.campaignId &&
          other.programTemplateId == this.programTemplateId &&
          other.workoutTemplateId == this.workoutTemplateId &&
          other.scheduledFor == this.scheduledFor &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ScheduledWorkoutsCompanion extends UpdateCompanion<ScheduledWorkout> {
  final Value<String> id;
  final Value<String?> campaignId;
  final Value<String?> programTemplateId;
  final Value<String> workoutTemplateId;
  final Value<DateTime> scheduledFor;
  final Value<String> status;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ScheduledWorkoutsCompanion({
    this.id = const Value.absent(),
    this.campaignId = const Value.absent(),
    this.programTemplateId = const Value.absent(),
    this.workoutTemplateId = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScheduledWorkoutsCompanion.insert({
    required String id,
    this.campaignId = const Value.absent(),
    this.programTemplateId = const Value.absent(),
    required String workoutTemplateId,
    required DateTime scheduledFor,
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       workoutTemplateId = Value(workoutTemplateId),
       scheduledFor = Value(scheduledFor),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ScheduledWorkout> custom({
    Expression<String>? id,
    Expression<String>? campaignId,
    Expression<String>? programTemplateId,
    Expression<String>? workoutTemplateId,
    Expression<DateTime>? scheduledFor,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (campaignId != null) 'campaign_id': campaignId,
      if (programTemplateId != null) 'program_template_id': programTemplateId,
      if (workoutTemplateId != null) 'workout_template_id': workoutTemplateId,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScheduledWorkoutsCompanion copyWith({
    Value<String>? id,
    Value<String?>? campaignId,
    Value<String?>? programTemplateId,
    Value<String>? workoutTemplateId,
    Value<DateTime>? scheduledFor,
    Value<String>? status,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ScheduledWorkoutsCompanion(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      programTemplateId: programTemplateId ?? this.programTemplateId,
      workoutTemplateId: workoutTemplateId ?? this.workoutTemplateId,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (programTemplateId.present) {
      map['program_template_id'] = Variable<String>(programTemplateId.value);
    }
    if (workoutTemplateId.present) {
      map['workout_template_id'] = Variable<String>(workoutTemplateId.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledWorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('campaignId: $campaignId, ')
          ..write('programTemplateId: $programTemplateId, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionLogsTable extends SessionLogs
    with TableInfo<$SessionLogsTable, SessionLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledWorkoutIdMeta =
      const VerificationMeta('scheduledWorkoutId');
  @override
  late final GeneratedColumn<String> scheduledWorkoutId =
      GeneratedColumn<String>(
        'scheduled_workout_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES scheduled_workouts (id)',
        ),
      );
  static const VerificationMeta _workoutTemplateIdMeta = const VerificationMeta(
    'workoutTemplateId',
  );
  @override
  late final GeneratedColumn<String> workoutTemplateId =
      GeneratedColumn<String>(
        'workout_template_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES workout_templates (id)',
        ),
      );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    scheduledWorkoutId,
    workoutTemplateId,
    startedAt,
    completedAt,
    durationSeconds,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('scheduled_workout_id')) {
      context.handle(
        _scheduledWorkoutIdMeta,
        scheduledWorkoutId.isAcceptableOrUnknown(
          data['scheduled_workout_id']!,
          _scheduledWorkoutIdMeta,
        ),
      );
    }
    if (data.containsKey('workout_template_id')) {
      context.handle(
        _workoutTemplateIdMeta,
        workoutTemplateId.isAcceptableOrUnknown(
          data['workout_template_id']!,
          _workoutTemplateIdMeta,
        ),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      scheduledWorkoutId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scheduled_workout_id'],
      ),
      workoutTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_template_id'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SessionLogsTable createAlias(String alias) {
    return $SessionLogsTable(attachedDatabase, alias);
  }
}

class SessionLog extends DataClass implements Insertable<SessionLog> {
  final String id;
  final String? scheduledWorkoutId;
  final String? workoutTemplateId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int? durationSeconds;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SessionLog({
    required this.id,
    this.scheduledWorkoutId,
    this.workoutTemplateId,
    required this.startedAt,
    this.completedAt,
    this.durationSeconds,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || scheduledWorkoutId != null) {
      map['scheduled_workout_id'] = Variable<String>(scheduledWorkoutId);
    }
    if (!nullToAbsent || workoutTemplateId != null) {
      map['workout_template_id'] = Variable<String>(workoutTemplateId);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SessionLogsCompanion toCompanion(bool nullToAbsent) {
    return SessionLogsCompanion(
      id: Value(id),
      scheduledWorkoutId: scheduledWorkoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledWorkoutId),
      workoutTemplateId: workoutTemplateId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutTemplateId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SessionLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionLog(
      id: serializer.fromJson<String>(json['id']),
      scheduledWorkoutId: serializer.fromJson<String?>(
        json['scheduledWorkoutId'],
      ),
      workoutTemplateId: serializer.fromJson<String?>(
        json['workoutTemplateId'],
      ),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'scheduledWorkoutId': serializer.toJson<String?>(scheduledWorkoutId),
      'workoutTemplateId': serializer.toJson<String?>(workoutTemplateId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SessionLog copyWith({
    String? id,
    Value<String?> scheduledWorkoutId = const Value.absent(),
    Value<String?> workoutTemplateId = const Value.absent(),
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SessionLog(
    id: id ?? this.id,
    scheduledWorkoutId: scheduledWorkoutId.present
        ? scheduledWorkoutId.value
        : this.scheduledWorkoutId,
    workoutTemplateId: workoutTemplateId.present
        ? workoutTemplateId.value
        : this.workoutTemplateId,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SessionLog copyWithCompanion(SessionLogsCompanion data) {
    return SessionLog(
      id: data.id.present ? data.id.value : this.id,
      scheduledWorkoutId: data.scheduledWorkoutId.present
          ? data.scheduledWorkoutId.value
          : this.scheduledWorkoutId,
      workoutTemplateId: data.workoutTemplateId.present
          ? data.workoutTemplateId.value
          : this.workoutTemplateId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionLog(')
          ..write('id: $id, ')
          ..write('scheduledWorkoutId: $scheduledWorkoutId, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    scheduledWorkoutId,
    workoutTemplateId,
    startedAt,
    completedAt,
    durationSeconds,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionLog &&
          other.id == this.id &&
          other.scheduledWorkoutId == this.scheduledWorkoutId &&
          other.workoutTemplateId == this.workoutTemplateId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.durationSeconds == this.durationSeconds &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SessionLogsCompanion extends UpdateCompanion<SessionLog> {
  final Value<String> id;
  final Value<String?> scheduledWorkoutId;
  final Value<String?> workoutTemplateId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int?> durationSeconds;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SessionLogsCompanion({
    this.id = const Value.absent(),
    this.scheduledWorkoutId = const Value.absent(),
    this.workoutTemplateId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionLogsCompanion.insert({
    required String id,
    this.scheduledWorkoutId = const Value.absent(),
    this.workoutTemplateId = const Value.absent(),
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startedAt = Value(startedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SessionLog> custom({
    Expression<String>? id,
    Expression<String>? scheduledWorkoutId,
    Expression<String>? workoutTemplateId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? durationSeconds,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scheduledWorkoutId != null)
        'scheduled_workout_id': scheduledWorkoutId,
      if (workoutTemplateId != null) 'workout_template_id': workoutTemplateId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionLogsCompanion copyWith({
    Value<String>? id,
    Value<String?>? scheduledWorkoutId,
    Value<String?>? workoutTemplateId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int?>? durationSeconds,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SessionLogsCompanion(
      id: id ?? this.id,
      scheduledWorkoutId: scheduledWorkoutId ?? this.scheduledWorkoutId,
      workoutTemplateId: workoutTemplateId ?? this.workoutTemplateId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (scheduledWorkoutId.present) {
      map['scheduled_workout_id'] = Variable<String>(scheduledWorkoutId.value);
    }
    if (workoutTemplateId.present) {
      map['workout_template_id'] = Variable<String>(workoutTemplateId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionLogsCompanion(')
          ..write('id: $id, ')
          ..write('scheduledWorkoutId: $scheduledWorkoutId, ')
          ..write('workoutTemplateId: $workoutTemplateId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseLogsTable extends ExerciseLogs
    with TableInfo<$ExerciseLogsTable, ExerciseLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionLogIdMeta = const VerificationMeta(
    'sessionLogId',
  );
  @override
  late final GeneratedColumn<String> sessionLogId = GeneratedColumn<String>(
    'session_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES session_logs (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionLogId,
    exerciseId,
    sortOrder,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_log_id')) {
      context.handle(
        _sessionLogIdMeta,
        sessionLogId.isAcceptableOrUnknown(
          data['session_log_id']!,
          _sessionLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionLogIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_log_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ExerciseLogsTable createAlias(String alias) {
    return $ExerciseLogsTable(attachedDatabase, alias);
  }
}

class ExerciseLog extends DataClass implements Insertable<ExerciseLog> {
  final String id;
  final String sessionLogId;
  final String exerciseId;
  final int sortOrder;
  final String? notes;
  const ExerciseLog({
    required this.id,
    required this.sessionLogId,
    required this.exerciseId,
    required this.sortOrder,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_log_id'] = Variable<String>(sessionLogId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExerciseLogsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseLogsCompanion(
      id: Value(id),
      sessionLogId: Value(sessionLogId),
      exerciseId: Value(exerciseId),
      sortOrder: Value(sortOrder),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory ExerciseLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseLog(
      id: serializer.fromJson<String>(json['id']),
      sessionLogId: serializer.fromJson<String>(json['sessionLogId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionLogId': serializer.toJson<String>(sessionLogId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ExerciseLog copyWith({
    String? id,
    String? sessionLogId,
    String? exerciseId,
    int? sortOrder,
    Value<String?> notes = const Value.absent(),
  }) => ExerciseLog(
    id: id ?? this.id,
    sessionLogId: sessionLogId ?? this.sessionLogId,
    exerciseId: exerciseId ?? this.exerciseId,
    sortOrder: sortOrder ?? this.sortOrder,
    notes: notes.present ? notes.value : this.notes,
  );
  ExerciseLog copyWithCompanion(ExerciseLogsCompanion data) {
    return ExerciseLog(
      id: data.id.present ? data.id.value : this.id,
      sessionLogId: data.sessionLogId.present
          ? data.sessionLogId.value
          : this.sessionLogId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseLog(')
          ..write('id: $id, ')
          ..write('sessionLogId: $sessionLogId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sessionLogId, exerciseId, sortOrder, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseLog &&
          other.id == this.id &&
          other.sessionLogId == this.sessionLogId &&
          other.exerciseId == this.exerciseId &&
          other.sortOrder == this.sortOrder &&
          other.notes == this.notes);
}

class ExerciseLogsCompanion extends UpdateCompanion<ExerciseLog> {
  final Value<String> id;
  final Value<String> sessionLogId;
  final Value<String> exerciseId;
  final Value<int> sortOrder;
  final Value<String?> notes;
  final Value<int> rowid;
  const ExerciseLogsCompanion({
    this.id = const Value.absent(),
    this.sessionLogId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseLogsCompanion.insert({
    required String id,
    required String sessionLogId,
    required String exerciseId,
    required int sortOrder,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionLogId = Value(sessionLogId),
       exerciseId = Value(exerciseId),
       sortOrder = Value(sortOrder);
  static Insertable<ExerciseLog> custom({
    Expression<String>? id,
    Expression<String>? sessionLogId,
    Expression<String>? exerciseId,
    Expression<int>? sortOrder,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionLogId != null) 'session_log_id': sessionLogId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionLogId,
    Value<String>? exerciseId,
    Value<int>? sortOrder,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ExerciseLogsCompanion(
      id: id ?? this.id,
      sessionLogId: sessionLogId ?? this.sessionLogId,
      exerciseId: exerciseId ?? this.exerciseId,
      sortOrder: sortOrder ?? this.sortOrder,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionLogId.present) {
      map['session_log_id'] = Variable<String>(sessionLogId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseLogsCompanion(')
          ..write('id: $id, ')
          ..write('sessionLogId: $sessionLogId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SetLogsTable extends SetLogs with TableInfo<$SetLogsTable, SetLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseLogIdMeta = const VerificationMeta(
    'exerciseLogId',
  );
  @override
  late final GeneratedColumn<String> exerciseLogId = GeneratedColumn<String>(
    'exercise_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercise_logs (id)',
    ),
  );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
    'rpe',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMetersMeta = const VerificationMeta(
    'distanceMeters',
  );
  @override
  late final GeneratedColumn<double> distanceMeters = GeneratedColumn<double>(
    'distance_meters',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCompleteMeta = const VerificationMeta(
    'isComplete',
  );
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
    'is_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    exerciseLogId,
    setNumber,
    reps,
    weight,
    rpe,
    durationSeconds,
    distanceMeters,
    isComplete,
    notes,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('exercise_log_id')) {
      context.handle(
        _exerciseLogIdMeta,
        exerciseLogId.isAcceptableOrUnknown(
          data['exercise_log_id']!,
          _exerciseLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseLogIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('rpe')) {
      context.handle(
        _rpeMeta,
        rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('distance_meters')) {
      context.handle(
        _distanceMetersMeta,
        distanceMeters.isAcceptableOrUnknown(
          data['distance_meters']!,
          _distanceMetersMeta,
        ),
      );
    }
    if (data.containsKey('is_complete')) {
      context.handle(
        _isCompleteMeta,
        isComplete.isAcceptableOrUnknown(data['is_complete']!, _isCompleteMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      exerciseLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_log_id'],
      )!,
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      rpe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rpe'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      ),
      distanceMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_meters'],
      ),
      isComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_complete'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $SetLogsTable createAlias(String alias) {
    return $SetLogsTable(attachedDatabase, alias);
  }
}

class SetLog extends DataClass implements Insertable<SetLog> {
  final String id;
  final String exerciseLogId;
  final int setNumber;
  final int? reps;
  final double? weight;
  final double? rpe;
  final int? durationSeconds;
  final double? distanceMeters;
  final bool isComplete;
  final String? notes;
  final DateTime? completedAt;
  const SetLog({
    required this.id,
    required this.exerciseLogId,
    required this.setNumber,
    this.reps,
    this.weight,
    this.rpe,
    this.durationSeconds,
    this.distanceMeters,
    required this.isComplete,
    this.notes,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['exercise_log_id'] = Variable<String>(exerciseLogId);
    map['set_number'] = Variable<int>(setNumber);
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<double>(rpe);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || distanceMeters != null) {
      map['distance_meters'] = Variable<double>(distanceMeters);
    }
    map['is_complete'] = Variable<bool>(isComplete);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  SetLogsCompanion toCompanion(bool nullToAbsent) {
    return SetLogsCompanion(
      id: Value(id),
      exerciseLogId: Value(exerciseLogId),
      setNumber: Value(setNumber),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      distanceMeters: distanceMeters == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceMeters),
      isComplete: Value(isComplete),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory SetLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetLog(
      id: serializer.fromJson<String>(json['id']),
      exerciseLogId: serializer.fromJson<String>(json['exerciseLogId']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      reps: serializer.fromJson<int?>(json['reps']),
      weight: serializer.fromJson<double?>(json['weight']),
      rpe: serializer.fromJson<double?>(json['rpe']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      distanceMeters: serializer.fromJson<double?>(json['distanceMeters']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      notes: serializer.fromJson<String?>(json['notes']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'exerciseLogId': serializer.toJson<String>(exerciseLogId),
      'setNumber': serializer.toJson<int>(setNumber),
      'reps': serializer.toJson<int?>(reps),
      'weight': serializer.toJson<double?>(weight),
      'rpe': serializer.toJson<double?>(rpe),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'distanceMeters': serializer.toJson<double?>(distanceMeters),
      'isComplete': serializer.toJson<bool>(isComplete),
      'notes': serializer.toJson<String?>(notes),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  SetLog copyWith({
    String? id,
    String? exerciseLogId,
    int? setNumber,
    Value<int?> reps = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<double?> rpe = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<double?> distanceMeters = const Value.absent(),
    bool? isComplete,
    Value<String?> notes = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
  }) => SetLog(
    id: id ?? this.id,
    exerciseLogId: exerciseLogId ?? this.exerciseLogId,
    setNumber: setNumber ?? this.setNumber,
    reps: reps.present ? reps.value : this.reps,
    weight: weight.present ? weight.value : this.weight,
    rpe: rpe.present ? rpe.value : this.rpe,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    distanceMeters: distanceMeters.present
        ? distanceMeters.value
        : this.distanceMeters,
    isComplete: isComplete ?? this.isComplete,
    notes: notes.present ? notes.value : this.notes,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  SetLog copyWithCompanion(SetLogsCompanion data) {
    return SetLog(
      id: data.id.present ? data.id.value : this.id,
      exerciseLogId: data.exerciseLogId.present
          ? data.exerciseLogId.value
          : this.exerciseLogId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      distanceMeters: data.distanceMeters.present
          ? data.distanceMeters.value
          : this.distanceMeters,
      isComplete: data.isComplete.present
          ? data.isComplete.value
          : this.isComplete,
      notes: data.notes.present ? data.notes.value : this.notes,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetLog(')
          ..write('id: $id, ')
          ..write('exerciseLogId: $exerciseLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('rpe: $rpe, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('isComplete: $isComplete, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    exerciseLogId,
    setNumber,
    reps,
    weight,
    rpe,
    durationSeconds,
    distanceMeters,
    isComplete,
    notes,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetLog &&
          other.id == this.id &&
          other.exerciseLogId == this.exerciseLogId &&
          other.setNumber == this.setNumber &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.rpe == this.rpe &&
          other.durationSeconds == this.durationSeconds &&
          other.distanceMeters == this.distanceMeters &&
          other.isComplete == this.isComplete &&
          other.notes == this.notes &&
          other.completedAt == this.completedAt);
}

class SetLogsCompanion extends UpdateCompanion<SetLog> {
  final Value<String> id;
  final Value<String> exerciseLogId;
  final Value<int> setNumber;
  final Value<int?> reps;
  final Value<double?> weight;
  final Value<double?> rpe;
  final Value<int?> durationSeconds;
  final Value<double?> distanceMeters;
  final Value<bool> isComplete;
  final Value<String?> notes;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const SetLogsCompanion({
    this.id = const Value.absent(),
    this.exerciseLogId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.rpe = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.distanceMeters = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SetLogsCompanion.insert({
    required String id,
    required String exerciseLogId,
    required int setNumber,
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.rpe = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.distanceMeters = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       exerciseLogId = Value(exerciseLogId),
       setNumber = Value(setNumber);
  static Insertable<SetLog> custom({
    Expression<String>? id,
    Expression<String>? exerciseLogId,
    Expression<int>? setNumber,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<double>? rpe,
    Expression<int>? durationSeconds,
    Expression<double>? distanceMeters,
    Expression<bool>? isComplete,
    Expression<String>? notes,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseLogId != null) 'exercise_log_id': exerciseLogId,
      if (setNumber != null) 'set_number': setNumber,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (rpe != null) 'rpe': rpe,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (distanceMeters != null) 'distance_meters': distanceMeters,
      if (isComplete != null) 'is_complete': isComplete,
      if (notes != null) 'notes': notes,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SetLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? exerciseLogId,
    Value<int>? setNumber,
    Value<int?>? reps,
    Value<double?>? weight,
    Value<double?>? rpe,
    Value<int?>? durationSeconds,
    Value<double?>? distanceMeters,
    Value<bool>? isComplete,
    Value<String?>? notes,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return SetLogsCompanion(
      id: id ?? this.id,
      exerciseLogId: exerciseLogId ?? this.exerciseLogId,
      setNumber: setNumber ?? this.setNumber,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      rpe: rpe ?? this.rpe,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      distanceMeters: distanceMeters ?? this.distanceMeters,
      isComplete: isComplete ?? this.isComplete,
      notes: notes ?? this.notes,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (exerciseLogId.present) {
      map['exercise_log_id'] = Variable<String>(exerciseLogId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<double>(rpe.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (distanceMeters.present) {
      map['distance_meters'] = Variable<double>(distanceMeters.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetLogsCompanion(')
          ..write('id: $id, ')
          ..write('exerciseLogId: $exerciseLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('rpe: $rpe, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('isComplete: $isComplete, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkingWeightsTable extends WorkingWeights
    with TableInfo<$WorkingWeightsTable, WorkingWeight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkingWeightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('kg'),
  );
  static const VerificationMeta _estimatedOneRepMaxMeta =
      const VerificationMeta('estimatedOneRepMax');
  @override
  late final GeneratedColumn<double> estimatedOneRepMax =
      GeneratedColumn<double>(
        'estimated_one_rep_max',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sourceSetLogIdMeta = const VerificationMeta(
    'sourceSetLogId',
  );
  @override
  late final GeneratedColumn<String> sourceSetLogId = GeneratedColumn<String>(
    'source_set_log_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES set_logs (id)',
    ),
  );
  static const VerificationMeta _isManualOverrideMeta = const VerificationMeta(
    'isManualOverride',
  );
  @override
  late final GeneratedColumn<bool> isManualOverride = GeneratedColumn<bool>(
    'is_manual_override',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_manual_override" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    exerciseId,
    weight,
    unit,
    estimatedOneRepMax,
    sourceSetLogId,
    isManualOverride,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'working_weights';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkingWeight> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('estimated_one_rep_max')) {
      context.handle(
        _estimatedOneRepMaxMeta,
        estimatedOneRepMax.isAcceptableOrUnknown(
          data['estimated_one_rep_max']!,
          _estimatedOneRepMaxMeta,
        ),
      );
    }
    if (data.containsKey('source_set_log_id')) {
      context.handle(
        _sourceSetLogIdMeta,
        sourceSetLogId.isAcceptableOrUnknown(
          data['source_set_log_id']!,
          _sourceSetLogIdMeta,
        ),
      );
    }
    if (data.containsKey('is_manual_override')) {
      context.handle(
        _isManualOverrideMeta,
        isManualOverride.isAcceptableOrUnknown(
          data['is_manual_override']!,
          _isManualOverrideMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {exerciseId};
  @override
  WorkingWeight map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkingWeight(
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      estimatedOneRepMax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}estimated_one_rep_max'],
      ),
      sourceSetLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_set_log_id'],
      ),
      isManualOverride: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_manual_override'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WorkingWeightsTable createAlias(String alias) {
    return $WorkingWeightsTable(attachedDatabase, alias);
  }
}

class WorkingWeight extends DataClass implements Insertable<WorkingWeight> {
  final String exerciseId;
  final double weight;
  final String unit;
  final double? estimatedOneRepMax;
  final String? sourceSetLogId;
  final bool isManualOverride;
  final DateTime updatedAt;
  const WorkingWeight({
    required this.exerciseId,
    required this.weight,
    required this.unit,
    this.estimatedOneRepMax,
    this.sourceSetLogId,
    required this.isManualOverride,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['exercise_id'] = Variable<String>(exerciseId);
    map['weight'] = Variable<double>(weight);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || estimatedOneRepMax != null) {
      map['estimated_one_rep_max'] = Variable<double>(estimatedOneRepMax);
    }
    if (!nullToAbsent || sourceSetLogId != null) {
      map['source_set_log_id'] = Variable<String>(sourceSetLogId);
    }
    map['is_manual_override'] = Variable<bool>(isManualOverride);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  WorkingWeightsCompanion toCompanion(bool nullToAbsent) {
    return WorkingWeightsCompanion(
      exerciseId: Value(exerciseId),
      weight: Value(weight),
      unit: Value(unit),
      estimatedOneRepMax: estimatedOneRepMax == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedOneRepMax),
      sourceSetLogId: sourceSetLogId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceSetLogId),
      isManualOverride: Value(isManualOverride),
      updatedAt: Value(updatedAt),
    );
  }

  factory WorkingWeight.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkingWeight(
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      weight: serializer.fromJson<double>(json['weight']),
      unit: serializer.fromJson<String>(json['unit']),
      estimatedOneRepMax: serializer.fromJson<double?>(
        json['estimatedOneRepMax'],
      ),
      sourceSetLogId: serializer.fromJson<String?>(json['sourceSetLogId']),
      isManualOverride: serializer.fromJson<bool>(json['isManualOverride']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'exerciseId': serializer.toJson<String>(exerciseId),
      'weight': serializer.toJson<double>(weight),
      'unit': serializer.toJson<String>(unit),
      'estimatedOneRepMax': serializer.toJson<double?>(estimatedOneRepMax),
      'sourceSetLogId': serializer.toJson<String?>(sourceSetLogId),
      'isManualOverride': serializer.toJson<bool>(isManualOverride),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  WorkingWeight copyWith({
    String? exerciseId,
    double? weight,
    String? unit,
    Value<double?> estimatedOneRepMax = const Value.absent(),
    Value<String?> sourceSetLogId = const Value.absent(),
    bool? isManualOverride,
    DateTime? updatedAt,
  }) => WorkingWeight(
    exerciseId: exerciseId ?? this.exerciseId,
    weight: weight ?? this.weight,
    unit: unit ?? this.unit,
    estimatedOneRepMax: estimatedOneRepMax.present
        ? estimatedOneRepMax.value
        : this.estimatedOneRepMax,
    sourceSetLogId: sourceSetLogId.present
        ? sourceSetLogId.value
        : this.sourceSetLogId,
    isManualOverride: isManualOverride ?? this.isManualOverride,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  WorkingWeight copyWithCompanion(WorkingWeightsCompanion data) {
    return WorkingWeight(
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      weight: data.weight.present ? data.weight.value : this.weight,
      unit: data.unit.present ? data.unit.value : this.unit,
      estimatedOneRepMax: data.estimatedOneRepMax.present
          ? data.estimatedOneRepMax.value
          : this.estimatedOneRepMax,
      sourceSetLogId: data.sourceSetLogId.present
          ? data.sourceSetLogId.value
          : this.sourceSetLogId,
      isManualOverride: data.isManualOverride.present
          ? data.isManualOverride.value
          : this.isManualOverride,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkingWeight(')
          ..write('exerciseId: $exerciseId, ')
          ..write('weight: $weight, ')
          ..write('unit: $unit, ')
          ..write('estimatedOneRepMax: $estimatedOneRepMax, ')
          ..write('sourceSetLogId: $sourceSetLogId, ')
          ..write('isManualOverride: $isManualOverride, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    exerciseId,
    weight,
    unit,
    estimatedOneRepMax,
    sourceSetLogId,
    isManualOverride,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkingWeight &&
          other.exerciseId == this.exerciseId &&
          other.weight == this.weight &&
          other.unit == this.unit &&
          other.estimatedOneRepMax == this.estimatedOneRepMax &&
          other.sourceSetLogId == this.sourceSetLogId &&
          other.isManualOverride == this.isManualOverride &&
          other.updatedAt == this.updatedAt);
}

class WorkingWeightsCompanion extends UpdateCompanion<WorkingWeight> {
  final Value<String> exerciseId;
  final Value<double> weight;
  final Value<String> unit;
  final Value<double?> estimatedOneRepMax;
  final Value<String?> sourceSetLogId;
  final Value<bool> isManualOverride;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const WorkingWeightsCompanion({
    this.exerciseId = const Value.absent(),
    this.weight = const Value.absent(),
    this.unit = const Value.absent(),
    this.estimatedOneRepMax = const Value.absent(),
    this.sourceSetLogId = const Value.absent(),
    this.isManualOverride = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkingWeightsCompanion.insert({
    required String exerciseId,
    required double weight,
    this.unit = const Value.absent(),
    this.estimatedOneRepMax = const Value.absent(),
    this.sourceSetLogId = const Value.absent(),
    this.isManualOverride = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : exerciseId = Value(exerciseId),
       weight = Value(weight),
       updatedAt = Value(updatedAt);
  static Insertable<WorkingWeight> custom({
    Expression<String>? exerciseId,
    Expression<double>? weight,
    Expression<String>? unit,
    Expression<double>? estimatedOneRepMax,
    Expression<String>? sourceSetLogId,
    Expression<bool>? isManualOverride,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (weight != null) 'weight': weight,
      if (unit != null) 'unit': unit,
      if (estimatedOneRepMax != null)
        'estimated_one_rep_max': estimatedOneRepMax,
      if (sourceSetLogId != null) 'source_set_log_id': sourceSetLogId,
      if (isManualOverride != null) 'is_manual_override': isManualOverride,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkingWeightsCompanion copyWith({
    Value<String>? exerciseId,
    Value<double>? weight,
    Value<String>? unit,
    Value<double?>? estimatedOneRepMax,
    Value<String?>? sourceSetLogId,
    Value<bool>? isManualOverride,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return WorkingWeightsCompanion(
      exerciseId: exerciseId ?? this.exerciseId,
      weight: weight ?? this.weight,
      unit: unit ?? this.unit,
      estimatedOneRepMax: estimatedOneRepMax ?? this.estimatedOneRepMax,
      sourceSetLogId: sourceSetLogId ?? this.sourceSetLogId,
      isManualOverride: isManualOverride ?? this.isManualOverride,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (estimatedOneRepMax.present) {
      map['estimated_one_rep_max'] = Variable<double>(estimatedOneRepMax.value);
    }
    if (sourceSetLogId.present) {
      map['source_set_log_id'] = Variable<String>(sourceSetLogId.value);
    }
    if (isManualOverride.present) {
      map['is_manual_override'] = Variable<bool>(isManualOverride.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkingWeightsCompanion(')
          ..write('exerciseId: $exerciseId, ')
          ..write('weight: $weight, ')
          ..write('unit: $unit, ')
          ..write('estimatedOneRepMax: $estimatedOneRepMax, ')
          ..write('sourceSetLogId: $sourceSetLogId, ')
          ..write('isManualOverride: $isManualOverride, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardioLogsTable extends CardioLogs
    with TableInfo<$CardioLogsTable, CardioLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardioLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activityTypeMeta = const VerificationMeta(
    'activityType',
  );
  @override
  late final GeneratedColumn<String> activityType = GeneratedColumn<String>(
    'activity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('run'),
  );
  static const VerificationMeta _distanceMetersMeta = const VerificationMeta(
    'distanceMeters',
  );
  @override
  late final GeneratedColumn<double> distanceMeters = GeneratedColumn<double>(
    'distance_meters',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paceSecondsPerKmMeta = const VerificationMeta(
    'paceSecondsPerKm',
  );
  @override
  late final GeneratedColumn<double> paceSecondsPerKm = GeneratedColumn<double>(
    'pace_seconds_per_km',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loggedAt,
    activityType,
    distanceMeters,
    durationSeconds,
    paceSecondsPerKm,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cardio_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardioLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('activity_type')) {
      context.handle(
        _activityTypeMeta,
        activityType.isAcceptableOrUnknown(
          data['activity_type']!,
          _activityTypeMeta,
        ),
      );
    }
    if (data.containsKey('distance_meters')) {
      context.handle(
        _distanceMetersMeta,
        distanceMeters.isAcceptableOrUnknown(
          data['distance_meters']!,
          _distanceMetersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distanceMetersMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('pace_seconds_per_km')) {
      context.handle(
        _paceSecondsPerKmMeta,
        paceSecondsPerKm.isAcceptableOrUnknown(
          data['pace_seconds_per_km']!,
          _paceSecondsPerKmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paceSecondsPerKmMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardioLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardioLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      activityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_type'],
      )!,
      distanceMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_meters'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      paceSecondsPerKm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pace_seconds_per_km'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CardioLogsTable createAlias(String alias) {
    return $CardioLogsTable(attachedDatabase, alias);
  }
}

class CardioLog extends DataClass implements Insertable<CardioLog> {
  final String id;
  final DateTime loggedAt;
  final String activityType;
  final double distanceMeters;
  final int durationSeconds;
  final double paceSecondsPerKm;
  final String? notes;
  final DateTime createdAt;
  const CardioLog({
    required this.id,
    required this.loggedAt,
    required this.activityType,
    required this.distanceMeters,
    required this.durationSeconds,
    required this.paceSecondsPerKm,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    map['activity_type'] = Variable<String>(activityType);
    map['distance_meters'] = Variable<double>(distanceMeters);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['pace_seconds_per_km'] = Variable<double>(paceSecondsPerKm);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CardioLogsCompanion toCompanion(bool nullToAbsent) {
    return CardioLogsCompanion(
      id: Value(id),
      loggedAt: Value(loggedAt),
      activityType: Value(activityType),
      distanceMeters: Value(distanceMeters),
      durationSeconds: Value(durationSeconds),
      paceSecondsPerKm: Value(paceSecondsPerKm),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory CardioLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardioLog(
      id: serializer.fromJson<String>(json['id']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      activityType: serializer.fromJson<String>(json['activityType']),
      distanceMeters: serializer.fromJson<double>(json['distanceMeters']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      paceSecondsPerKm: serializer.fromJson<double>(json['paceSecondsPerKm']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'activityType': serializer.toJson<String>(activityType),
      'distanceMeters': serializer.toJson<double>(distanceMeters),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'paceSecondsPerKm': serializer.toJson<double>(paceSecondsPerKm),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CardioLog copyWith({
    String? id,
    DateTime? loggedAt,
    String? activityType,
    double? distanceMeters,
    int? durationSeconds,
    double? paceSecondsPerKm,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => CardioLog(
    id: id ?? this.id,
    loggedAt: loggedAt ?? this.loggedAt,
    activityType: activityType ?? this.activityType,
    distanceMeters: distanceMeters ?? this.distanceMeters,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    paceSecondsPerKm: paceSecondsPerKm ?? this.paceSecondsPerKm,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  CardioLog copyWithCompanion(CardioLogsCompanion data) {
    return CardioLog(
      id: data.id.present ? data.id.value : this.id,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      activityType: data.activityType.present
          ? data.activityType.value
          : this.activityType,
      distanceMeters: data.distanceMeters.present
          ? data.distanceMeters.value
          : this.distanceMeters,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      paceSecondsPerKm: data.paceSecondsPerKm.present
          ? data.paceSecondsPerKm.value
          : this.paceSecondsPerKm,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardioLog(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('activityType: $activityType, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('paceSecondsPerKm: $paceSecondsPerKm, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    loggedAt,
    activityType,
    distanceMeters,
    durationSeconds,
    paceSecondsPerKm,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardioLog &&
          other.id == this.id &&
          other.loggedAt == this.loggedAt &&
          other.activityType == this.activityType &&
          other.distanceMeters == this.distanceMeters &&
          other.durationSeconds == this.durationSeconds &&
          other.paceSecondsPerKm == this.paceSecondsPerKm &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class CardioLogsCompanion extends UpdateCompanion<CardioLog> {
  final Value<String> id;
  final Value<DateTime> loggedAt;
  final Value<String> activityType;
  final Value<double> distanceMeters;
  final Value<int> durationSeconds;
  final Value<double> paceSecondsPerKm;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CardioLogsCompanion({
    this.id = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.activityType = const Value.absent(),
    this.distanceMeters = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.paceSecondsPerKm = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardioLogsCompanion.insert({
    required String id,
    required DateTime loggedAt,
    this.activityType = const Value.absent(),
    required double distanceMeters,
    required int durationSeconds,
    required double paceSecondsPerKm,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loggedAt = Value(loggedAt),
       distanceMeters = Value(distanceMeters),
       durationSeconds = Value(durationSeconds),
       paceSecondsPerKm = Value(paceSecondsPerKm),
       createdAt = Value(createdAt);
  static Insertable<CardioLog> custom({
    Expression<String>? id,
    Expression<DateTime>? loggedAt,
    Expression<String>? activityType,
    Expression<double>? distanceMeters,
    Expression<int>? durationSeconds,
    Expression<double>? paceSecondsPerKm,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (activityType != null) 'activity_type': activityType,
      if (distanceMeters != null) 'distance_meters': distanceMeters,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (paceSecondsPerKm != null) 'pace_seconds_per_km': paceSecondsPerKm,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardioLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? loggedAt,
    Value<String>? activityType,
    Value<double>? distanceMeters,
    Value<int>? durationSeconds,
    Value<double>? paceSecondsPerKm,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CardioLogsCompanion(
      id: id ?? this.id,
      loggedAt: loggedAt ?? this.loggedAt,
      activityType: activityType ?? this.activityType,
      distanceMeters: distanceMeters ?? this.distanceMeters,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      paceSecondsPerKm: paceSecondsPerKm ?? this.paceSecondsPerKm,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (activityType.present) {
      map['activity_type'] = Variable<String>(activityType.value);
    }
    if (distanceMeters.present) {
      map['distance_meters'] = Variable<double>(distanceMeters.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (paceSecondsPerKm.present) {
      map['pace_seconds_per_km'] = Variable<double>(paceSecondsPerKm.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardioLogsCompanion(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('activityType: $activityType, ')
          ..write('distanceMeters: $distanceMeters, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('paceSecondsPerKm: $paceSecondsPerKm, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgressionSuggestionsTable extends ProgressionSuggestions
    with TableInfo<$ProgressionSuggestionsTable, ProgressionSuggestion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressionSuggestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _currentWeightMeta = const VerificationMeta(
    'currentWeight',
  );
  @override
  late final GeneratedColumn<double> currentWeight = GeneratedColumn<double>(
    'current_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _suggestedWeightMeta = const VerificationMeta(
    'suggestedWeight',
  );
  @override
  late final GeneratedColumn<double> suggestedWeight = GeneratedColumn<double>(
    'suggested_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('kg'),
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resolvedAtMeta = const VerificationMeta(
    'resolvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
    'resolved_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    exerciseId,
    currentWeight,
    suggestedWeight,
    unit,
    reason,
    status,
    createdAt,
    resolvedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progression_suggestions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgressionSuggestion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('current_weight')) {
      context.handle(
        _currentWeightMeta,
        currentWeight.isAcceptableOrUnknown(
          data['current_weight']!,
          _currentWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentWeightMeta);
    }
    if (data.containsKey('suggested_weight')) {
      context.handle(
        _suggestedWeightMeta,
        suggestedWeight.isAcceptableOrUnknown(
          data['suggested_weight']!,
          _suggestedWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_suggestedWeightMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
        _resolvedAtMeta,
        resolvedAt.isAcceptableOrUnknown(data['resolved_at']!, _resolvedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgressionSuggestion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgressionSuggestion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      currentWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_weight'],
      )!,
      suggestedWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}suggested_weight'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      resolvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}resolved_at'],
      ),
    );
  }

  @override
  $ProgressionSuggestionsTable createAlias(String alias) {
    return $ProgressionSuggestionsTable(attachedDatabase, alias);
  }
}

class ProgressionSuggestion extends DataClass
    implements Insertable<ProgressionSuggestion> {
  final String id;
  final String exerciseId;
  final double currentWeight;
  final double suggestedWeight;
  final String unit;
  final String reason;
  final String status;
  final DateTime createdAt;
  final DateTime? resolvedAt;
  const ProgressionSuggestion({
    required this.id,
    required this.exerciseId,
    required this.currentWeight,
    required this.suggestedWeight,
    required this.unit,
    required this.reason,
    required this.status,
    required this.createdAt,
    this.resolvedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['current_weight'] = Variable<double>(currentWeight);
    map['suggested_weight'] = Variable<double>(suggestedWeight);
    map['unit'] = Variable<String>(unit);
    map['reason'] = Variable<String>(reason);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || resolvedAt != null) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt);
    }
    return map;
  }

  ProgressionSuggestionsCompanion toCompanion(bool nullToAbsent) {
    return ProgressionSuggestionsCompanion(
      id: Value(id),
      exerciseId: Value(exerciseId),
      currentWeight: Value(currentWeight),
      suggestedWeight: Value(suggestedWeight),
      unit: Value(unit),
      reason: Value(reason),
      status: Value(status),
      createdAt: Value(createdAt),
      resolvedAt: resolvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedAt),
    );
  }

  factory ProgressionSuggestion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgressionSuggestion(
      id: serializer.fromJson<String>(json['id']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      currentWeight: serializer.fromJson<double>(json['currentWeight']),
      suggestedWeight: serializer.fromJson<double>(json['suggestedWeight']),
      unit: serializer.fromJson<String>(json['unit']),
      reason: serializer.fromJson<String>(json['reason']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      resolvedAt: serializer.fromJson<DateTime?>(json['resolvedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'currentWeight': serializer.toJson<double>(currentWeight),
      'suggestedWeight': serializer.toJson<double>(suggestedWeight),
      'unit': serializer.toJson<String>(unit),
      'reason': serializer.toJson<String>(reason),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'resolvedAt': serializer.toJson<DateTime?>(resolvedAt),
    };
  }

  ProgressionSuggestion copyWith({
    String? id,
    String? exerciseId,
    double? currentWeight,
    double? suggestedWeight,
    String? unit,
    String? reason,
    String? status,
    DateTime? createdAt,
    Value<DateTime?> resolvedAt = const Value.absent(),
  }) => ProgressionSuggestion(
    id: id ?? this.id,
    exerciseId: exerciseId ?? this.exerciseId,
    currentWeight: currentWeight ?? this.currentWeight,
    suggestedWeight: suggestedWeight ?? this.suggestedWeight,
    unit: unit ?? this.unit,
    reason: reason ?? this.reason,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    resolvedAt: resolvedAt.present ? resolvedAt.value : this.resolvedAt,
  );
  ProgressionSuggestion copyWithCompanion(
    ProgressionSuggestionsCompanion data,
  ) {
    return ProgressionSuggestion(
      id: data.id.present ? data.id.value : this.id,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      currentWeight: data.currentWeight.present
          ? data.currentWeight.value
          : this.currentWeight,
      suggestedWeight: data.suggestedWeight.present
          ? data.suggestedWeight.value
          : this.suggestedWeight,
      unit: data.unit.present ? data.unit.value : this.unit,
      reason: data.reason.present ? data.reason.value : this.reason,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      resolvedAt: data.resolvedAt.present
          ? data.resolvedAt.value
          : this.resolvedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgressionSuggestion(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('currentWeight: $currentWeight, ')
          ..write('suggestedWeight: $suggestedWeight, ')
          ..write('unit: $unit, ')
          ..write('reason: $reason, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('resolvedAt: $resolvedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    exerciseId,
    currentWeight,
    suggestedWeight,
    unit,
    reason,
    status,
    createdAt,
    resolvedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgressionSuggestion &&
          other.id == this.id &&
          other.exerciseId == this.exerciseId &&
          other.currentWeight == this.currentWeight &&
          other.suggestedWeight == this.suggestedWeight &&
          other.unit == this.unit &&
          other.reason == this.reason &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.resolvedAt == this.resolvedAt);
}

class ProgressionSuggestionsCompanion
    extends UpdateCompanion<ProgressionSuggestion> {
  final Value<String> id;
  final Value<String> exerciseId;
  final Value<double> currentWeight;
  final Value<double> suggestedWeight;
  final Value<String> unit;
  final Value<String> reason;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> resolvedAt;
  final Value<int> rowid;
  const ProgressionSuggestionsCompanion({
    this.id = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.currentWeight = const Value.absent(),
    this.suggestedWeight = const Value.absent(),
    this.unit = const Value.absent(),
    this.reason = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgressionSuggestionsCompanion.insert({
    required String id,
    required String exerciseId,
    required double currentWeight,
    required double suggestedWeight,
    this.unit = const Value.absent(),
    required String reason,
    this.status = const Value.absent(),
    required DateTime createdAt,
    this.resolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       exerciseId = Value(exerciseId),
       currentWeight = Value(currentWeight),
       suggestedWeight = Value(suggestedWeight),
       reason = Value(reason),
       createdAt = Value(createdAt);
  static Insertable<ProgressionSuggestion> custom({
    Expression<String>? id,
    Expression<String>? exerciseId,
    Expression<double>? currentWeight,
    Expression<double>? suggestedWeight,
    Expression<String>? unit,
    Expression<String>? reason,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? resolvedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (currentWeight != null) 'current_weight': currentWeight,
      if (suggestedWeight != null) 'suggested_weight': suggestedWeight,
      if (unit != null) 'unit': unit,
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgressionSuggestionsCompanion copyWith({
    Value<String>? id,
    Value<String>? exerciseId,
    Value<double>? currentWeight,
    Value<double>? suggestedWeight,
    Value<String>? unit,
    Value<String>? reason,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime?>? resolvedAt,
    Value<int>? rowid,
  }) {
    return ProgressionSuggestionsCompanion(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      currentWeight: currentWeight ?? this.currentWeight,
      suggestedWeight: suggestedWeight ?? this.suggestedWeight,
      unit: unit ?? this.unit,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (currentWeight.present) {
      map['current_weight'] = Variable<double>(currentWeight.value);
    }
    if (suggestedWeight.present) {
      map['suggested_weight'] = Variable<double>(suggestedWeight.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressionSuggestionsCompanion(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('currentWeight: $currentWeight, ')
          ..write('suggestedWeight: $suggestedWeight, ')
          ..write('unit: $unit, ')
          ..write('reason: $reason, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdventurersTable extends Adventurers
    with TableInfo<$AdventurersTable, Adventurer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdventurersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
    'xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _selectedClassMeta = const VerificationMeta(
    'selectedClass',
  );
  @override
  late final GeneratedColumn<String> selectedClass = GeneratedColumn<String>(
    'selected_class',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentTitleMeta = const VerificationMeta(
    'currentTitle',
  );
  @override
  late final GeneratedColumn<String> currentTitle = GeneratedColumn<String>(
    'current_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mightMeta = const VerificationMeta('might');
  @override
  late final GeneratedColumn<int> might = GeneratedColumn<int>(
    'might',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _enduranceMeta = const VerificationMeta(
    'endurance',
  );
  @override
  late final GeneratedColumn<int> endurance = GeneratedColumn<int>(
    'endurance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _disciplineMeta = const VerificationMeta(
    'discipline',
  );
  @override
  late final GeneratedColumn<int> discipline = GeneratedColumn<int>(
    'discipline',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _vitalityMeta = const VerificationMeta(
    'vitality',
  );
  @override
  late final GeneratedColumn<int> vitality = GeneratedColumn<int>(
    'vitality',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _agilityMeta = const VerificationMeta(
    'agility',
  );
  @override
  late final GeneratedColumn<int> agility = GeneratedColumn<int>(
    'agility',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
    'wisdom',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    level,
    xp,
    selectedClass,
    currentTitle,
    might,
    endurance,
    discipline,
    vitality,
    agility,
    wisdom,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adventurers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Adventurer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    }
    if (data.containsKey('selected_class')) {
      context.handle(
        _selectedClassMeta,
        selectedClass.isAcceptableOrUnknown(
          data['selected_class']!,
          _selectedClassMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedClassMeta);
    }
    if (data.containsKey('current_title')) {
      context.handle(
        _currentTitleMeta,
        currentTitle.isAcceptableOrUnknown(
          data['current_title']!,
          _currentTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentTitleMeta);
    }
    if (data.containsKey('might')) {
      context.handle(
        _mightMeta,
        might.isAcceptableOrUnknown(data['might']!, _mightMeta),
      );
    }
    if (data.containsKey('endurance')) {
      context.handle(
        _enduranceMeta,
        endurance.isAcceptableOrUnknown(data['endurance']!, _enduranceMeta),
      );
    }
    if (data.containsKey('discipline')) {
      context.handle(
        _disciplineMeta,
        discipline.isAcceptableOrUnknown(data['discipline']!, _disciplineMeta),
      );
    }
    if (data.containsKey('vitality')) {
      context.handle(
        _vitalityMeta,
        vitality.isAcceptableOrUnknown(data['vitality']!, _vitalityMeta),
      );
    }
    if (data.containsKey('agility')) {
      context.handle(
        _agilityMeta,
        agility.isAcceptableOrUnknown(data['agility']!, _agilityMeta),
      );
    }
    if (data.containsKey('wisdom')) {
      context.handle(
        _wisdomMeta,
        wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Adventurer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Adventurer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      xp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp'],
      )!,
      selectedClass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_class'],
      )!,
      currentTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_title'],
      )!,
      might: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}might'],
      )!,
      endurance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}endurance'],
      )!,
      discipline: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discipline'],
      )!,
      vitality: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vitality'],
      )!,
      agility: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agility'],
      )!,
      wisdom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wisdom'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AdventurersTable createAlias(String alias) {
    return $AdventurersTable(attachedDatabase, alias);
  }
}

class Adventurer extends DataClass implements Insertable<Adventurer> {
  final String id;
  final String name;
  final int level;
  final int xp;
  final String selectedClass;
  final String currentTitle;
  final int might;
  final int endurance;
  final int discipline;
  final int vitality;
  final int agility;
  final int wisdom;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Adventurer({
    required this.id,
    required this.name,
    required this.level,
    required this.xp,
    required this.selectedClass,
    required this.currentTitle,
    required this.might,
    required this.endurance,
    required this.discipline,
    required this.vitality,
    required this.agility,
    required this.wisdom,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['level'] = Variable<int>(level);
    map['xp'] = Variable<int>(xp);
    map['selected_class'] = Variable<String>(selectedClass);
    map['current_title'] = Variable<String>(currentTitle);
    map['might'] = Variable<int>(might);
    map['endurance'] = Variable<int>(endurance);
    map['discipline'] = Variable<int>(discipline);
    map['vitality'] = Variable<int>(vitality);
    map['agility'] = Variable<int>(agility);
    map['wisdom'] = Variable<int>(wisdom);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AdventurersCompanion toCompanion(bool nullToAbsent) {
    return AdventurersCompanion(
      id: Value(id),
      name: Value(name),
      level: Value(level),
      xp: Value(xp),
      selectedClass: Value(selectedClass),
      currentTitle: Value(currentTitle),
      might: Value(might),
      endurance: Value(endurance),
      discipline: Value(discipline),
      vitality: Value(vitality),
      agility: Value(agility),
      wisdom: Value(wisdom),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Adventurer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Adventurer(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<int>(json['level']),
      xp: serializer.fromJson<int>(json['xp']),
      selectedClass: serializer.fromJson<String>(json['selectedClass']),
      currentTitle: serializer.fromJson<String>(json['currentTitle']),
      might: serializer.fromJson<int>(json['might']),
      endurance: serializer.fromJson<int>(json['endurance']),
      discipline: serializer.fromJson<int>(json['discipline']),
      vitality: serializer.fromJson<int>(json['vitality']),
      agility: serializer.fromJson<int>(json['agility']),
      wisdom: serializer.fromJson<int>(json['wisdom']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<int>(level),
      'xp': serializer.toJson<int>(xp),
      'selectedClass': serializer.toJson<String>(selectedClass),
      'currentTitle': serializer.toJson<String>(currentTitle),
      'might': serializer.toJson<int>(might),
      'endurance': serializer.toJson<int>(endurance),
      'discipline': serializer.toJson<int>(discipline),
      'vitality': serializer.toJson<int>(vitality),
      'agility': serializer.toJson<int>(agility),
      'wisdom': serializer.toJson<int>(wisdom),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Adventurer copyWith({
    String? id,
    String? name,
    int? level,
    int? xp,
    String? selectedClass,
    String? currentTitle,
    int? might,
    int? endurance,
    int? discipline,
    int? vitality,
    int? agility,
    int? wisdom,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Adventurer(
    id: id ?? this.id,
    name: name ?? this.name,
    level: level ?? this.level,
    xp: xp ?? this.xp,
    selectedClass: selectedClass ?? this.selectedClass,
    currentTitle: currentTitle ?? this.currentTitle,
    might: might ?? this.might,
    endurance: endurance ?? this.endurance,
    discipline: discipline ?? this.discipline,
    vitality: vitality ?? this.vitality,
    agility: agility ?? this.agility,
    wisdom: wisdom ?? this.wisdom,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Adventurer copyWithCompanion(AdventurersCompanion data) {
    return Adventurer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      level: data.level.present ? data.level.value : this.level,
      xp: data.xp.present ? data.xp.value : this.xp,
      selectedClass: data.selectedClass.present
          ? data.selectedClass.value
          : this.selectedClass,
      currentTitle: data.currentTitle.present
          ? data.currentTitle.value
          : this.currentTitle,
      might: data.might.present ? data.might.value : this.might,
      endurance: data.endurance.present ? data.endurance.value : this.endurance,
      discipline: data.discipline.present
          ? data.discipline.value
          : this.discipline,
      vitality: data.vitality.present ? data.vitality.value : this.vitality,
      agility: data.agility.present ? data.agility.value : this.agility,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Adventurer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('xp: $xp, ')
          ..write('selectedClass: $selectedClass, ')
          ..write('currentTitle: $currentTitle, ')
          ..write('might: $might, ')
          ..write('endurance: $endurance, ')
          ..write('discipline: $discipline, ')
          ..write('vitality: $vitality, ')
          ..write('agility: $agility, ')
          ..write('wisdom: $wisdom, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    level,
    xp,
    selectedClass,
    currentTitle,
    might,
    endurance,
    discipline,
    vitality,
    agility,
    wisdom,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Adventurer &&
          other.id == this.id &&
          other.name == this.name &&
          other.level == this.level &&
          other.xp == this.xp &&
          other.selectedClass == this.selectedClass &&
          other.currentTitle == this.currentTitle &&
          other.might == this.might &&
          other.endurance == this.endurance &&
          other.discipline == this.discipline &&
          other.vitality == this.vitality &&
          other.agility == this.agility &&
          other.wisdom == this.wisdom &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AdventurersCompanion extends UpdateCompanion<Adventurer> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> level;
  final Value<int> xp;
  final Value<String> selectedClass;
  final Value<String> currentTitle;
  final Value<int> might;
  final Value<int> endurance;
  final Value<int> discipline;
  final Value<int> vitality;
  final Value<int> agility;
  final Value<int> wisdom;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AdventurersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.xp = const Value.absent(),
    this.selectedClass = const Value.absent(),
    this.currentTitle = const Value.absent(),
    this.might = const Value.absent(),
    this.endurance = const Value.absent(),
    this.discipline = const Value.absent(),
    this.vitality = const Value.absent(),
    this.agility = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdventurersCompanion.insert({
    required String id,
    required String name,
    this.level = const Value.absent(),
    this.xp = const Value.absent(),
    required String selectedClass,
    required String currentTitle,
    this.might = const Value.absent(),
    this.endurance = const Value.absent(),
    this.discipline = const Value.absent(),
    this.vitality = const Value.absent(),
    this.agility = const Value.absent(),
    this.wisdom = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       selectedClass = Value(selectedClass),
       currentTitle = Value(currentTitle),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Adventurer> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? level,
    Expression<int>? xp,
    Expression<String>? selectedClass,
    Expression<String>? currentTitle,
    Expression<int>? might,
    Expression<int>? endurance,
    Expression<int>? discipline,
    Expression<int>? vitality,
    Expression<int>? agility,
    Expression<int>? wisdom,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
      if (xp != null) 'xp': xp,
      if (selectedClass != null) 'selected_class': selectedClass,
      if (currentTitle != null) 'current_title': currentTitle,
      if (might != null) 'might': might,
      if (endurance != null) 'endurance': endurance,
      if (discipline != null) 'discipline': discipline,
      if (vitality != null) 'vitality': vitality,
      if (agility != null) 'agility': agility,
      if (wisdom != null) 'wisdom': wisdom,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdventurersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? level,
    Value<int>? xp,
    Value<String>? selectedClass,
    Value<String>? currentTitle,
    Value<int>? might,
    Value<int>? endurance,
    Value<int>? discipline,
    Value<int>? vitality,
    Value<int>? agility,
    Value<int>? wisdom,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AdventurersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      selectedClass: selectedClass ?? this.selectedClass,
      currentTitle: currentTitle ?? this.currentTitle,
      might: might ?? this.might,
      endurance: endurance ?? this.endurance,
      discipline: discipline ?? this.discipline,
      vitality: vitality ?? this.vitality,
      agility: agility ?? this.agility,
      wisdom: wisdom ?? this.wisdom,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (selectedClass.present) {
      map['selected_class'] = Variable<String>(selectedClass.value);
    }
    if (currentTitle.present) {
      map['current_title'] = Variable<String>(currentTitle.value);
    }
    if (might.present) {
      map['might'] = Variable<int>(might.value);
    }
    if (endurance.present) {
      map['endurance'] = Variable<int>(endurance.value);
    }
    if (discipline.present) {
      map['discipline'] = Variable<int>(discipline.value);
    }
    if (vitality.present) {
      map['vitality'] = Variable<int>(vitality.value);
    }
    if (agility.present) {
      map['agility'] = Variable<int>(agility.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdventurersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('xp: $xp, ')
          ..write('selectedClass: $selectedClass, ')
          ..write('currentTitle: $currentTitle, ')
          ..write('might: $might, ')
          ..write('endurance: $endurance, ')
          ..write('discipline: $discipline, ')
          ..write('vitality: $vitality, ')
          ..write('agility: $agility, ')
          ..write('wisdom: $wisdom, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FitnessEventsTable extends FitnessEvents
    with TableInfo<$FitnessEventsTable, FitnessEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FitnessEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metadataJsonMeta = const VerificationMeta(
    'metadataJson',
  );
  @override
  late final GeneratedColumn<String> metadataJson = GeneratedColumn<String>(
    'metadata_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    occurredAt,
    sourceType,
    sourceId,
    metadataJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fitness_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<FitnessEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('metadata_json')) {
      context.handle(
        _metadataJsonMeta,
        metadataJson.isAcceptableOrUnknown(
          data['metadata_json']!,
          _metadataJsonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FitnessEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FitnessEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
      metadataJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata_json'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FitnessEventsTable createAlias(String alias) {
    return $FitnessEventsTable(attachedDatabase, alias);
  }
}

class FitnessEvent extends DataClass implements Insertable<FitnessEvent> {
  final String id;
  final String type;
  final DateTime occurredAt;
  final String sourceType;
  final String? sourceId;
  final String? metadataJson;
  final DateTime createdAt;
  const FitnessEvent({
    required this.id,
    required this.type,
    required this.occurredAt,
    required this.sourceType,
    this.sourceId,
    this.metadataJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || metadataJson != null) {
      map['metadata_json'] = Variable<String>(metadataJson);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FitnessEventsCompanion toCompanion(bool nullToAbsent) {
    return FitnessEventsCompanion(
      id: Value(id),
      type: Value(type),
      occurredAt: Value(occurredAt),
      sourceType: Value(sourceType),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      metadataJson: metadataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(metadataJson),
      createdAt: Value(createdAt),
    );
  }

  factory FitnessEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FitnessEvent(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      metadataJson: serializer.fromJson<String?>(json['metadataJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceId': serializer.toJson<String?>(sourceId),
      'metadataJson': serializer.toJson<String?>(metadataJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FitnessEvent copyWith({
    String? id,
    String? type,
    DateTime? occurredAt,
    String? sourceType,
    Value<String?> sourceId = const Value.absent(),
    Value<String?> metadataJson = const Value.absent(),
    DateTime? createdAt,
  }) => FitnessEvent(
    id: id ?? this.id,
    type: type ?? this.type,
    occurredAt: occurredAt ?? this.occurredAt,
    sourceType: sourceType ?? this.sourceType,
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    metadataJson: metadataJson.present ? metadataJson.value : this.metadataJson,
    createdAt: createdAt ?? this.createdAt,
  );
  FitnessEvent copyWithCompanion(FitnessEventsCompanion data) {
    return FitnessEvent(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FitnessEvent(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceId: $sourceId, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    occurredAt,
    sourceType,
    sourceId,
    metadataJson,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FitnessEvent &&
          other.id == this.id &&
          other.type == this.type &&
          other.occurredAt == this.occurredAt &&
          other.sourceType == this.sourceType &&
          other.sourceId == this.sourceId &&
          other.metadataJson == this.metadataJson &&
          other.createdAt == this.createdAt);
}

class FitnessEventsCompanion extends UpdateCompanion<FitnessEvent> {
  final Value<String> id;
  final Value<String> type;
  final Value<DateTime> occurredAt;
  final Value<String> sourceType;
  final Value<String?> sourceId;
  final Value<String?> metadataJson;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FitnessEventsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FitnessEventsCompanion.insert({
    required String id,
    required String type,
    required DateTime occurredAt,
    required String sourceType,
    this.sourceId = const Value.absent(),
    this.metadataJson = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       occurredAt = Value(occurredAt),
       sourceType = Value(sourceType),
       createdAt = Value(createdAt);
  static Insertable<FitnessEvent> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<DateTime>? occurredAt,
    Expression<String>? sourceType,
    Expression<String>? sourceId,
    Expression<String>? metadataJson,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceId != null) 'source_id': sourceId,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FitnessEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<DateTime>? occurredAt,
    Value<String>? sourceType,
    Value<String?>? sourceId,
    Value<String?>? metadataJson,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FitnessEventsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      occurredAt: occurredAt ?? this.occurredAt,
      sourceType: sourceType ?? this.sourceType,
      sourceId: sourceId ?? this.sourceId,
      metadataJson: metadataJson ?? this.metadataJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(metadataJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FitnessEventsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceId: $sourceId, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RewardEventsTable extends RewardEvents
    with TableInfo<$RewardEventsTable, RewardEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RewardEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fitnessEventIdMeta = const VerificationMeta(
    'fitnessEventId',
  );
  @override
  late final GeneratedColumn<String> fitnessEventId = GeneratedColumn<String>(
    'fitness_event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES fitness_events (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xpAmountMeta = const VerificationMeta(
    'xpAmount',
  );
  @override
  late final GeneratedColumn<int> xpAmount = GeneratedColumn<int>(
    'xp_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fitnessEventId,
    type,
    xpAmount,
    summary,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reward_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<RewardEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fitness_event_id')) {
      context.handle(
        _fitnessEventIdMeta,
        fitnessEventId.isAcceptableOrUnknown(
          data['fitness_event_id']!,
          _fitnessEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fitnessEventIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('xp_amount')) {
      context.handle(
        _xpAmountMeta,
        xpAmount.isAcceptableOrUnknown(data['xp_amount']!, _xpAmountMeta),
      );
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RewardEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RewardEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fitnessEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fitness_event_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      xpAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_amount'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RewardEventsTable createAlias(String alias) {
    return $RewardEventsTable(attachedDatabase, alias);
  }
}

class RewardEvent extends DataClass implements Insertable<RewardEvent> {
  final String id;
  final String fitnessEventId;
  final String type;
  final int xpAmount;
  final String summary;
  final DateTime createdAt;
  const RewardEvent({
    required this.id,
    required this.fitnessEventId,
    required this.type,
    required this.xpAmount,
    required this.summary,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['fitness_event_id'] = Variable<String>(fitnessEventId);
    map['type'] = Variable<String>(type);
    map['xp_amount'] = Variable<int>(xpAmount);
    map['summary'] = Variable<String>(summary);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RewardEventsCompanion toCompanion(bool nullToAbsent) {
    return RewardEventsCompanion(
      id: Value(id),
      fitnessEventId: Value(fitnessEventId),
      type: Value(type),
      xpAmount: Value(xpAmount),
      summary: Value(summary),
      createdAt: Value(createdAt),
    );
  }

  factory RewardEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RewardEvent(
      id: serializer.fromJson<String>(json['id']),
      fitnessEventId: serializer.fromJson<String>(json['fitnessEventId']),
      type: serializer.fromJson<String>(json['type']),
      xpAmount: serializer.fromJson<int>(json['xpAmount']),
      summary: serializer.fromJson<String>(json['summary']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fitnessEventId': serializer.toJson<String>(fitnessEventId),
      'type': serializer.toJson<String>(type),
      'xpAmount': serializer.toJson<int>(xpAmount),
      'summary': serializer.toJson<String>(summary),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RewardEvent copyWith({
    String? id,
    String? fitnessEventId,
    String? type,
    int? xpAmount,
    String? summary,
    DateTime? createdAt,
  }) => RewardEvent(
    id: id ?? this.id,
    fitnessEventId: fitnessEventId ?? this.fitnessEventId,
    type: type ?? this.type,
    xpAmount: xpAmount ?? this.xpAmount,
    summary: summary ?? this.summary,
    createdAt: createdAt ?? this.createdAt,
  );
  RewardEvent copyWithCompanion(RewardEventsCompanion data) {
    return RewardEvent(
      id: data.id.present ? data.id.value : this.id,
      fitnessEventId: data.fitnessEventId.present
          ? data.fitnessEventId.value
          : this.fitnessEventId,
      type: data.type.present ? data.type.value : this.type,
      xpAmount: data.xpAmount.present ? data.xpAmount.value : this.xpAmount,
      summary: data.summary.present ? data.summary.value : this.summary,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RewardEvent(')
          ..write('id: $id, ')
          ..write('fitnessEventId: $fitnessEventId, ')
          ..write('type: $type, ')
          ..write('xpAmount: $xpAmount, ')
          ..write('summary: $summary, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fitnessEventId, type, xpAmount, summary, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RewardEvent &&
          other.id == this.id &&
          other.fitnessEventId == this.fitnessEventId &&
          other.type == this.type &&
          other.xpAmount == this.xpAmount &&
          other.summary == this.summary &&
          other.createdAt == this.createdAt);
}

class RewardEventsCompanion extends UpdateCompanion<RewardEvent> {
  final Value<String> id;
  final Value<String> fitnessEventId;
  final Value<String> type;
  final Value<int> xpAmount;
  final Value<String> summary;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const RewardEventsCompanion({
    this.id = const Value.absent(),
    this.fitnessEventId = const Value.absent(),
    this.type = const Value.absent(),
    this.xpAmount = const Value.absent(),
    this.summary = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RewardEventsCompanion.insert({
    required String id,
    required String fitnessEventId,
    required String type,
    this.xpAmount = const Value.absent(),
    required String summary,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fitnessEventId = Value(fitnessEventId),
       type = Value(type),
       summary = Value(summary),
       createdAt = Value(createdAt);
  static Insertable<RewardEvent> custom({
    Expression<String>? id,
    Expression<String>? fitnessEventId,
    Expression<String>? type,
    Expression<int>? xpAmount,
    Expression<String>? summary,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fitnessEventId != null) 'fitness_event_id': fitnessEventId,
      if (type != null) 'type': type,
      if (xpAmount != null) 'xp_amount': xpAmount,
      if (summary != null) 'summary': summary,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RewardEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? fitnessEventId,
    Value<String>? type,
    Value<int>? xpAmount,
    Value<String>? summary,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return RewardEventsCompanion(
      id: id ?? this.id,
      fitnessEventId: fitnessEventId ?? this.fitnessEventId,
      type: type ?? this.type,
      xpAmount: xpAmount ?? this.xpAmount,
      summary: summary ?? this.summary,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fitnessEventId.present) {
      map['fitness_event_id'] = Variable<String>(fitnessEventId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (xpAmount.present) {
      map['xp_amount'] = Variable<int>(xpAmount.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RewardEventsCompanion(')
          ..write('id: $id, ')
          ..write('fitnessEventId: $fitnessEventId, ')
          ..write('type: $type, ')
          ..write('xpAmount: $xpAmount, ')
          ..write('summary: $summary, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $XpHistoryTable extends XpHistory
    with TableInfo<$XpHistoryTable, XpHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $XpHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardEventIdMeta = const VerificationMeta(
    'rewardEventId',
  );
  @override
  late final GeneratedColumn<String> rewardEventId = GeneratedColumn<String>(
    'reward_event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reward_events (id)',
    ),
  );
  static const VerificationMeta _adventurerIdMeta = const VerificationMeta(
    'adventurerId',
  );
  @override
  late final GeneratedColumn<String> adventurerId = GeneratedColumn<String>(
    'adventurer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES adventurers (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelBeforeMeta = const VerificationMeta(
    'levelBefore',
  );
  @override
  late final GeneratedColumn<int> levelBefore = GeneratedColumn<int>(
    'level_before',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelAfterMeta = const VerificationMeta(
    'levelAfter',
  );
  @override
  late final GeneratedColumn<int> levelAfter = GeneratedColumn<int>(
    'level_after',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xpBeforeMeta = const VerificationMeta(
    'xpBefore',
  );
  @override
  late final GeneratedColumn<int> xpBefore = GeneratedColumn<int>(
    'xp_before',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xpAfterMeta = const VerificationMeta(
    'xpAfter',
  );
  @override
  late final GeneratedColumn<int> xpAfter = GeneratedColumn<int>(
    'xp_after',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    rewardEventId,
    adventurerId,
    amount,
    levelBefore,
    levelAfter,
    xpBefore,
    xpAfter,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'xp_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<XpHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reward_event_id')) {
      context.handle(
        _rewardEventIdMeta,
        rewardEventId.isAcceptableOrUnknown(
          data['reward_event_id']!,
          _rewardEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardEventIdMeta);
    }
    if (data.containsKey('adventurer_id')) {
      context.handle(
        _adventurerIdMeta,
        adventurerId.isAcceptableOrUnknown(
          data['adventurer_id']!,
          _adventurerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_adventurerIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('level_before')) {
      context.handle(
        _levelBeforeMeta,
        levelBefore.isAcceptableOrUnknown(
          data['level_before']!,
          _levelBeforeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_levelBeforeMeta);
    }
    if (data.containsKey('level_after')) {
      context.handle(
        _levelAfterMeta,
        levelAfter.isAcceptableOrUnknown(data['level_after']!, _levelAfterMeta),
      );
    } else if (isInserting) {
      context.missing(_levelAfterMeta);
    }
    if (data.containsKey('xp_before')) {
      context.handle(
        _xpBeforeMeta,
        xpBefore.isAcceptableOrUnknown(data['xp_before']!, _xpBeforeMeta),
      );
    } else if (isInserting) {
      context.missing(_xpBeforeMeta);
    }
    if (data.containsKey('xp_after')) {
      context.handle(
        _xpAfterMeta,
        xpAfter.isAcceptableOrUnknown(data['xp_after']!, _xpAfterMeta),
      );
    } else if (isInserting) {
      context.missing(_xpAfterMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  XpHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return XpHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      rewardEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reward_event_id'],
      )!,
      adventurerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adventurer_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      levelBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level_before'],
      )!,
      levelAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level_after'],
      )!,
      xpBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_before'],
      )!,
      xpAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_after'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $XpHistoryTable createAlias(String alias) {
    return $XpHistoryTable(attachedDatabase, alias);
  }
}

class XpHistoryData extends DataClass implements Insertable<XpHistoryData> {
  final String id;
  final String rewardEventId;
  final String adventurerId;
  final int amount;
  final int levelBefore;
  final int levelAfter;
  final int xpBefore;
  final int xpAfter;
  final DateTime createdAt;
  const XpHistoryData({
    required this.id,
    required this.rewardEventId,
    required this.adventurerId,
    required this.amount,
    required this.levelBefore,
    required this.levelAfter,
    required this.xpBefore,
    required this.xpAfter,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['reward_event_id'] = Variable<String>(rewardEventId);
    map['adventurer_id'] = Variable<String>(adventurerId);
    map['amount'] = Variable<int>(amount);
    map['level_before'] = Variable<int>(levelBefore);
    map['level_after'] = Variable<int>(levelAfter);
    map['xp_before'] = Variable<int>(xpBefore);
    map['xp_after'] = Variable<int>(xpAfter);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  XpHistoryCompanion toCompanion(bool nullToAbsent) {
    return XpHistoryCompanion(
      id: Value(id),
      rewardEventId: Value(rewardEventId),
      adventurerId: Value(adventurerId),
      amount: Value(amount),
      levelBefore: Value(levelBefore),
      levelAfter: Value(levelAfter),
      xpBefore: Value(xpBefore),
      xpAfter: Value(xpAfter),
      createdAt: Value(createdAt),
    );
  }

  factory XpHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return XpHistoryData(
      id: serializer.fromJson<String>(json['id']),
      rewardEventId: serializer.fromJson<String>(json['rewardEventId']),
      adventurerId: serializer.fromJson<String>(json['adventurerId']),
      amount: serializer.fromJson<int>(json['amount']),
      levelBefore: serializer.fromJson<int>(json['levelBefore']),
      levelAfter: serializer.fromJson<int>(json['levelAfter']),
      xpBefore: serializer.fromJson<int>(json['xpBefore']),
      xpAfter: serializer.fromJson<int>(json['xpAfter']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'rewardEventId': serializer.toJson<String>(rewardEventId),
      'adventurerId': serializer.toJson<String>(adventurerId),
      'amount': serializer.toJson<int>(amount),
      'levelBefore': serializer.toJson<int>(levelBefore),
      'levelAfter': serializer.toJson<int>(levelAfter),
      'xpBefore': serializer.toJson<int>(xpBefore),
      'xpAfter': serializer.toJson<int>(xpAfter),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  XpHistoryData copyWith({
    String? id,
    String? rewardEventId,
    String? adventurerId,
    int? amount,
    int? levelBefore,
    int? levelAfter,
    int? xpBefore,
    int? xpAfter,
    DateTime? createdAt,
  }) => XpHistoryData(
    id: id ?? this.id,
    rewardEventId: rewardEventId ?? this.rewardEventId,
    adventurerId: adventurerId ?? this.adventurerId,
    amount: amount ?? this.amount,
    levelBefore: levelBefore ?? this.levelBefore,
    levelAfter: levelAfter ?? this.levelAfter,
    xpBefore: xpBefore ?? this.xpBefore,
    xpAfter: xpAfter ?? this.xpAfter,
    createdAt: createdAt ?? this.createdAt,
  );
  XpHistoryData copyWithCompanion(XpHistoryCompanion data) {
    return XpHistoryData(
      id: data.id.present ? data.id.value : this.id,
      rewardEventId: data.rewardEventId.present
          ? data.rewardEventId.value
          : this.rewardEventId,
      adventurerId: data.adventurerId.present
          ? data.adventurerId.value
          : this.adventurerId,
      amount: data.amount.present ? data.amount.value : this.amount,
      levelBefore: data.levelBefore.present
          ? data.levelBefore.value
          : this.levelBefore,
      levelAfter: data.levelAfter.present
          ? data.levelAfter.value
          : this.levelAfter,
      xpBefore: data.xpBefore.present ? data.xpBefore.value : this.xpBefore,
      xpAfter: data.xpAfter.present ? data.xpAfter.value : this.xpAfter,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('XpHistoryData(')
          ..write('id: $id, ')
          ..write('rewardEventId: $rewardEventId, ')
          ..write('adventurerId: $adventurerId, ')
          ..write('amount: $amount, ')
          ..write('levelBefore: $levelBefore, ')
          ..write('levelAfter: $levelAfter, ')
          ..write('xpBefore: $xpBefore, ')
          ..write('xpAfter: $xpAfter, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    rewardEventId,
    adventurerId,
    amount,
    levelBefore,
    levelAfter,
    xpBefore,
    xpAfter,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is XpHistoryData &&
          other.id == this.id &&
          other.rewardEventId == this.rewardEventId &&
          other.adventurerId == this.adventurerId &&
          other.amount == this.amount &&
          other.levelBefore == this.levelBefore &&
          other.levelAfter == this.levelAfter &&
          other.xpBefore == this.xpBefore &&
          other.xpAfter == this.xpAfter &&
          other.createdAt == this.createdAt);
}

class XpHistoryCompanion extends UpdateCompanion<XpHistoryData> {
  final Value<String> id;
  final Value<String> rewardEventId;
  final Value<String> adventurerId;
  final Value<int> amount;
  final Value<int> levelBefore;
  final Value<int> levelAfter;
  final Value<int> xpBefore;
  final Value<int> xpAfter;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const XpHistoryCompanion({
    this.id = const Value.absent(),
    this.rewardEventId = const Value.absent(),
    this.adventurerId = const Value.absent(),
    this.amount = const Value.absent(),
    this.levelBefore = const Value.absent(),
    this.levelAfter = const Value.absent(),
    this.xpBefore = const Value.absent(),
    this.xpAfter = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  XpHistoryCompanion.insert({
    required String id,
    required String rewardEventId,
    required String adventurerId,
    required int amount,
    required int levelBefore,
    required int levelAfter,
    required int xpBefore,
    required int xpAfter,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       rewardEventId = Value(rewardEventId),
       adventurerId = Value(adventurerId),
       amount = Value(amount),
       levelBefore = Value(levelBefore),
       levelAfter = Value(levelAfter),
       xpBefore = Value(xpBefore),
       xpAfter = Value(xpAfter),
       createdAt = Value(createdAt);
  static Insertable<XpHistoryData> custom({
    Expression<String>? id,
    Expression<String>? rewardEventId,
    Expression<String>? adventurerId,
    Expression<int>? amount,
    Expression<int>? levelBefore,
    Expression<int>? levelAfter,
    Expression<int>? xpBefore,
    Expression<int>? xpAfter,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rewardEventId != null) 'reward_event_id': rewardEventId,
      if (adventurerId != null) 'adventurer_id': adventurerId,
      if (amount != null) 'amount': amount,
      if (levelBefore != null) 'level_before': levelBefore,
      if (levelAfter != null) 'level_after': levelAfter,
      if (xpBefore != null) 'xp_before': xpBefore,
      if (xpAfter != null) 'xp_after': xpAfter,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  XpHistoryCompanion copyWith({
    Value<String>? id,
    Value<String>? rewardEventId,
    Value<String>? adventurerId,
    Value<int>? amount,
    Value<int>? levelBefore,
    Value<int>? levelAfter,
    Value<int>? xpBefore,
    Value<int>? xpAfter,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return XpHistoryCompanion(
      id: id ?? this.id,
      rewardEventId: rewardEventId ?? this.rewardEventId,
      adventurerId: adventurerId ?? this.adventurerId,
      amount: amount ?? this.amount,
      levelBefore: levelBefore ?? this.levelBefore,
      levelAfter: levelAfter ?? this.levelAfter,
      xpBefore: xpBefore ?? this.xpBefore,
      xpAfter: xpAfter ?? this.xpAfter,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (rewardEventId.present) {
      map['reward_event_id'] = Variable<String>(rewardEventId.value);
    }
    if (adventurerId.present) {
      map['adventurer_id'] = Variable<String>(adventurerId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (levelBefore.present) {
      map['level_before'] = Variable<int>(levelBefore.value);
    }
    if (levelAfter.present) {
      map['level_after'] = Variable<int>(levelAfter.value);
    }
    if (xpBefore.present) {
      map['xp_before'] = Variable<int>(xpBefore.value);
    }
    if (xpAfter.present) {
      map['xp_after'] = Variable<int>(xpAfter.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('XpHistoryCompanion(')
          ..write('id: $id, ')
          ..write('rewardEventId: $rewardEventId, ')
          ..write('adventurerId: $adventurerId, ')
          ..write('amount: $amount, ')
          ..write('levelBefore: $levelBefore, ')
          ..write('levelAfter: $levelAfter, ')
          ..write('xpBefore: $xpBefore, ')
          ..write('xpAfter: $xpAfter, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, Achievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetValueMeta = const VerificationMeta(
    'targetValue',
  );
  @override
  late final GeneratedColumn<int> targetValue = GeneratedColumn<int>(
    'target_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    category,
    targetValue,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Achievement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('target_value')) {
      context.handle(
        _targetValueMeta,
        targetValue.isAcceptableOrUnknown(
          data['target_value']!,
          _targetValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetValueMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Achievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Achievement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      targetValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_value'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }
}

class Achievement extends DataClass implements Insertable<Achievement> {
  final String id;
  final String name;
  final String description;
  final String category;
  final int targetValue;
  final DateTime createdAt;
  const Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.targetValue,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['target_value'] = Variable<int>(targetValue);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      category: Value(category),
      targetValue: Value(targetValue),
      createdAt: Value(createdAt),
    );
  }

  factory Achievement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Achievement(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      targetValue: serializer.fromJson<int>(json['targetValue']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'targetValue': serializer.toJson<int>(targetValue),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Achievement copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    int? targetValue,
    DateTime? createdAt,
  }) => Achievement(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    category: category ?? this.category,
    targetValue: targetValue ?? this.targetValue,
    createdAt: createdAt ?? this.createdAt,
  );
  Achievement copyWithCompanion(AchievementsCompanion data) {
    return Achievement(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      targetValue: data.targetValue.present
          ? data.targetValue.value
          : this.targetValue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Achievement(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('targetValue: $targetValue, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, category, targetValue, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achievement &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.category == this.category &&
          other.targetValue == this.targetValue &&
          other.createdAt == this.createdAt);
}

class AchievementsCompanion extends UpdateCompanion<Achievement> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> category;
  final Value<int> targetValue;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementsCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String category,
    required int targetValue,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       category = Value(category),
       targetValue = Value(targetValue),
       createdAt = Value(createdAt);
  static Insertable<Achievement> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? category,
    Expression<int>? targetValue,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (targetValue != null) 'target_value': targetValue,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? category,
    Value<int>? targetValue,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return AchievementsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      targetValue: targetValue ?? this.targetValue,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<int>(targetValue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('targetValue: $targetValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AchievementStatesTable extends AchievementStates
    with TableInfo<$AchievementStatesTable, AchievementState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _achievementIdMeta = const VerificationMeta(
    'achievementId',
  );
  @override
  late final GeneratedColumn<String> achievementId = GeneratedColumn<String>(
    'achievement_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES achievements (id)',
    ),
  );
  static const VerificationMeta _currentValueMeta = const VerificationMeta(
    'currentValue',
  );
  @override
  late final GeneratedColumn<int> currentValue = GeneratedColumn<int>(
    'current_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isUnlockedMeta = const VerificationMeta(
    'isUnlocked',
  );
  @override
  late final GeneratedColumn<bool> isUnlocked = GeneratedColumn<bool>(
    'is_unlocked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unlocked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    achievementId,
    currentValue,
    isUnlocked,
    unlockedAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievement_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<AchievementState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('achievement_id')) {
      context.handle(
        _achievementIdMeta,
        achievementId.isAcceptableOrUnknown(
          data['achievement_id']!,
          _achievementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_achievementIdMeta);
    }
    if (data.containsKey('current_value')) {
      context.handle(
        _currentValueMeta,
        currentValue.isAcceptableOrUnknown(
          data['current_value']!,
          _currentValueMeta,
        ),
      );
    }
    if (data.containsKey('is_unlocked')) {
      context.handle(
        _isUnlockedMeta,
        isUnlocked.isAcceptableOrUnknown(data['is_unlocked']!, _isUnlockedMeta),
      );
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {achievementId};
  @override
  AchievementState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AchievementState(
      achievementId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement_id'],
      )!,
      currentValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_value'],
      )!,
      isUnlocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unlocked'],
      )!,
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AchievementStatesTable createAlias(String alias) {
    return $AchievementStatesTable(attachedDatabase, alias);
  }
}

class AchievementState extends DataClass
    implements Insertable<AchievementState> {
  final String achievementId;
  final int currentValue;
  final bool isUnlocked;
  final DateTime? unlockedAt;
  final DateTime updatedAt;
  const AchievementState({
    required this.achievementId,
    required this.currentValue,
    required this.isUnlocked,
    this.unlockedAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['achievement_id'] = Variable<String>(achievementId);
    map['current_value'] = Variable<int>(currentValue);
    map['is_unlocked'] = Variable<bool>(isUnlocked);
    if (!nullToAbsent || unlockedAt != null) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AchievementStatesCompanion toCompanion(bool nullToAbsent) {
    return AchievementStatesCompanion(
      achievementId: Value(achievementId),
      currentValue: Value(currentValue),
      isUnlocked: Value(isUnlocked),
      unlockedAt: unlockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AchievementState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AchievementState(
      achievementId: serializer.fromJson<String>(json['achievementId']),
      currentValue: serializer.fromJson<int>(json['currentValue']),
      isUnlocked: serializer.fromJson<bool>(json['isUnlocked']),
      unlockedAt: serializer.fromJson<DateTime?>(json['unlockedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'achievementId': serializer.toJson<String>(achievementId),
      'currentValue': serializer.toJson<int>(currentValue),
      'isUnlocked': serializer.toJson<bool>(isUnlocked),
      'unlockedAt': serializer.toJson<DateTime?>(unlockedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AchievementState copyWith({
    String? achievementId,
    int? currentValue,
    bool? isUnlocked,
    Value<DateTime?> unlockedAt = const Value.absent(),
    DateTime? updatedAt,
  }) => AchievementState(
    achievementId: achievementId ?? this.achievementId,
    currentValue: currentValue ?? this.currentValue,
    isUnlocked: isUnlocked ?? this.isUnlocked,
    unlockedAt: unlockedAt.present ? unlockedAt.value : this.unlockedAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AchievementState copyWithCompanion(AchievementStatesCompanion data) {
    return AchievementState(
      achievementId: data.achievementId.present
          ? data.achievementId.value
          : this.achievementId,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      isUnlocked: data.isUnlocked.present
          ? data.isUnlocked.value
          : this.isUnlocked,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AchievementState(')
          ..write('achievementId: $achievementId, ')
          ..write('currentValue: $currentValue, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    achievementId,
    currentValue,
    isUnlocked,
    unlockedAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AchievementState &&
          other.achievementId == this.achievementId &&
          other.currentValue == this.currentValue &&
          other.isUnlocked == this.isUnlocked &&
          other.unlockedAt == this.unlockedAt &&
          other.updatedAt == this.updatedAt);
}

class AchievementStatesCompanion extends UpdateCompanion<AchievementState> {
  final Value<String> achievementId;
  final Value<int> currentValue;
  final Value<bool> isUnlocked;
  final Value<DateTime?> unlockedAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AchievementStatesCompanion({
    this.achievementId = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.isUnlocked = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementStatesCompanion.insert({
    required String achievementId,
    this.currentValue = const Value.absent(),
    this.isUnlocked = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : achievementId = Value(achievementId),
       updatedAt = Value(updatedAt);
  static Insertable<AchievementState> custom({
    Expression<String>? achievementId,
    Expression<int>? currentValue,
    Expression<bool>? isUnlocked,
    Expression<DateTime>? unlockedAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (achievementId != null) 'achievement_id': achievementId,
      if (currentValue != null) 'current_value': currentValue,
      if (isUnlocked != null) 'is_unlocked': isUnlocked,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementStatesCompanion copyWith({
    Value<String>? achievementId,
    Value<int>? currentValue,
    Value<bool>? isUnlocked,
    Value<DateTime?>? unlockedAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AchievementStatesCompanion(
      achievementId: achievementId ?? this.achievementId,
      currentValue: currentValue ?? this.currentValue,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (achievementId.present) {
      map['achievement_id'] = Variable<String>(achievementId.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<int>(currentValue.value);
    }
    if (isUnlocked.present) {
      map['is_unlocked'] = Variable<bool>(isUnlocked.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementStatesCompanion(')
          ..write('achievementId: $achievementId, ')
          ..write('currentValue: $currentValue, ')
          ..write('isUnlocked: $isUnlocked, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EquipmentDefinitionsTable extends EquipmentDefinitions
    with TableInfo<$EquipmentDefinitionsTable, EquipmentDefinition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentDefinitionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconKeyMeta = const VerificationMeta(
    'iconKey',
  );
  @override
  late final GeneratedColumn<String> iconKey = GeneratedColumn<String>(
    'icon_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String> rarity = GeneratedColumn<String>(
    'rarity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('common'),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    slot,
    description,
    iconKey,
    rarity,
    sortOrder,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_definitions';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentDefinition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon_key')) {
      context.handle(
        _iconKeyMeta,
        iconKey.isAcceptableOrUnknown(data['icon_key']!, _iconKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_iconKeyMeta);
    }
    if (data.containsKey('rarity')) {
      context.handle(
        _rarityMeta,
        rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentDefinition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentDefinition(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      slot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slot'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      iconKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_key'],
      )!,
      rarity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rarity'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $EquipmentDefinitionsTable createAlias(String alias) {
    return $EquipmentDefinitionsTable(attachedDatabase, alias);
  }
}

class EquipmentDefinition extends DataClass
    implements Insertable<EquipmentDefinition> {
  final String id;
  final String name;
  final String slot;
  final String description;
  final String iconKey;
  final String rarity;
  final int sortOrder;
  final DateTime createdAt;
  const EquipmentDefinition({
    required this.id,
    required this.name,
    required this.slot,
    required this.description,
    required this.iconKey,
    required this.rarity,
    required this.sortOrder,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['slot'] = Variable<String>(slot);
    map['description'] = Variable<String>(description);
    map['icon_key'] = Variable<String>(iconKey);
    map['rarity'] = Variable<String>(rarity);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EquipmentDefinitionsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentDefinitionsCompanion(
      id: Value(id),
      name: Value(name),
      slot: Value(slot),
      description: Value(description),
      iconKey: Value(iconKey),
      rarity: Value(rarity),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
    );
  }

  factory EquipmentDefinition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentDefinition(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      slot: serializer.fromJson<String>(json['slot']),
      description: serializer.fromJson<String>(json['description']),
      iconKey: serializer.fromJson<String>(json['iconKey']),
      rarity: serializer.fromJson<String>(json['rarity']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'slot': serializer.toJson<String>(slot),
      'description': serializer.toJson<String>(description),
      'iconKey': serializer.toJson<String>(iconKey),
      'rarity': serializer.toJson<String>(rarity),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  EquipmentDefinition copyWith({
    String? id,
    String? name,
    String? slot,
    String? description,
    String? iconKey,
    String? rarity,
    int? sortOrder,
    DateTime? createdAt,
  }) => EquipmentDefinition(
    id: id ?? this.id,
    name: name ?? this.name,
    slot: slot ?? this.slot,
    description: description ?? this.description,
    iconKey: iconKey ?? this.iconKey,
    rarity: rarity ?? this.rarity,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
  );
  EquipmentDefinition copyWithCompanion(EquipmentDefinitionsCompanion data) {
    return EquipmentDefinition(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      slot: data.slot.present ? data.slot.value : this.slot,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconKey: data.iconKey.present ? data.iconKey.value : this.iconKey,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentDefinition(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slot: $slot, ')
          ..write('description: $description, ')
          ..write('iconKey: $iconKey, ')
          ..write('rarity: $rarity, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slot,
    description,
    iconKey,
    rarity,
    sortOrder,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentDefinition &&
          other.id == this.id &&
          other.name == this.name &&
          other.slot == this.slot &&
          other.description == this.description &&
          other.iconKey == this.iconKey &&
          other.rarity == this.rarity &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt);
}

class EquipmentDefinitionsCompanion
    extends UpdateCompanion<EquipmentDefinition> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> slot;
  final Value<String> description;
  final Value<String> iconKey;
  final Value<String> rarity;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const EquipmentDefinitionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.slot = const Value.absent(),
    this.description = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.rarity = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EquipmentDefinitionsCompanion.insert({
    required String id,
    required String name,
    required String slot,
    required String description,
    required String iconKey,
    this.rarity = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       slot = Value(slot),
       description = Value(description),
       iconKey = Value(iconKey),
       createdAt = Value(createdAt);
  static Insertable<EquipmentDefinition> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? slot,
    Expression<String>? description,
    Expression<String>? iconKey,
    Expression<String>? rarity,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (slot != null) 'slot': slot,
      if (description != null) 'description': description,
      if (iconKey != null) 'icon_key': iconKey,
      if (rarity != null) 'rarity': rarity,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EquipmentDefinitionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? slot,
    Value<String>? description,
    Value<String>? iconKey,
    Value<String>? rarity,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return EquipmentDefinitionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      slot: slot ?? this.slot,
      description: description ?? this.description,
      iconKey: iconKey ?? this.iconKey,
      rarity: rarity ?? this.rarity,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconKey.present) {
      map['icon_key'] = Variable<String>(iconKey.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<String>(rarity.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentDefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slot: $slot, ')
          ..write('description: $description, ')
          ..write('iconKey: $iconKey, ')
          ..write('rarity: $rarity, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EquipmentInventoryTable extends EquipmentInventory
    with TableInfo<$EquipmentInventoryTable, EquipmentInventoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentInventoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _equipmentIdMeta = const VerificationMeta(
    'equipmentId',
  );
  @override
  late final GeneratedColumn<String> equipmentId = GeneratedColumn<String>(
    'equipment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES equipment_definitions (id)',
    ),
  );
  static const VerificationMeta _sourceRewardEventIdMeta =
      const VerificationMeta('sourceRewardEventId');
  @override
  late final GeneratedColumn<String> sourceRewardEventId =
      GeneratedColumn<String>(
        'source_reward_event_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES reward_events (id)',
        ),
      );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    equipmentId,
    sourceRewardEventId,
    unlockedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_inventory';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentInventoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('equipment_id')) {
      context.handle(
        _equipmentIdMeta,
        equipmentId.isAcceptableOrUnknown(
          data['equipment_id']!,
          _equipmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    if (data.containsKey('source_reward_event_id')) {
      context.handle(
        _sourceRewardEventIdMeta,
        sourceRewardEventId.isAcceptableOrUnknown(
          data['source_reward_event_id']!,
          _sourceRewardEventIdMeta,
        ),
      );
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_unlockedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {equipmentId};
  @override
  EquipmentInventoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentInventoryData(
      equipmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_id'],
      )!,
      sourceRewardEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_reward_event_id'],
      ),
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      )!,
    );
  }

  @override
  $EquipmentInventoryTable createAlias(String alias) {
    return $EquipmentInventoryTable(attachedDatabase, alias);
  }
}

class EquipmentInventoryData extends DataClass
    implements Insertable<EquipmentInventoryData> {
  final String equipmentId;
  final String? sourceRewardEventId;
  final DateTime unlockedAt;
  const EquipmentInventoryData({
    required this.equipmentId,
    this.sourceRewardEventId,
    required this.unlockedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['equipment_id'] = Variable<String>(equipmentId);
    if (!nullToAbsent || sourceRewardEventId != null) {
      map['source_reward_event_id'] = Variable<String>(sourceRewardEventId);
    }
    map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    return map;
  }

  EquipmentInventoryCompanion toCompanion(bool nullToAbsent) {
    return EquipmentInventoryCompanion(
      equipmentId: Value(equipmentId),
      sourceRewardEventId: sourceRewardEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceRewardEventId),
      unlockedAt: Value(unlockedAt),
    );
  }

  factory EquipmentInventoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentInventoryData(
      equipmentId: serializer.fromJson<String>(json['equipmentId']),
      sourceRewardEventId: serializer.fromJson<String?>(
        json['sourceRewardEventId'],
      ),
      unlockedAt: serializer.fromJson<DateTime>(json['unlockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'equipmentId': serializer.toJson<String>(equipmentId),
      'sourceRewardEventId': serializer.toJson<String?>(sourceRewardEventId),
      'unlockedAt': serializer.toJson<DateTime>(unlockedAt),
    };
  }

  EquipmentInventoryData copyWith({
    String? equipmentId,
    Value<String?> sourceRewardEventId = const Value.absent(),
    DateTime? unlockedAt,
  }) => EquipmentInventoryData(
    equipmentId: equipmentId ?? this.equipmentId,
    sourceRewardEventId: sourceRewardEventId.present
        ? sourceRewardEventId.value
        : this.sourceRewardEventId,
    unlockedAt: unlockedAt ?? this.unlockedAt,
  );
  EquipmentInventoryData copyWithCompanion(EquipmentInventoryCompanion data) {
    return EquipmentInventoryData(
      equipmentId: data.equipmentId.present
          ? data.equipmentId.value
          : this.equipmentId,
      sourceRewardEventId: data.sourceRewardEventId.present
          ? data.sourceRewardEventId.value
          : this.sourceRewardEventId,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentInventoryData(')
          ..write('equipmentId: $equipmentId, ')
          ..write('sourceRewardEventId: $sourceRewardEventId, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(equipmentId, sourceRewardEventId, unlockedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentInventoryData &&
          other.equipmentId == this.equipmentId &&
          other.sourceRewardEventId == this.sourceRewardEventId &&
          other.unlockedAt == this.unlockedAt);
}

class EquipmentInventoryCompanion
    extends UpdateCompanion<EquipmentInventoryData> {
  final Value<String> equipmentId;
  final Value<String?> sourceRewardEventId;
  final Value<DateTime> unlockedAt;
  final Value<int> rowid;
  const EquipmentInventoryCompanion({
    this.equipmentId = const Value.absent(),
    this.sourceRewardEventId = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EquipmentInventoryCompanion.insert({
    required String equipmentId,
    this.sourceRewardEventId = const Value.absent(),
    required DateTime unlockedAt,
    this.rowid = const Value.absent(),
  }) : equipmentId = Value(equipmentId),
       unlockedAt = Value(unlockedAt);
  static Insertable<EquipmentInventoryData> custom({
    Expression<String>? equipmentId,
    Expression<String>? sourceRewardEventId,
    Expression<DateTime>? unlockedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (sourceRewardEventId != null)
        'source_reward_event_id': sourceRewardEventId,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EquipmentInventoryCompanion copyWith({
    Value<String>? equipmentId,
    Value<String?>? sourceRewardEventId,
    Value<DateTime>? unlockedAt,
    Value<int>? rowid,
  }) {
    return EquipmentInventoryCompanion(
      equipmentId: equipmentId ?? this.equipmentId,
      sourceRewardEventId: sourceRewardEventId ?? this.sourceRewardEventId,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (equipmentId.present) {
      map['equipment_id'] = Variable<String>(equipmentId.value);
    }
    if (sourceRewardEventId.present) {
      map['source_reward_event_id'] = Variable<String>(
        sourceRewardEventId.value,
      );
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentInventoryCompanion(')
          ..write('equipmentId: $equipmentId, ')
          ..write('sourceRewardEventId: $sourceRewardEventId, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EquippedEquipmentTable extends EquippedEquipment
    with TableInfo<$EquippedEquipmentTable, EquippedEquipmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquippedEquipmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _equipmentIdMeta = const VerificationMeta(
    'equipmentId',
  );
  @override
  late final GeneratedColumn<String> equipmentId = GeneratedColumn<String>(
    'equipment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES equipment_definitions (id)',
    ),
  );
  static const VerificationMeta _equippedAtMeta = const VerificationMeta(
    'equippedAt',
  );
  @override
  late final GeneratedColumn<DateTime> equippedAt = GeneratedColumn<DateTime>(
    'equipped_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [slot, equipmentId, equippedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipped_equipment';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquippedEquipmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
        _equipmentIdMeta,
        equipmentId.isAcceptableOrUnknown(
          data['equipment_id']!,
          _equipmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    if (data.containsKey('equipped_at')) {
      context.handle(
        _equippedAtMeta,
        equippedAt.isAcceptableOrUnknown(data['equipped_at']!, _equippedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_equippedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {slot};
  @override
  EquippedEquipmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquippedEquipmentData(
      slot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slot'],
      )!,
      equipmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_id'],
      )!,
      equippedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}equipped_at'],
      )!,
    );
  }

  @override
  $EquippedEquipmentTable createAlias(String alias) {
    return $EquippedEquipmentTable(attachedDatabase, alias);
  }
}

class EquippedEquipmentData extends DataClass
    implements Insertable<EquippedEquipmentData> {
  final String slot;
  final String equipmentId;
  final DateTime equippedAt;
  const EquippedEquipmentData({
    required this.slot,
    required this.equipmentId,
    required this.equippedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['slot'] = Variable<String>(slot);
    map['equipment_id'] = Variable<String>(equipmentId);
    map['equipped_at'] = Variable<DateTime>(equippedAt);
    return map;
  }

  EquippedEquipmentCompanion toCompanion(bool nullToAbsent) {
    return EquippedEquipmentCompanion(
      slot: Value(slot),
      equipmentId: Value(equipmentId),
      equippedAt: Value(equippedAt),
    );
  }

  factory EquippedEquipmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquippedEquipmentData(
      slot: serializer.fromJson<String>(json['slot']),
      equipmentId: serializer.fromJson<String>(json['equipmentId']),
      equippedAt: serializer.fromJson<DateTime>(json['equippedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'slot': serializer.toJson<String>(slot),
      'equipmentId': serializer.toJson<String>(equipmentId),
      'equippedAt': serializer.toJson<DateTime>(equippedAt),
    };
  }

  EquippedEquipmentData copyWith({
    String? slot,
    String? equipmentId,
    DateTime? equippedAt,
  }) => EquippedEquipmentData(
    slot: slot ?? this.slot,
    equipmentId: equipmentId ?? this.equipmentId,
    equippedAt: equippedAt ?? this.equippedAt,
  );
  EquippedEquipmentData copyWithCompanion(EquippedEquipmentCompanion data) {
    return EquippedEquipmentData(
      slot: data.slot.present ? data.slot.value : this.slot,
      equipmentId: data.equipmentId.present
          ? data.equipmentId.value
          : this.equipmentId,
      equippedAt: data.equippedAt.present
          ? data.equippedAt.value
          : this.equippedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquippedEquipmentData(')
          ..write('slot: $slot, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('equippedAt: $equippedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(slot, equipmentId, equippedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquippedEquipmentData &&
          other.slot == this.slot &&
          other.equipmentId == this.equipmentId &&
          other.equippedAt == this.equippedAt);
}

class EquippedEquipmentCompanion
    extends UpdateCompanion<EquippedEquipmentData> {
  final Value<String> slot;
  final Value<String> equipmentId;
  final Value<DateTime> equippedAt;
  final Value<int> rowid;
  const EquippedEquipmentCompanion({
    this.slot = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.equippedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EquippedEquipmentCompanion.insert({
    required String slot,
    required String equipmentId,
    required DateTime equippedAt,
    this.rowid = const Value.absent(),
  }) : slot = Value(slot),
       equipmentId = Value(equipmentId),
       equippedAt = Value(equippedAt);
  static Insertable<EquippedEquipmentData> custom({
    Expression<String>? slot,
    Expression<String>? equipmentId,
    Expression<DateTime>? equippedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (slot != null) 'slot': slot,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (equippedAt != null) 'equipped_at': equippedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EquippedEquipmentCompanion copyWith({
    Value<String>? slot,
    Value<String>? equipmentId,
    Value<DateTime>? equippedAt,
    Value<int>? rowid,
  }) {
    return EquippedEquipmentCompanion(
      slot: slot ?? this.slot,
      equipmentId: equipmentId ?? this.equipmentId,
      equippedAt: equippedAt ?? this.equippedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<String>(equipmentId.value);
    }
    if (equippedAt.present) {
      map['equipped_at'] = Variable<DateTime>(equippedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquippedEquipmentCompanion(')
          ..write('slot: $slot, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('equippedAt: $equippedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TitleDefinitionsTable extends TitleDefinitions
    with TableInfo<$TitleDefinitionsTable, TitleDefinition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TitleDefinitionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requiredLevelMeta = const VerificationMeta(
    'requiredLevel',
  );
  @override
  late final GeneratedColumn<int> requiredLevel = GeneratedColumn<int>(
    'required_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    requiredLevel,
    sortOrder,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'title_definitions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TitleDefinition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('required_level')) {
      context.handle(
        _requiredLevelMeta,
        requiredLevel.isAcceptableOrUnknown(
          data['required_level']!,
          _requiredLevelMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TitleDefinition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TitleDefinition(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      requiredLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}required_level'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TitleDefinitionsTable createAlias(String alias) {
    return $TitleDefinitionsTable(attachedDatabase, alias);
  }
}

class TitleDefinition extends DataClass implements Insertable<TitleDefinition> {
  final String id;
  final String name;
  final String description;
  final int requiredLevel;
  final int sortOrder;
  final DateTime createdAt;
  const TitleDefinition({
    required this.id,
    required this.name,
    required this.description,
    required this.requiredLevel,
    required this.sortOrder,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['required_level'] = Variable<int>(requiredLevel);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TitleDefinitionsCompanion toCompanion(bool nullToAbsent) {
    return TitleDefinitionsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      requiredLevel: Value(requiredLevel),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
    );
  }

  factory TitleDefinition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TitleDefinition(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      requiredLevel: serializer.fromJson<int>(json['requiredLevel']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'requiredLevel': serializer.toJson<int>(requiredLevel),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TitleDefinition copyWith({
    String? id,
    String? name,
    String? description,
    int? requiredLevel,
    int? sortOrder,
    DateTime? createdAt,
  }) => TitleDefinition(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    requiredLevel: requiredLevel ?? this.requiredLevel,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
  );
  TitleDefinition copyWithCompanion(TitleDefinitionsCompanion data) {
    return TitleDefinition(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      requiredLevel: data.requiredLevel.present
          ? data.requiredLevel.value
          : this.requiredLevel,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TitleDefinition(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('requiredLevel: $requiredLevel, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, requiredLevel, sortOrder, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TitleDefinition &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.requiredLevel == this.requiredLevel &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt);
}

class TitleDefinitionsCompanion extends UpdateCompanion<TitleDefinition> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> requiredLevel;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TitleDefinitionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.requiredLevel = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TitleDefinitionsCompanion.insert({
    required String id,
    required String name,
    required String description,
    this.requiredLevel = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       createdAt = Value(createdAt);
  static Insertable<TitleDefinition> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? requiredLevel,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (requiredLevel != null) 'required_level': requiredLevel,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TitleDefinitionsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<int>? requiredLevel,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TitleDefinitionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      requiredLevel: requiredLevel ?? this.requiredLevel,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (requiredLevel.present) {
      map['required_level'] = Variable<int>(requiredLevel.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TitleDefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('requiredLevel: $requiredLevel, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdventurerTitlesTable extends AdventurerTitles
    with TableInfo<$AdventurerTitlesTable, AdventurerTitle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdventurerTitlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _titleIdMeta = const VerificationMeta(
    'titleId',
  );
  @override
  late final GeneratedColumn<String> titleId = GeneratedColumn<String>(
    'title_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES title_definitions (id)',
    ),
  );
  static const VerificationMeta _sourceRewardEventIdMeta =
      const VerificationMeta('sourceRewardEventId');
  @override
  late final GeneratedColumn<String> sourceRewardEventId =
      GeneratedColumn<String>(
        'source_reward_event_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES reward_events (id)',
        ),
      );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    titleId,
    sourceRewardEventId,
    unlockedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adventurer_titles';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdventurerTitle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title_id')) {
      context.handle(
        _titleIdMeta,
        titleId.isAcceptableOrUnknown(data['title_id']!, _titleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_titleIdMeta);
    }
    if (data.containsKey('source_reward_event_id')) {
      context.handle(
        _sourceRewardEventIdMeta,
        sourceRewardEventId.isAcceptableOrUnknown(
          data['source_reward_event_id']!,
          _sourceRewardEventIdMeta,
        ),
      );
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_unlockedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {titleId};
  @override
  AdventurerTitle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdventurerTitle(
      titleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_id'],
      )!,
      sourceRewardEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_reward_event_id'],
      ),
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      )!,
    );
  }

  @override
  $AdventurerTitlesTable createAlias(String alias) {
    return $AdventurerTitlesTable(attachedDatabase, alias);
  }
}

class AdventurerTitle extends DataClass implements Insertable<AdventurerTitle> {
  final String titleId;
  final String? sourceRewardEventId;
  final DateTime unlockedAt;
  const AdventurerTitle({
    required this.titleId,
    this.sourceRewardEventId,
    required this.unlockedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title_id'] = Variable<String>(titleId);
    if (!nullToAbsent || sourceRewardEventId != null) {
      map['source_reward_event_id'] = Variable<String>(sourceRewardEventId);
    }
    map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    return map;
  }

  AdventurerTitlesCompanion toCompanion(bool nullToAbsent) {
    return AdventurerTitlesCompanion(
      titleId: Value(titleId),
      sourceRewardEventId: sourceRewardEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceRewardEventId),
      unlockedAt: Value(unlockedAt),
    );
  }

  factory AdventurerTitle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdventurerTitle(
      titleId: serializer.fromJson<String>(json['titleId']),
      sourceRewardEventId: serializer.fromJson<String?>(
        json['sourceRewardEventId'],
      ),
      unlockedAt: serializer.fromJson<DateTime>(json['unlockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'titleId': serializer.toJson<String>(titleId),
      'sourceRewardEventId': serializer.toJson<String?>(sourceRewardEventId),
      'unlockedAt': serializer.toJson<DateTime>(unlockedAt),
    };
  }

  AdventurerTitle copyWith({
    String? titleId,
    Value<String?> sourceRewardEventId = const Value.absent(),
    DateTime? unlockedAt,
  }) => AdventurerTitle(
    titleId: titleId ?? this.titleId,
    sourceRewardEventId: sourceRewardEventId.present
        ? sourceRewardEventId.value
        : this.sourceRewardEventId,
    unlockedAt: unlockedAt ?? this.unlockedAt,
  );
  AdventurerTitle copyWithCompanion(AdventurerTitlesCompanion data) {
    return AdventurerTitle(
      titleId: data.titleId.present ? data.titleId.value : this.titleId,
      sourceRewardEventId: data.sourceRewardEventId.present
          ? data.sourceRewardEventId.value
          : this.sourceRewardEventId,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdventurerTitle(')
          ..write('titleId: $titleId, ')
          ..write('sourceRewardEventId: $sourceRewardEventId, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(titleId, sourceRewardEventId, unlockedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdventurerTitle &&
          other.titleId == this.titleId &&
          other.sourceRewardEventId == this.sourceRewardEventId &&
          other.unlockedAt == this.unlockedAt);
}

class AdventurerTitlesCompanion extends UpdateCompanion<AdventurerTitle> {
  final Value<String> titleId;
  final Value<String?> sourceRewardEventId;
  final Value<DateTime> unlockedAt;
  final Value<int> rowid;
  const AdventurerTitlesCompanion({
    this.titleId = const Value.absent(),
    this.sourceRewardEventId = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdventurerTitlesCompanion.insert({
    required String titleId,
    this.sourceRewardEventId = const Value.absent(),
    required DateTime unlockedAt,
    this.rowid = const Value.absent(),
  }) : titleId = Value(titleId),
       unlockedAt = Value(unlockedAt);
  static Insertable<AdventurerTitle> custom({
    Expression<String>? titleId,
    Expression<String>? sourceRewardEventId,
    Expression<DateTime>? unlockedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (titleId != null) 'title_id': titleId,
      if (sourceRewardEventId != null)
        'source_reward_event_id': sourceRewardEventId,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdventurerTitlesCompanion copyWith({
    Value<String>? titleId,
    Value<String?>? sourceRewardEventId,
    Value<DateTime>? unlockedAt,
    Value<int>? rowid,
  }) {
    return AdventurerTitlesCompanion(
      titleId: titleId ?? this.titleId,
      sourceRewardEventId: sourceRewardEventId ?? this.sourceRewardEventId,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (titleId.present) {
      map['title_id'] = Variable<String>(titleId.value);
    }
    if (sourceRewardEventId.present) {
      map['source_reward_event_id'] = Variable<String>(
        sourceRewardEventId.value,
      );
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdventurerTitlesCompanion(')
          ..write('titleId: $titleId, ')
          ..write('sourceRewardEventId: $sourceRewardEventId, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BodyweightLogsTable extends BodyweightLogs
    with TableInfo<$BodyweightLogsTable, BodyweightLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyweightLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSeedExampleMeta = const VerificationMeta(
    'isSeedExample',
  );
  @override
  late final GeneratedColumn<bool> isSeedExample = GeneratedColumn<bool>(
    'is_seed_example',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_seed_example" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    loggedAt,
    weightKg,
    notes,
    isSeedExample,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bodyweight_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<BodyweightLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_seed_example')) {
      context.handle(
        _isSeedExampleMeta,
        isSeedExample.isAcceptableOrUnknown(
          data['is_seed_example']!,
          _isSeedExampleMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyweightLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyweightLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isSeedExample: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_seed_example'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BodyweightLogsTable createAlias(String alias) {
    return $BodyweightLogsTable(attachedDatabase, alias);
  }
}

class BodyweightLog extends DataClass implements Insertable<BodyweightLog> {
  final String id;
  final DateTime loggedAt;
  final double weightKg;
  final String? notes;
  final bool isSeedExample;
  final DateTime createdAt;
  const BodyweightLog({
    required this.id,
    required this.loggedAt,
    required this.weightKg,
    this.notes,
    required this.isSeedExample,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    map['weight_kg'] = Variable<double>(weightKg);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_seed_example'] = Variable<bool>(isSeedExample);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BodyweightLogsCompanion toCompanion(bool nullToAbsent) {
    return BodyweightLogsCompanion(
      id: Value(id),
      loggedAt: Value(loggedAt),
      weightKg: Value(weightKg),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isSeedExample: Value(isSeedExample),
      createdAt: Value(createdAt),
    );
  }

  factory BodyweightLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyweightLog(
      id: serializer.fromJson<String>(json['id']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      notes: serializer.fromJson<String?>(json['notes']),
      isSeedExample: serializer.fromJson<bool>(json['isSeedExample']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'weightKg': serializer.toJson<double>(weightKg),
      'notes': serializer.toJson<String?>(notes),
      'isSeedExample': serializer.toJson<bool>(isSeedExample),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BodyweightLog copyWith({
    String? id,
    DateTime? loggedAt,
    double? weightKg,
    Value<String?> notes = const Value.absent(),
    bool? isSeedExample,
    DateTime? createdAt,
  }) => BodyweightLog(
    id: id ?? this.id,
    loggedAt: loggedAt ?? this.loggedAt,
    weightKg: weightKg ?? this.weightKg,
    notes: notes.present ? notes.value : this.notes,
    isSeedExample: isSeedExample ?? this.isSeedExample,
    createdAt: createdAt ?? this.createdAt,
  );
  BodyweightLog copyWithCompanion(BodyweightLogsCompanion data) {
    return BodyweightLog(
      id: data.id.present ? data.id.value : this.id,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      notes: data.notes.present ? data.notes.value : this.notes,
      isSeedExample: data.isSeedExample.present
          ? data.isSeedExample.value
          : this.isSeedExample,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyweightLog(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('weightKg: $weightKg, ')
          ..write('notes: $notes, ')
          ..write('isSeedExample: $isSeedExample, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, loggedAt, weightKg, notes, isSeedExample, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyweightLog &&
          other.id == this.id &&
          other.loggedAt == this.loggedAt &&
          other.weightKg == this.weightKg &&
          other.notes == this.notes &&
          other.isSeedExample == this.isSeedExample &&
          other.createdAt == this.createdAt);
}

class BodyweightLogsCompanion extends UpdateCompanion<BodyweightLog> {
  final Value<String> id;
  final Value<DateTime> loggedAt;
  final Value<double> weightKg;
  final Value<String?> notes;
  final Value<bool> isSeedExample;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BodyweightLogsCompanion({
    this.id = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSeedExample = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BodyweightLogsCompanion.insert({
    required String id,
    required DateTime loggedAt,
    required double weightKg,
    this.notes = const Value.absent(),
    this.isSeedExample = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       loggedAt = Value(loggedAt),
       weightKg = Value(weightKg),
       createdAt = Value(createdAt);
  static Insertable<BodyweightLog> custom({
    Expression<String>? id,
    Expression<DateTime>? loggedAt,
    Expression<double>? weightKg,
    Expression<String>? notes,
    Expression<bool>? isSeedExample,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (weightKg != null) 'weight_kg': weightKg,
      if (notes != null) 'notes': notes,
      if (isSeedExample != null) 'is_seed_example': isSeedExample,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BodyweightLogsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? loggedAt,
    Value<double>? weightKg,
    Value<String?>? notes,
    Value<bool>? isSeedExample,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BodyweightLogsCompanion(
      id: id ?? this.id,
      loggedAt: loggedAt ?? this.loggedAt,
      weightKg: weightKg ?? this.weightKg,
      notes: notes ?? this.notes,
      isSeedExample: isSeedExample ?? this.isSeedExample,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isSeedExample.present) {
      map['is_seed_example'] = Variable<bool>(isSeedExample.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyweightLogsCompanion(')
          ..write('id: $id, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('weightKg: $weightKg, ')
          ..write('notes: $notes, ')
          ..write('isSeedExample: $isSeedExample, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _campaignIdMeta = const VerificationMeta(
    'campaignId',
  );
  @override
  late final GeneratedColumn<String> campaignId = GeneratedColumn<String>(
    'campaign_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES campaigns (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentValueMeta = const VerificationMeta(
    'currentValue',
  );
  @override
  late final GeneratedColumn<double> currentValue = GeneratedColumn<double>(
    'current_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetValueMeta = const VerificationMeta(
    'targetValue',
  );
  @override
  late final GeneratedColumn<double> targetValue = GeneratedColumn<double>(
    'target_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _directionMeta = const VerificationMeta(
    'direction',
  );
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
    'direction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkedMetricMeta = const VerificationMeta(
    'linkedMetric',
  );
  @override
  late final GeneratedColumn<String> linkedMetric = GeneratedColumn<String>(
    'linked_metric',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSeedContentMeta = const VerificationMeta(
    'isSeedContent',
  );
  @override
  late final GeneratedColumn<bool> isSeedContent = GeneratedColumn<bool>(
    'is_seed_content',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_seed_content" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    campaignId,
    name,
    category,
    currentValue,
    targetValue,
    unit,
    direction,
    linkedMetric,
    targetDate,
    isSeedContent,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('campaign_id')) {
      context.handle(
        _campaignIdMeta,
        campaignId.isAcceptableOrUnknown(data['campaign_id']!, _campaignIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('current_value')) {
      context.handle(
        _currentValueMeta,
        currentValue.isAcceptableOrUnknown(
          data['current_value']!,
          _currentValueMeta,
        ),
      );
    }
    if (data.containsKey('target_value')) {
      context.handle(
        _targetValueMeta,
        targetValue.isAcceptableOrUnknown(
          data['target_value']!,
          _targetValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetValueMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(
        _directionMeta,
        direction.isAcceptableOrUnknown(data['direction']!, _directionMeta),
      );
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('linked_metric')) {
      context.handle(
        _linkedMetricMeta,
        linkedMetric.isAcceptableOrUnknown(
          data['linked_metric']!,
          _linkedMetricMeta,
        ),
      );
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('is_seed_content')) {
      context.handle(
        _isSeedContentMeta,
        isSeedContent.isAcceptableOrUnknown(
          data['is_seed_content']!,
          _isSeedContentMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      campaignId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      currentValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_value'],
      ),
      targetValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_value'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      direction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direction'],
      )!,
      linkedMetric: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_metric'],
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_date'],
      ),
      isSeedContent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_seed_content'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final String id;
  final String? campaignId;
  final String name;
  final String category;
  final double? currentValue;
  final double targetValue;
  final String unit;
  final String direction;
  final String? linkedMetric;
  final DateTime? targetDate;
  final bool isSeedContent;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Goal({
    required this.id,
    this.campaignId,
    required this.name,
    required this.category,
    this.currentValue,
    required this.targetValue,
    required this.unit,
    required this.direction,
    this.linkedMetric,
    this.targetDate,
    required this.isSeedContent,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || campaignId != null) {
      map['campaign_id'] = Variable<String>(campaignId);
    }
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || currentValue != null) {
      map['current_value'] = Variable<double>(currentValue);
    }
    map['target_value'] = Variable<double>(targetValue);
    map['unit'] = Variable<String>(unit);
    map['direction'] = Variable<String>(direction);
    if (!nullToAbsent || linkedMetric != null) {
      map['linked_metric'] = Variable<String>(linkedMetric);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<DateTime>(targetDate);
    }
    map['is_seed_content'] = Variable<bool>(isSeedContent);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      campaignId: campaignId == null && nullToAbsent
          ? const Value.absent()
          : Value(campaignId),
      name: Value(name),
      category: Value(category),
      currentValue: currentValue == null && nullToAbsent
          ? const Value.absent()
          : Value(currentValue),
      targetValue: Value(targetValue),
      unit: Value(unit),
      direction: Value(direction),
      linkedMetric: linkedMetric == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedMetric),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      isSeedContent: Value(isSeedContent),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<String>(json['id']),
      campaignId: serializer.fromJson<String?>(json['campaignId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      currentValue: serializer.fromJson<double?>(json['currentValue']),
      targetValue: serializer.fromJson<double>(json['targetValue']),
      unit: serializer.fromJson<String>(json['unit']),
      direction: serializer.fromJson<String>(json['direction']),
      linkedMetric: serializer.fromJson<String?>(json['linkedMetric']),
      targetDate: serializer.fromJson<DateTime?>(json['targetDate']),
      isSeedContent: serializer.fromJson<bool>(json['isSeedContent']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'campaignId': serializer.toJson<String?>(campaignId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'currentValue': serializer.toJson<double?>(currentValue),
      'targetValue': serializer.toJson<double>(targetValue),
      'unit': serializer.toJson<String>(unit),
      'direction': serializer.toJson<String>(direction),
      'linkedMetric': serializer.toJson<String?>(linkedMetric),
      'targetDate': serializer.toJson<DateTime?>(targetDate),
      'isSeedContent': serializer.toJson<bool>(isSeedContent),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Goal copyWith({
    String? id,
    Value<String?> campaignId = const Value.absent(),
    String? name,
    String? category,
    Value<double?> currentValue = const Value.absent(),
    double? targetValue,
    String? unit,
    String? direction,
    Value<String?> linkedMetric = const Value.absent(),
    Value<DateTime?> targetDate = const Value.absent(),
    bool? isSeedContent,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Goal(
    id: id ?? this.id,
    campaignId: campaignId.present ? campaignId.value : this.campaignId,
    name: name ?? this.name,
    category: category ?? this.category,
    currentValue: currentValue.present ? currentValue.value : this.currentValue,
    targetValue: targetValue ?? this.targetValue,
    unit: unit ?? this.unit,
    direction: direction ?? this.direction,
    linkedMetric: linkedMetric.present ? linkedMetric.value : this.linkedMetric,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    isSeedContent: isSeedContent ?? this.isSeedContent,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      campaignId: data.campaignId.present
          ? data.campaignId.value
          : this.campaignId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      targetValue: data.targetValue.present
          ? data.targetValue.value
          : this.targetValue,
      unit: data.unit.present ? data.unit.value : this.unit,
      direction: data.direction.present ? data.direction.value : this.direction,
      linkedMetric: data.linkedMetric.present
          ? data.linkedMetric.value
          : this.linkedMetric,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      isSeedContent: data.isSeedContent.present
          ? data.isSeedContent.value
          : this.isSeedContent,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('campaignId: $campaignId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('currentValue: $currentValue, ')
          ..write('targetValue: $targetValue, ')
          ..write('unit: $unit, ')
          ..write('direction: $direction, ')
          ..write('linkedMetric: $linkedMetric, ')
          ..write('targetDate: $targetDate, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    campaignId,
    name,
    category,
    currentValue,
    targetValue,
    unit,
    direction,
    linkedMetric,
    targetDate,
    isSeedContent,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.campaignId == this.campaignId &&
          other.name == this.name &&
          other.category == this.category &&
          other.currentValue == this.currentValue &&
          other.targetValue == this.targetValue &&
          other.unit == this.unit &&
          other.direction == this.direction &&
          other.linkedMetric == this.linkedMetric &&
          other.targetDate == this.targetDate &&
          other.isSeedContent == this.isSeedContent &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<String> id;
  final Value<String?> campaignId;
  final Value<String> name;
  final Value<String> category;
  final Value<double?> currentValue;
  final Value<double> targetValue;
  final Value<String> unit;
  final Value<String> direction;
  final Value<String?> linkedMetric;
  final Value<DateTime?> targetDate;
  final Value<bool> isSeedContent;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.campaignId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.unit = const Value.absent(),
    this.direction = const Value.absent(),
    this.linkedMetric = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    this.campaignId = const Value.absent(),
    required String name,
    required String category,
    this.currentValue = const Value.absent(),
    required double targetValue,
    required String unit,
    required String direction,
    this.linkedMetric = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.isSeedContent = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       targetValue = Value(targetValue),
       unit = Value(unit),
       direction = Value(direction),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Goal> custom({
    Expression<String>? id,
    Expression<String>? campaignId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<double>? currentValue,
    Expression<double>? targetValue,
    Expression<String>? unit,
    Expression<String>? direction,
    Expression<String>? linkedMetric,
    Expression<DateTime>? targetDate,
    Expression<bool>? isSeedContent,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (campaignId != null) 'campaign_id': campaignId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (currentValue != null) 'current_value': currentValue,
      if (targetValue != null) 'target_value': targetValue,
      if (unit != null) 'unit': unit,
      if (direction != null) 'direction': direction,
      if (linkedMetric != null) 'linked_metric': linkedMetric,
      if (targetDate != null) 'target_date': targetDate,
      if (isSeedContent != null) 'is_seed_content': isSeedContent,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith({
    Value<String>? id,
    Value<String?>? campaignId,
    Value<String>? name,
    Value<String>? category,
    Value<double?>? currentValue,
    Value<double>? targetValue,
    Value<String>? unit,
    Value<String>? direction,
    Value<String?>? linkedMetric,
    Value<DateTime?>? targetDate,
    Value<bool>? isSeedContent,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      name: name ?? this.name,
      category: category ?? this.category,
      currentValue: currentValue ?? this.currentValue,
      targetValue: targetValue ?? this.targetValue,
      unit: unit ?? this.unit,
      direction: direction ?? this.direction,
      linkedMetric: linkedMetric ?? this.linkedMetric,
      targetDate: targetDate ?? this.targetDate,
      isSeedContent: isSeedContent ?? this.isSeedContent,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (campaignId.present) {
      map['campaign_id'] = Variable<String>(campaignId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<double>(currentValue.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<double>(targetValue.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (linkedMetric.present) {
      map['linked_metric'] = Variable<String>(linkedMetric.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (isSeedContent.present) {
      map['is_seed_content'] = Variable<bool>(isSeedContent.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('campaignId: $campaignId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('currentValue: $currentValue, ')
          ..write('targetValue: $targetValue, ')
          ..write('unit: $unit, ')
          ..write('direction: $direction, ')
          ..write('linkedMetric: $linkedMetric, ')
          ..write('targetDate: $targetDate, ')
          ..write('isSeedContent: $isSeedContent, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeedRunsTable extends SeedRuns with TableInfo<$SeedRunsTable, SeedRun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeedRunsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seedNameMeta = const VerificationMeta(
    'seedName',
  );
  @override
  late final GeneratedColumn<String> seedName = GeneratedColumn<String>(
    'seed_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _seedVersionMeta = const VerificationMeta(
    'seedVersion',
  );
  @override
  late final GeneratedColumn<int> seedVersion = GeneratedColumn<int>(
    'seed_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appliedAtMeta = const VerificationMeta(
    'appliedAt',
  );
  @override
  late final GeneratedColumn<DateTime> appliedAt = GeneratedColumn<DateTime>(
    'applied_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, seedName, seedVersion, appliedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seed_runs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeedRun> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('seed_name')) {
      context.handle(
        _seedNameMeta,
        seedName.isAcceptableOrUnknown(data['seed_name']!, _seedNameMeta),
      );
    } else if (isInserting) {
      context.missing(_seedNameMeta);
    }
    if (data.containsKey('seed_version')) {
      context.handle(
        _seedVersionMeta,
        seedVersion.isAcceptableOrUnknown(
          data['seed_version']!,
          _seedVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seedVersionMeta);
    }
    if (data.containsKey('applied_at')) {
      context.handle(
        _appliedAtMeta,
        appliedAt.isAcceptableOrUnknown(data['applied_at']!, _appliedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_appliedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SeedRun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeedRun(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      seedName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}seed_name'],
      )!,
      seedVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seed_version'],
      )!,
      appliedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}applied_at'],
      )!,
    );
  }

  @override
  $SeedRunsTable createAlias(String alias) {
    return $SeedRunsTable(attachedDatabase, alias);
  }
}

class SeedRun extends DataClass implements Insertable<SeedRun> {
  final String id;
  final String seedName;
  final int seedVersion;
  final DateTime appliedAt;
  const SeedRun({
    required this.id,
    required this.seedName,
    required this.seedVersion,
    required this.appliedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['seed_name'] = Variable<String>(seedName);
    map['seed_version'] = Variable<int>(seedVersion);
    map['applied_at'] = Variable<DateTime>(appliedAt);
    return map;
  }

  SeedRunsCompanion toCompanion(bool nullToAbsent) {
    return SeedRunsCompanion(
      id: Value(id),
      seedName: Value(seedName),
      seedVersion: Value(seedVersion),
      appliedAt: Value(appliedAt),
    );
  }

  factory SeedRun.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeedRun(
      id: serializer.fromJson<String>(json['id']),
      seedName: serializer.fromJson<String>(json['seedName']),
      seedVersion: serializer.fromJson<int>(json['seedVersion']),
      appliedAt: serializer.fromJson<DateTime>(json['appliedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'seedName': serializer.toJson<String>(seedName),
      'seedVersion': serializer.toJson<int>(seedVersion),
      'appliedAt': serializer.toJson<DateTime>(appliedAt),
    };
  }

  SeedRun copyWith({
    String? id,
    String? seedName,
    int? seedVersion,
    DateTime? appliedAt,
  }) => SeedRun(
    id: id ?? this.id,
    seedName: seedName ?? this.seedName,
    seedVersion: seedVersion ?? this.seedVersion,
    appliedAt: appliedAt ?? this.appliedAt,
  );
  SeedRun copyWithCompanion(SeedRunsCompanion data) {
    return SeedRun(
      id: data.id.present ? data.id.value : this.id,
      seedName: data.seedName.present ? data.seedName.value : this.seedName,
      seedVersion: data.seedVersion.present
          ? data.seedVersion.value
          : this.seedVersion,
      appliedAt: data.appliedAt.present ? data.appliedAt.value : this.appliedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SeedRun(')
          ..write('id: $id, ')
          ..write('seedName: $seedName, ')
          ..write('seedVersion: $seedVersion, ')
          ..write('appliedAt: $appliedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, seedName, seedVersion, appliedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeedRun &&
          other.id == this.id &&
          other.seedName == this.seedName &&
          other.seedVersion == this.seedVersion &&
          other.appliedAt == this.appliedAt);
}

class SeedRunsCompanion extends UpdateCompanion<SeedRun> {
  final Value<String> id;
  final Value<String> seedName;
  final Value<int> seedVersion;
  final Value<DateTime> appliedAt;
  final Value<int> rowid;
  const SeedRunsCompanion({
    this.id = const Value.absent(),
    this.seedName = const Value.absent(),
    this.seedVersion = const Value.absent(),
    this.appliedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeedRunsCompanion.insert({
    required String id,
    required String seedName,
    required int seedVersion,
    required DateTime appliedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       seedName = Value(seedName),
       seedVersion = Value(seedVersion),
       appliedAt = Value(appliedAt);
  static Insertable<SeedRun> custom({
    Expression<String>? id,
    Expression<String>? seedName,
    Expression<int>? seedVersion,
    Expression<DateTime>? appliedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seedName != null) 'seed_name': seedName,
      if (seedVersion != null) 'seed_version': seedVersion,
      if (appliedAt != null) 'applied_at': appliedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeedRunsCompanion copyWith({
    Value<String>? id,
    Value<String>? seedName,
    Value<int>? seedVersion,
    Value<DateTime>? appliedAt,
    Value<int>? rowid,
  }) {
    return SeedRunsCompanion(
      id: id ?? this.id,
      seedName: seedName ?? this.seedName,
      seedVersion: seedVersion ?? this.seedVersion,
      appliedAt: appliedAt ?? this.appliedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (seedName.present) {
      map['seed_name'] = Variable<String>(seedName.value);
    }
    if (seedVersion.present) {
      map['seed_version'] = Variable<int>(seedVersion.value);
    }
    if (appliedAt.present) {
      map['applied_at'] = Variable<DateTime>(appliedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeedRunsCompanion(')
          ..write('id: $id, ')
          ..write('seedName: $seedName, ')
          ..write('seedVersion: $seedVersion, ')
          ..write('appliedAt: $appliedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetsTable extends Pets with TableInfo<$PetsTable, Pet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Ember'),
  );
  static const VerificationMeta _speciesKeyMeta = const VerificationMeta(
    'speciesKey',
  );
  @override
  late final GeneratedColumn<String> speciesKey = GeneratedColumn<String>(
    'species_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('ember-fox'),
  );
  static const VerificationMeta _evolutionStageMeta = const VerificationMeta(
    'evolutionStage',
  );
  @override
  late final GeneratedColumn<int> evolutionStage = GeneratedColumn<int>(
    'evolution_stage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bondLevelMeta = const VerificationMeta(
    'bondLevel',
  );
  @override
  late final GeneratedColumn<int> bondLevel = GeneratedColumn<int>(
    'bond_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bondXpMeta = const VerificationMeta('bondXp');
  @override
  late final GeneratedColumn<int> bondXp = GeneratedColumn<int>(
    'bond_xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
    'mood',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('content'),
  );
  static const VerificationMeta _energyPercentMeta = const VerificationMeta(
    'energyPercent',
  );
  @override
  late final GeneratedColumn<double> energyPercent = GeneratedColumn<double>(
    'energy_percent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _lastTreatAtMeta = const VerificationMeta(
    'lastTreatAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastTreatAt = GeneratedColumn<DateTime>(
    'last_treat_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastPlayAtMeta = const VerificationMeta(
    'lastPlayAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPlayAt = GeneratedColumn<DateTime>(
    'last_play_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastRestAtMeta = const VerificationMeta(
    'lastRestAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastRestAt = GeneratedColumn<DateTime>(
    'last_rest_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    speciesKey,
    evolutionStage,
    bondLevel,
    bondXp,
    mood,
    energyPercent,
    lastTreatAt,
    lastPlayAt,
    lastRestAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('species_key')) {
      context.handle(
        _speciesKeyMeta,
        speciesKey.isAcceptableOrUnknown(data['species_key']!, _speciesKeyMeta),
      );
    }
    if (data.containsKey('evolution_stage')) {
      context.handle(
        _evolutionStageMeta,
        evolutionStage.isAcceptableOrUnknown(
          data['evolution_stage']!,
          _evolutionStageMeta,
        ),
      );
    }
    if (data.containsKey('bond_level')) {
      context.handle(
        _bondLevelMeta,
        bondLevel.isAcceptableOrUnknown(data['bond_level']!, _bondLevelMeta),
      );
    }
    if (data.containsKey('bond_xp')) {
      context.handle(
        _bondXpMeta,
        bondXp.isAcceptableOrUnknown(data['bond_xp']!, _bondXpMeta),
      );
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('energy_percent')) {
      context.handle(
        _energyPercentMeta,
        energyPercent.isAcceptableOrUnknown(
          data['energy_percent']!,
          _energyPercentMeta,
        ),
      );
    }
    if (data.containsKey('last_treat_at')) {
      context.handle(
        _lastTreatAtMeta,
        lastTreatAt.isAcceptableOrUnknown(
          data['last_treat_at']!,
          _lastTreatAtMeta,
        ),
      );
    }
    if (data.containsKey('last_play_at')) {
      context.handle(
        _lastPlayAtMeta,
        lastPlayAt.isAcceptableOrUnknown(
          data['last_play_at']!,
          _lastPlayAtMeta,
        ),
      );
    }
    if (data.containsKey('last_rest_at')) {
      context.handle(
        _lastRestAtMeta,
        lastRestAt.isAcceptableOrUnknown(
          data['last_rest_at']!,
          _lastRestAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      speciesKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species_key'],
      )!,
      evolutionStage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}evolution_stage'],
      )!,
      bondLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bond_level'],
      )!,
      bondXp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bond_xp'],
      )!,
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood'],
      )!,
      energyPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}energy_percent'],
      )!,
      lastTreatAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_treat_at'],
      ),
      lastPlayAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_play_at'],
      ),
      lastRestAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_rest_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PetsTable createAlias(String alias) {
    return $PetsTable(attachedDatabase, alias);
  }
}

class Pet extends DataClass implements Insertable<Pet> {
  final String id;
  final String name;
  final String speciesKey;
  final int evolutionStage;
  final int bondLevel;
  final int bondXp;
  final String mood;
  final double energyPercent;
  final DateTime? lastTreatAt;
  final DateTime? lastPlayAt;
  final DateTime? lastRestAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Pet({
    required this.id,
    required this.name,
    required this.speciesKey,
    required this.evolutionStage,
    required this.bondLevel,
    required this.bondXp,
    required this.mood,
    required this.energyPercent,
    this.lastTreatAt,
    this.lastPlayAt,
    this.lastRestAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['species_key'] = Variable<String>(speciesKey);
    map['evolution_stage'] = Variable<int>(evolutionStage);
    map['bond_level'] = Variable<int>(bondLevel);
    map['bond_xp'] = Variable<int>(bondXp);
    map['mood'] = Variable<String>(mood);
    map['energy_percent'] = Variable<double>(energyPercent);
    if (!nullToAbsent || lastTreatAt != null) {
      map['last_treat_at'] = Variable<DateTime>(lastTreatAt);
    }
    if (!nullToAbsent || lastPlayAt != null) {
      map['last_play_at'] = Variable<DateTime>(lastPlayAt);
    }
    if (!nullToAbsent || lastRestAt != null) {
      map['last_rest_at'] = Variable<DateTime>(lastRestAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PetsCompanion toCompanion(bool nullToAbsent) {
    return PetsCompanion(
      id: Value(id),
      name: Value(name),
      speciesKey: Value(speciesKey),
      evolutionStage: Value(evolutionStage),
      bondLevel: Value(bondLevel),
      bondXp: Value(bondXp),
      mood: Value(mood),
      energyPercent: Value(energyPercent),
      lastTreatAt: lastTreatAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTreatAt),
      lastPlayAt: lastPlayAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPlayAt),
      lastRestAt: lastRestAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRestAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Pet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pet(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      speciesKey: serializer.fromJson<String>(json['speciesKey']),
      evolutionStage: serializer.fromJson<int>(json['evolutionStage']),
      bondLevel: serializer.fromJson<int>(json['bondLevel']),
      bondXp: serializer.fromJson<int>(json['bondXp']),
      mood: serializer.fromJson<String>(json['mood']),
      energyPercent: serializer.fromJson<double>(json['energyPercent']),
      lastTreatAt: serializer.fromJson<DateTime?>(json['lastTreatAt']),
      lastPlayAt: serializer.fromJson<DateTime?>(json['lastPlayAt']),
      lastRestAt: serializer.fromJson<DateTime?>(json['lastRestAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'speciesKey': serializer.toJson<String>(speciesKey),
      'evolutionStage': serializer.toJson<int>(evolutionStage),
      'bondLevel': serializer.toJson<int>(bondLevel),
      'bondXp': serializer.toJson<int>(bondXp),
      'mood': serializer.toJson<String>(mood),
      'energyPercent': serializer.toJson<double>(energyPercent),
      'lastTreatAt': serializer.toJson<DateTime?>(lastTreatAt),
      'lastPlayAt': serializer.toJson<DateTime?>(lastPlayAt),
      'lastRestAt': serializer.toJson<DateTime?>(lastRestAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Pet copyWith({
    String? id,
    String? name,
    String? speciesKey,
    int? evolutionStage,
    int? bondLevel,
    int? bondXp,
    String? mood,
    double? energyPercent,
    Value<DateTime?> lastTreatAt = const Value.absent(),
    Value<DateTime?> lastPlayAt = const Value.absent(),
    Value<DateTime?> lastRestAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Pet(
    id: id ?? this.id,
    name: name ?? this.name,
    speciesKey: speciesKey ?? this.speciesKey,
    evolutionStage: evolutionStage ?? this.evolutionStage,
    bondLevel: bondLevel ?? this.bondLevel,
    bondXp: bondXp ?? this.bondXp,
    mood: mood ?? this.mood,
    energyPercent: energyPercent ?? this.energyPercent,
    lastTreatAt: lastTreatAt.present ? lastTreatAt.value : this.lastTreatAt,
    lastPlayAt: lastPlayAt.present ? lastPlayAt.value : this.lastPlayAt,
    lastRestAt: lastRestAt.present ? lastRestAt.value : this.lastRestAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Pet copyWithCompanion(PetsCompanion data) {
    return Pet(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      speciesKey: data.speciesKey.present
          ? data.speciesKey.value
          : this.speciesKey,
      evolutionStage: data.evolutionStage.present
          ? data.evolutionStage.value
          : this.evolutionStage,
      bondLevel: data.bondLevel.present ? data.bondLevel.value : this.bondLevel,
      bondXp: data.bondXp.present ? data.bondXp.value : this.bondXp,
      mood: data.mood.present ? data.mood.value : this.mood,
      energyPercent: data.energyPercent.present
          ? data.energyPercent.value
          : this.energyPercent,
      lastTreatAt: data.lastTreatAt.present
          ? data.lastTreatAt.value
          : this.lastTreatAt,
      lastPlayAt: data.lastPlayAt.present
          ? data.lastPlayAt.value
          : this.lastPlayAt,
      lastRestAt: data.lastRestAt.present
          ? data.lastRestAt.value
          : this.lastRestAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pet(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('speciesKey: $speciesKey, ')
          ..write('evolutionStage: $evolutionStage, ')
          ..write('bondLevel: $bondLevel, ')
          ..write('bondXp: $bondXp, ')
          ..write('mood: $mood, ')
          ..write('energyPercent: $energyPercent, ')
          ..write('lastTreatAt: $lastTreatAt, ')
          ..write('lastPlayAt: $lastPlayAt, ')
          ..write('lastRestAt: $lastRestAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    speciesKey,
    evolutionStage,
    bondLevel,
    bondXp,
    mood,
    energyPercent,
    lastTreatAt,
    lastPlayAt,
    lastRestAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pet &&
          other.id == this.id &&
          other.name == this.name &&
          other.speciesKey == this.speciesKey &&
          other.evolutionStage == this.evolutionStage &&
          other.bondLevel == this.bondLevel &&
          other.bondXp == this.bondXp &&
          other.mood == this.mood &&
          other.energyPercent == this.energyPercent &&
          other.lastTreatAt == this.lastTreatAt &&
          other.lastPlayAt == this.lastPlayAt &&
          other.lastRestAt == this.lastRestAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PetsCompanion extends UpdateCompanion<Pet> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> speciesKey;
  final Value<int> evolutionStage;
  final Value<int> bondLevel;
  final Value<int> bondXp;
  final Value<String> mood;
  final Value<double> energyPercent;
  final Value<DateTime?> lastTreatAt;
  final Value<DateTime?> lastPlayAt;
  final Value<DateTime?> lastRestAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.speciesKey = const Value.absent(),
    this.evolutionStage = const Value.absent(),
    this.bondLevel = const Value.absent(),
    this.bondXp = const Value.absent(),
    this.mood = const Value.absent(),
    this.energyPercent = const Value.absent(),
    this.lastTreatAt = const Value.absent(),
    this.lastPlayAt = const Value.absent(),
    this.lastRestAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetsCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.speciesKey = const Value.absent(),
    this.evolutionStage = const Value.absent(),
    this.bondLevel = const Value.absent(),
    this.bondXp = const Value.absent(),
    this.mood = const Value.absent(),
    this.energyPercent = const Value.absent(),
    this.lastTreatAt = const Value.absent(),
    this.lastPlayAt = const Value.absent(),
    this.lastRestAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Pet> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? speciesKey,
    Expression<int>? evolutionStage,
    Expression<int>? bondLevel,
    Expression<int>? bondXp,
    Expression<String>? mood,
    Expression<double>? energyPercent,
    Expression<DateTime>? lastTreatAt,
    Expression<DateTime>? lastPlayAt,
    Expression<DateTime>? lastRestAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (speciesKey != null) 'species_key': speciesKey,
      if (evolutionStage != null) 'evolution_stage': evolutionStage,
      if (bondLevel != null) 'bond_level': bondLevel,
      if (bondXp != null) 'bond_xp': bondXp,
      if (mood != null) 'mood': mood,
      if (energyPercent != null) 'energy_percent': energyPercent,
      if (lastTreatAt != null) 'last_treat_at': lastTreatAt,
      if (lastPlayAt != null) 'last_play_at': lastPlayAt,
      if (lastRestAt != null) 'last_rest_at': lastRestAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? speciesKey,
    Value<int>? evolutionStage,
    Value<int>? bondLevel,
    Value<int>? bondXp,
    Value<String>? mood,
    Value<double>? energyPercent,
    Value<DateTime?>? lastTreatAt,
    Value<DateTime?>? lastPlayAt,
    Value<DateTime?>? lastRestAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      speciesKey: speciesKey ?? this.speciesKey,
      evolutionStage: evolutionStage ?? this.evolutionStage,
      bondLevel: bondLevel ?? this.bondLevel,
      bondXp: bondXp ?? this.bondXp,
      mood: mood ?? this.mood,
      energyPercent: energyPercent ?? this.energyPercent,
      lastTreatAt: lastTreatAt ?? this.lastTreatAt,
      lastPlayAt: lastPlayAt ?? this.lastPlayAt,
      lastRestAt: lastRestAt ?? this.lastRestAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (speciesKey.present) {
      map['species_key'] = Variable<String>(speciesKey.value);
    }
    if (evolutionStage.present) {
      map['evolution_stage'] = Variable<int>(evolutionStage.value);
    }
    if (bondLevel.present) {
      map['bond_level'] = Variable<int>(bondLevel.value);
    }
    if (bondXp.present) {
      map['bond_xp'] = Variable<int>(bondXp.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
    }
    if (energyPercent.present) {
      map['energy_percent'] = Variable<double>(energyPercent.value);
    }
    if (lastTreatAt.present) {
      map['last_treat_at'] = Variable<DateTime>(lastTreatAt.value);
    }
    if (lastPlayAt.present) {
      map['last_play_at'] = Variable<DateTime>(lastPlayAt.value);
    }
    if (lastRestAt.present) {
      map['last_rest_at'] = Variable<DateTime>(lastRestAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('speciesKey: $speciesKey, ')
          ..write('evolutionStage: $evolutionStage, ')
          ..write('bondLevel: $bondLevel, ')
          ..write('bondXp: $bondXp, ')
          ..write('mood: $mood, ')
          ..write('energyPercent: $energyPercent, ')
          ..write('lastTreatAt: $lastTreatAt, ')
          ..write('lastPlayAt: $lastPlayAt, ')
          ..write('lastRestAt: $lastRestAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetEvolutionHistoryTable extends PetEvolutionHistory
    with TableInfo<$PetEvolutionHistoryTable, PetEvolutionHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetEvolutionHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pets (id)',
    ),
  );
  static const VerificationMeta _fromStageMeta = const VerificationMeta(
    'fromStage',
  );
  @override
  late final GeneratedColumn<int> fromStage = GeneratedColumn<int>(
    'from_stage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toStageMeta = const VerificationMeta(
    'toStage',
  );
  @override
  late final GeneratedColumn<int> toStage = GeneratedColumn<int>(
    'to_stage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _evolvedAtMeta = const VerificationMeta(
    'evolvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> evolvedAt = GeneratedColumn<DateTime>(
    'evolved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    fromStage,
    toStage,
    evolvedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pet_evolution_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<PetEvolutionHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('from_stage')) {
      context.handle(
        _fromStageMeta,
        fromStage.isAcceptableOrUnknown(data['from_stage']!, _fromStageMeta),
      );
    } else if (isInserting) {
      context.missing(_fromStageMeta);
    }
    if (data.containsKey('to_stage')) {
      context.handle(
        _toStageMeta,
        toStage.isAcceptableOrUnknown(data['to_stage']!, _toStageMeta),
      );
    } else if (isInserting) {
      context.missing(_toStageMeta);
    }
    if (data.containsKey('evolved_at')) {
      context.handle(
        _evolvedAtMeta,
        evolvedAt.isAcceptableOrUnknown(data['evolved_at']!, _evolvedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_evolvedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PetEvolutionHistoryData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PetEvolutionHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      fromStage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}from_stage'],
      )!,
      toStage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_stage'],
      )!,
      evolvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}evolved_at'],
      )!,
    );
  }

  @override
  $PetEvolutionHistoryTable createAlias(String alias) {
    return $PetEvolutionHistoryTable(attachedDatabase, alias);
  }
}

class PetEvolutionHistoryData extends DataClass
    implements Insertable<PetEvolutionHistoryData> {
  final String id;
  final String petId;
  final int fromStage;
  final int toStage;
  final DateTime evolvedAt;
  const PetEvolutionHistoryData({
    required this.id,
    required this.petId,
    required this.fromStage,
    required this.toStage,
    required this.evolvedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['from_stage'] = Variable<int>(fromStage);
    map['to_stage'] = Variable<int>(toStage);
    map['evolved_at'] = Variable<DateTime>(evolvedAt);
    return map;
  }

  PetEvolutionHistoryCompanion toCompanion(bool nullToAbsent) {
    return PetEvolutionHistoryCompanion(
      id: Value(id),
      petId: Value(petId),
      fromStage: Value(fromStage),
      toStage: Value(toStage),
      evolvedAt: Value(evolvedAt),
    );
  }

  factory PetEvolutionHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PetEvolutionHistoryData(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      fromStage: serializer.fromJson<int>(json['fromStage']),
      toStage: serializer.fromJson<int>(json['toStage']),
      evolvedAt: serializer.fromJson<DateTime>(json['evolvedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'fromStage': serializer.toJson<int>(fromStage),
      'toStage': serializer.toJson<int>(toStage),
      'evolvedAt': serializer.toJson<DateTime>(evolvedAt),
    };
  }

  PetEvolutionHistoryData copyWith({
    String? id,
    String? petId,
    int? fromStage,
    int? toStage,
    DateTime? evolvedAt,
  }) => PetEvolutionHistoryData(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    fromStage: fromStage ?? this.fromStage,
    toStage: toStage ?? this.toStage,
    evolvedAt: evolvedAt ?? this.evolvedAt,
  );
  PetEvolutionHistoryData copyWithCompanion(PetEvolutionHistoryCompanion data) {
    return PetEvolutionHistoryData(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      fromStage: data.fromStage.present ? data.fromStage.value : this.fromStage,
      toStage: data.toStage.present ? data.toStage.value : this.toStage,
      evolvedAt: data.evolvedAt.present ? data.evolvedAt.value : this.evolvedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PetEvolutionHistoryData(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('fromStage: $fromStage, ')
          ..write('toStage: $toStage, ')
          ..write('evolvedAt: $evolvedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, petId, fromStage, toStage, evolvedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PetEvolutionHistoryData &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.fromStage == this.fromStage &&
          other.toStage == this.toStage &&
          other.evolvedAt == this.evolvedAt);
}

class PetEvolutionHistoryCompanion
    extends UpdateCompanion<PetEvolutionHistoryData> {
  final Value<String> id;
  final Value<String> petId;
  final Value<int> fromStage;
  final Value<int> toStage;
  final Value<DateTime> evolvedAt;
  final Value<int> rowid;
  const PetEvolutionHistoryCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.fromStage = const Value.absent(),
    this.toStage = const Value.absent(),
    this.evolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetEvolutionHistoryCompanion.insert({
    required String id,
    required String petId,
    required int fromStage,
    required int toStage,
    required DateTime evolvedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       fromStage = Value(fromStage),
       toStage = Value(toStage),
       evolvedAt = Value(evolvedAt);
  static Insertable<PetEvolutionHistoryData> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<int>? fromStage,
    Expression<int>? toStage,
    Expression<DateTime>? evolvedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (fromStage != null) 'from_stage': fromStage,
      if (toStage != null) 'to_stage': toStage,
      if (evolvedAt != null) 'evolved_at': evolvedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetEvolutionHistoryCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<int>? fromStage,
    Value<int>? toStage,
    Value<DateTime>? evolvedAt,
    Value<int>? rowid,
  }) {
    return PetEvolutionHistoryCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      fromStage: fromStage ?? this.fromStage,
      toStage: toStage ?? this.toStage,
      evolvedAt: evolvedAt ?? this.evolvedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (fromStage.present) {
      map['from_stage'] = Variable<int>(fromStage.value);
    }
    if (toStage.present) {
      map['to_stage'] = Variable<int>(toStage.value);
    }
    if (evolvedAt.present) {
      map['evolved_at'] = Variable<DateTime>(evolvedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetEvolutionHistoryCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('fromStage: $fromStage, ')
          ..write('toStage: $toStage, ')
          ..write('evolvedAt: $evolvedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $CampaignsTable campaigns = $CampaignsTable(this);
  late final $WorkoutTemplatesTable workoutTemplates = $WorkoutTemplatesTable(
    this,
  );
  late final $WorkoutTemplateExercisesTable workoutTemplateExercises =
      $WorkoutTemplateExercisesTable(this);
  late final $ProgramTemplatesTable programTemplates = $ProgramTemplatesTable(
    this,
  );
  late final $CampaignPhasesTable campaignPhases = $CampaignPhasesTable(this);
  late final $ScheduledWorkoutsTable scheduledWorkouts =
      $ScheduledWorkoutsTable(this);
  late final $SessionLogsTable sessionLogs = $SessionLogsTable(this);
  late final $ExerciseLogsTable exerciseLogs = $ExerciseLogsTable(this);
  late final $SetLogsTable setLogs = $SetLogsTable(this);
  late final $WorkingWeightsTable workingWeights = $WorkingWeightsTable(this);
  late final $CardioLogsTable cardioLogs = $CardioLogsTable(this);
  late final $ProgressionSuggestionsTable progressionSuggestions =
      $ProgressionSuggestionsTable(this);
  late final $AdventurersTable adventurers = $AdventurersTable(this);
  late final $FitnessEventsTable fitnessEvents = $FitnessEventsTable(this);
  late final $RewardEventsTable rewardEvents = $RewardEventsTable(this);
  late final $XpHistoryTable xpHistory = $XpHistoryTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $AchievementStatesTable achievementStates =
      $AchievementStatesTable(this);
  late final $EquipmentDefinitionsTable equipmentDefinitions =
      $EquipmentDefinitionsTable(this);
  late final $EquipmentInventoryTable equipmentInventory =
      $EquipmentInventoryTable(this);
  late final $EquippedEquipmentTable equippedEquipment =
      $EquippedEquipmentTable(this);
  late final $TitleDefinitionsTable titleDefinitions = $TitleDefinitionsTable(
    this,
  );
  late final $AdventurerTitlesTable adventurerTitles = $AdventurerTitlesTable(
    this,
  );
  late final $BodyweightLogsTable bodyweightLogs = $BodyweightLogsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $SeedRunsTable seedRuns = $SeedRunsTable(this);
  late final $PetsTable pets = $PetsTable(this);
  late final $PetEvolutionHistoryTable petEvolutionHistory =
      $PetEvolutionHistoryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    exercises,
    campaigns,
    workoutTemplates,
    workoutTemplateExercises,
    programTemplates,
    campaignPhases,
    scheduledWorkouts,
    sessionLogs,
    exerciseLogs,
    setLogs,
    workingWeights,
    cardioLogs,
    progressionSuggestions,
    adventurers,
    fitnessEvents,
    rewardEvents,
    xpHistory,
    achievements,
    achievementStates,
    equipmentDefinitions,
    equipmentInventory,
    equippedEquipment,
    titleDefinitions,
    adventurerTitles,
    bodyweightLogs,
    goals,
    seedRuns,
    pets,
    petEvolutionHistory,
  ];
}

typedef $$ExercisesTableCreateCompanionBuilder =
    ExercisesCompanion Function({
      required String id,
      required String name,
      required String category,
      Value<String?> equipment,
      Value<String?> primaryMuscles,
      Value<String?> movementPattern,
      Value<String> defaultUnit,
      Value<bool> isBodyweight,
      Value<bool> isUnilateral,
      Value<bool> isCustom,
      Value<bool> isArchived,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ExercisesTableUpdateCompanionBuilder =
    ExercisesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<String?> equipment,
      Value<String?> primaryMuscles,
      Value<String?> movementPattern,
      Value<String> defaultUnit,
      Value<bool> isBodyweight,
      Value<bool> isUnilateral,
      Value<bool> isCustom,
      Value<bool> isArchived,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $WorkoutTemplateExercisesTable,
    List<WorkoutTemplateExercise>
  >
  _workoutTemplateExercisesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workoutTemplateExercises,
        aliasName: $_aliasNameGenerator(
          db.exercises.id,
          db.workoutTemplateExercises.exerciseId,
        ),
      );

  $$WorkoutTemplateExercisesTableProcessedTableManager
  get workoutTemplateExercisesRefs {
    final manager = $$WorkoutTemplateExercisesTableTableManager(
      $_db,
      $_db.workoutTemplateExercises,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutTemplateExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExerciseLogsTable, List<ExerciseLog>>
  _exerciseLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exerciseLogs,
    aliasName: $_aliasNameGenerator(
      db.exercises.id,
      db.exerciseLogs.exerciseId,
    ),
  );

  $$ExerciseLogsTableProcessedTableManager get exerciseLogsRefs {
    final manager = $$ExerciseLogsTableTableManager(
      $_db,
      $_db.exerciseLogs,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_exerciseLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkingWeightsTable, List<WorkingWeight>>
  _workingWeightsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workingWeights,
    aliasName: $_aliasNameGenerator(
      db.exercises.id,
      db.workingWeights.exerciseId,
    ),
  );

  $$WorkingWeightsTableProcessedTableManager get workingWeightsRefs {
    final manager = $$WorkingWeightsTableTableManager(
      $_db,
      $_db.workingWeights,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_workingWeightsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ProgressionSuggestionsTable,
    List<ProgressionSuggestion>
  >
  _progressionSuggestionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.progressionSuggestions,
        aliasName: $_aliasNameGenerator(
          db.exercises.id,
          db.progressionSuggestions.exerciseId,
        ),
      );

  $$ProgressionSuggestionsTableProcessedTableManager
  get progressionSuggestionsRefs {
    final manager = $$ProgressionSuggestionsTableTableManager(
      $_db,
      $_db.progressionSuggestions,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _progressionSuggestionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get primaryMuscles => $composableBuilder(
    column: $table.primaryMuscles,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get movementPattern => $composableBuilder(
    column: $table.movementPattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBodyweight => $composableBuilder(
    column: $table.isBodyweight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnilateral => $composableBuilder(
    column: $table.isUnilateral,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> workoutTemplateExercisesRefs(
    Expression<bool> Function($$WorkoutTemplateExercisesTableFilterComposer f)
    f,
  ) {
    final $$WorkoutTemplateExercisesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workoutTemplateExercises,
          getReferencedColumn: (t) => t.exerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutTemplateExercisesTableFilterComposer(
                $db: $db,
                $table: $db.workoutTemplateExercises,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> exerciseLogsRefs(
    Expression<bool> Function($$ExerciseLogsTableFilterComposer f) f,
  ) {
    final $$ExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseLogs,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.exerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workingWeightsRefs(
    Expression<bool> Function($$WorkingWeightsTableFilterComposer f) f,
  ) {
    final $$WorkingWeightsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workingWeights,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkingWeightsTableFilterComposer(
            $db: $db,
            $table: $db.workingWeights,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> progressionSuggestionsRefs(
    Expression<bool> Function($$ProgressionSuggestionsTableFilterComposer f) f,
  ) {
    final $$ProgressionSuggestionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.progressionSuggestions,
          getReferencedColumn: (t) => t.exerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgressionSuggestionsTableFilterComposer(
                $db: $db,
                $table: $db.progressionSuggestions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryMuscles => $composableBuilder(
    column: $table.primaryMuscles,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get movementPattern => $composableBuilder(
    column: $table.movementPattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBodyweight => $composableBuilder(
    column: $table.isBodyweight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnilateral => $composableBuilder(
    column: $table.isUnilateral,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<String> get primaryMuscles => $composableBuilder(
    column: $table.primaryMuscles,
    builder: (column) => column,
  );

  GeneratedColumn<String> get movementPattern => $composableBuilder(
    column: $table.movementPattern,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultUnit => $composableBuilder(
    column: $table.defaultUnit,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBodyweight => $composableBuilder(
    column: $table.isBodyweight,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUnilateral => $composableBuilder(
    column: $table.isUnilateral,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> workoutTemplateExercisesRefs<T extends Object>(
    Expression<T> Function($$WorkoutTemplateExercisesTableAnnotationComposer a)
    f,
  ) {
    final $$WorkoutTemplateExercisesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workoutTemplateExercises,
          getReferencedColumn: (t) => t.exerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutTemplateExercisesTableAnnotationComposer(
                $db: $db,
                $table: $db.workoutTemplateExercises,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> exerciseLogsRefs<T extends Object>(
    Expression<T> Function($$ExerciseLogsTableAnnotationComposer a) f,
  ) {
    final $$ExerciseLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseLogs,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.exerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workingWeightsRefs<T extends Object>(
    Expression<T> Function($$WorkingWeightsTableAnnotationComposer a) f,
  ) {
    final $$WorkingWeightsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workingWeights,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkingWeightsTableAnnotationComposer(
            $db: $db,
            $table: $db.workingWeights,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> progressionSuggestionsRefs<T extends Object>(
    Expression<T> Function($$ProgressionSuggestionsTableAnnotationComposer a) f,
  ) {
    final $$ProgressionSuggestionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.progressionSuggestions,
          getReferencedColumn: (t) => t.exerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgressionSuggestionsTableAnnotationComposer(
                $db: $db,
                $table: $db.progressionSuggestions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          Exercise,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (Exercise, $$ExercisesTableReferences),
          Exercise,
          PrefetchHooks Function({
            bool workoutTemplateExercisesRefs,
            bool exerciseLogsRefs,
            bool workingWeightsRefs,
            bool progressionSuggestionsRefs,
          })
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> equipment = const Value.absent(),
                Value<String?> primaryMuscles = const Value.absent(),
                Value<String?> movementPattern = const Value.absent(),
                Value<String> defaultUnit = const Value.absent(),
                Value<bool> isBodyweight = const Value.absent(),
                Value<bool> isUnilateral = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion(
                id: id,
                name: name,
                category: category,
                equipment: equipment,
                primaryMuscles: primaryMuscles,
                movementPattern: movementPattern,
                defaultUnit: defaultUnit,
                isBodyweight: isBodyweight,
                isUnilateral: isUnilateral,
                isCustom: isCustom,
                isArchived: isArchived,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                Value<String?> equipment = const Value.absent(),
                Value<String?> primaryMuscles = const Value.absent(),
                Value<String?> movementPattern = const Value.absent(),
                Value<String> defaultUnit = const Value.absent(),
                Value<bool> isBodyweight = const Value.absent(),
                Value<bool> isUnilateral = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion.insert(
                id: id,
                name: name,
                category: category,
                equipment: equipment,
                primaryMuscles: primaryMuscles,
                movementPattern: movementPattern,
                defaultUnit: defaultUnit,
                isBodyweight: isBodyweight,
                isUnilateral: isUnilateral,
                isCustom: isCustom,
                isArchived: isArchived,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                workoutTemplateExercisesRefs = false,
                exerciseLogsRefs = false,
                workingWeightsRefs = false,
                progressionSuggestionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutTemplateExercisesRefs)
                      db.workoutTemplateExercises,
                    if (exerciseLogsRefs) db.exerciseLogs,
                    if (workingWeightsRefs) db.workingWeights,
                    if (progressionSuggestionsRefs) db.progressionSuggestions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutTemplateExercisesRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          WorkoutTemplateExercise
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._workoutTemplateExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutTemplateExercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exerciseLogsRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          ExerciseLog
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._exerciseLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workingWeightsRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          WorkingWeight
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._workingWeightsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).workingWeightsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (progressionSuggestionsRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          ProgressionSuggestion
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._progressionSuggestionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).progressionSuggestionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      Exercise,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (Exercise, $$ExercisesTableReferences),
      Exercise,
      PrefetchHooks Function({
        bool workoutTemplateExercisesRefs,
        bool exerciseLogsRefs,
        bool workingWeightsRefs,
        bool progressionSuggestionsRefs,
      })
    >;
typedef $$CampaignsTableCreateCompanionBuilder =
    CampaignsCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      required DateTime startDate,
      required DateTime endDate,
      Value<bool> isActive,
      Value<bool> isSeedContent,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$CampaignsTableUpdateCompanionBuilder =
    CampaignsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<bool> isActive,
      Value<bool> isSeedContent,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$CampaignsTableReferences
    extends BaseReferences<_$AppDatabase, $CampaignsTable, Campaign> {
  $$CampaignsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkoutTemplatesTable, List<WorkoutTemplate>>
  _workoutTemplatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutTemplates,
    aliasName: $_aliasNameGenerator(
      db.campaigns.id,
      db.workoutTemplates.sourceCampaignId,
    ),
  );

  $$WorkoutTemplatesTableProcessedTableManager get workoutTemplatesRefs {
    final manager =
        $$WorkoutTemplatesTableTableManager($_db, $_db.workoutTemplates).filter(
          (f) => f.sourceCampaignId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _workoutTemplatesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProgramTemplatesTable, List<ProgramTemplate>>
  _programTemplatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.programTemplates,
    aliasName: $_aliasNameGenerator(
      db.campaigns.id,
      db.programTemplates.sourceCampaignId,
    ),
  );

  $$ProgramTemplatesTableProcessedTableManager get programTemplatesRefs {
    final manager =
        $$ProgramTemplatesTableTableManager($_db, $_db.programTemplates).filter(
          (f) => f.sourceCampaignId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _programTemplatesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CampaignPhasesTable, List<CampaignPhase>>
  _campaignPhasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.campaignPhases,
    aliasName: $_aliasNameGenerator(
      db.campaigns.id,
      db.campaignPhases.campaignId,
    ),
  );

  $$CampaignPhasesTableProcessedTableManager get campaignPhasesRefs {
    final manager = $$CampaignPhasesTableTableManager(
      $_db,
      $_db.campaignPhases,
    ).filter((f) => f.campaignId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_campaignPhasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScheduledWorkoutsTable, List<ScheduledWorkout>>
  _scheduledWorkoutsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduledWorkouts,
        aliasName: $_aliasNameGenerator(
          db.campaigns.id,
          db.scheduledWorkouts.campaignId,
        ),
      );

  $$ScheduledWorkoutsTableProcessedTableManager get scheduledWorkoutsRefs {
    final manager = $$ScheduledWorkoutsTableTableManager(
      $_db,
      $_db.scheduledWorkouts,
    ).filter((f) => f.campaignId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _scheduledWorkoutsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GoalsTable, List<Goal>> _goalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.goals,
    aliasName: $_aliasNameGenerator(db.campaigns.id, db.goals.campaignId),
  );

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.campaignId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CampaignsTableFilterComposer
    extends Composer<_$AppDatabase, $CampaignsTable> {
  $$CampaignsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> workoutTemplatesRefs(
    Expression<bool> Function($$WorkoutTemplatesTableFilterComposer f) f,
  ) {
    final $$WorkoutTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.sourceCampaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> programTemplatesRefs(
    Expression<bool> Function($$ProgramTemplatesTableFilterComposer f) f,
  ) {
    final $$ProgramTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.programTemplates,
      getReferencedColumn: (t) => t.sourceCampaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.programTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> campaignPhasesRefs(
    Expression<bool> Function($$CampaignPhasesTableFilterComposer f) f,
  ) {
    final $$CampaignPhasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.campaignPhases,
      getReferencedColumn: (t) => t.campaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignPhasesTableFilterComposer(
            $db: $db,
            $table: $db.campaignPhases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scheduledWorkoutsRefs(
    Expression<bool> Function($$ScheduledWorkoutsTableFilterComposer f) f,
  ) {
    final $$ScheduledWorkoutsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduledWorkouts,
      getReferencedColumn: (t) => t.campaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledWorkoutsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledWorkouts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> goalsRefs(
    Expression<bool> Function($$GoalsTableFilterComposer f) f,
  ) {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.campaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CampaignsTableOrderingComposer
    extends Composer<_$AppDatabase, $CampaignsTable> {
  $$CampaignsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CampaignsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CampaignsTable> {
  $$CampaignsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> workoutTemplatesRefs<T extends Object>(
    Expression<T> Function($$WorkoutTemplatesTableAnnotationComposer a) f,
  ) {
    final $$WorkoutTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.sourceCampaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> programTemplatesRefs<T extends Object>(
    Expression<T> Function($$ProgramTemplatesTableAnnotationComposer a) f,
  ) {
    final $$ProgramTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.programTemplates,
      getReferencedColumn: (t) => t.sourceCampaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.programTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> campaignPhasesRefs<T extends Object>(
    Expression<T> Function($$CampaignPhasesTableAnnotationComposer a) f,
  ) {
    final $$CampaignPhasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.campaignPhases,
      getReferencedColumn: (t) => t.campaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignPhasesTableAnnotationComposer(
            $db: $db,
            $table: $db.campaignPhases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scheduledWorkoutsRefs<T extends Object>(
    Expression<T> Function($$ScheduledWorkoutsTableAnnotationComposer a) f,
  ) {
    final $$ScheduledWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduledWorkouts,
          getReferencedColumn: (t) => t.campaignId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledWorkoutsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledWorkouts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> goalsRefs<T extends Object>(
    Expression<T> Function($$GoalsTableAnnotationComposer a) f,
  ) {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.campaignId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CampaignsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CampaignsTable,
          Campaign,
          $$CampaignsTableFilterComposer,
          $$CampaignsTableOrderingComposer,
          $$CampaignsTableAnnotationComposer,
          $$CampaignsTableCreateCompanionBuilder,
          $$CampaignsTableUpdateCompanionBuilder,
          (Campaign, $$CampaignsTableReferences),
          Campaign,
          PrefetchHooks Function({
            bool workoutTemplatesRefs,
            bool programTemplatesRefs,
            bool campaignPhasesRefs,
            bool scheduledWorkoutsRefs,
            bool goalsRefs,
          })
        > {
  $$CampaignsTableTableManager(_$AppDatabase db, $CampaignsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CampaignsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CampaignsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CampaignsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CampaignsCompanion(
                id: id,
                name: name,
                description: description,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                isSeedContent: isSeedContent,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                required DateTime startDate,
                required DateTime endDate,
                Value<bool> isActive = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => CampaignsCompanion.insert(
                id: id,
                name: name,
                description: description,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                isSeedContent: isSeedContent,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CampaignsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                workoutTemplatesRefs = false,
                programTemplatesRefs = false,
                campaignPhasesRefs = false,
                scheduledWorkoutsRefs = false,
                goalsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutTemplatesRefs) db.workoutTemplates,
                    if (programTemplatesRefs) db.programTemplates,
                    if (campaignPhasesRefs) db.campaignPhases,
                    if (scheduledWorkoutsRefs) db.scheduledWorkouts,
                    if (goalsRefs) db.goals,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutTemplatesRefs)
                        await $_getPrefetchedData<
                          Campaign,
                          $CampaignsTable,
                          WorkoutTemplate
                        >(
                          currentTable: table,
                          referencedTable: $$CampaignsTableReferences
                              ._workoutTemplatesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CampaignsTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutTemplatesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceCampaignId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (programTemplatesRefs)
                        await $_getPrefetchedData<
                          Campaign,
                          $CampaignsTable,
                          ProgramTemplate
                        >(
                          currentTable: table,
                          referencedTable: $$CampaignsTableReferences
                              ._programTemplatesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CampaignsTableReferences(
                                db,
                                table,
                                p0,
                              ).programTemplatesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceCampaignId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (campaignPhasesRefs)
                        await $_getPrefetchedData<
                          Campaign,
                          $CampaignsTable,
                          CampaignPhase
                        >(
                          currentTable: table,
                          referencedTable: $$CampaignsTableReferences
                              ._campaignPhasesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CampaignsTableReferences(
                                db,
                                table,
                                p0,
                              ).campaignPhasesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.campaignId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduledWorkoutsRefs)
                        await $_getPrefetchedData<
                          Campaign,
                          $CampaignsTable,
                          ScheduledWorkout
                        >(
                          currentTable: table,
                          referencedTable: $$CampaignsTableReferences
                              ._scheduledWorkoutsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CampaignsTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduledWorkoutsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.campaignId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (goalsRefs)
                        await $_getPrefetchedData<
                          Campaign,
                          $CampaignsTable,
                          Goal
                        >(
                          currentTable: table,
                          referencedTable: $$CampaignsTableReferences
                              ._goalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CampaignsTableReferences(
                                db,
                                table,
                                p0,
                              ).goalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.campaignId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CampaignsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CampaignsTable,
      Campaign,
      $$CampaignsTableFilterComposer,
      $$CampaignsTableOrderingComposer,
      $$CampaignsTableAnnotationComposer,
      $$CampaignsTableCreateCompanionBuilder,
      $$CampaignsTableUpdateCompanionBuilder,
      (Campaign, $$CampaignsTableReferences),
      Campaign,
      PrefetchHooks Function({
        bool workoutTemplatesRefs,
        bool programTemplatesRefs,
        bool campaignPhasesRefs,
        bool scheduledWorkoutsRefs,
        bool goalsRefs,
      })
    >;
typedef $$WorkoutTemplatesTableCreateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String?> sourceCampaignId,
      Value<bool> isSeedContent,
      Value<bool> isArchived,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$WorkoutTemplatesTableUpdateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> sourceCampaignId,
      Value<bool> isSeedContent,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$WorkoutTemplatesTableReferences
    extends
        BaseReferences<_$AppDatabase, $WorkoutTemplatesTable, WorkoutTemplate> {
  $$WorkoutTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CampaignsTable _sourceCampaignIdTable(_$AppDatabase db) =>
      db.campaigns.createAlias(
        $_aliasNameGenerator(
          db.workoutTemplates.sourceCampaignId,
          db.campaigns.id,
        ),
      );

  $$CampaignsTableProcessedTableManager? get sourceCampaignId {
    final $_column = $_itemColumn<String>('source_campaign_id');
    if ($_column == null) return null;
    final manager = $$CampaignsTableTableManager(
      $_db,
      $_db.campaigns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceCampaignIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $WorkoutTemplateExercisesTable,
    List<WorkoutTemplateExercise>
  >
  _workoutTemplateExercisesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.workoutTemplateExercises,
        aliasName: $_aliasNameGenerator(
          db.workoutTemplates.id,
          db.workoutTemplateExercises.workoutTemplateId,
        ),
      );

  $$WorkoutTemplateExercisesTableProcessedTableManager
  get workoutTemplateExercisesRefs {
    final manager =
        $$WorkoutTemplateExercisesTableTableManager(
          $_db,
          $_db.workoutTemplateExercises,
        ).filter(
          (f) => f.workoutTemplateId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _workoutTemplateExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScheduledWorkoutsTable, List<ScheduledWorkout>>
  _scheduledWorkoutsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduledWorkouts,
        aliasName: $_aliasNameGenerator(
          db.workoutTemplates.id,
          db.scheduledWorkouts.workoutTemplateId,
        ),
      );

  $$ScheduledWorkoutsTableProcessedTableManager get scheduledWorkoutsRefs {
    final manager =
        $$ScheduledWorkoutsTableTableManager(
          $_db,
          $_db.scheduledWorkouts,
        ).filter(
          (f) => f.workoutTemplateId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _scheduledWorkoutsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SessionLogsTable, List<SessionLog>>
  _sessionLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sessionLogs,
    aliasName: $_aliasNameGenerator(
      db.workoutTemplates.id,
      db.sessionLogs.workoutTemplateId,
    ),
  );

  $$SessionLogsTableProcessedTableManager get sessionLogsRefs {
    final manager = $$SessionLogsTableTableManager($_db, $_db.sessionLogs)
        .filter(
          (f) => f.workoutTemplateId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_sessionLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CampaignsTableFilterComposer get sourceCampaignId {
    final $$CampaignsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCampaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableFilterComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> workoutTemplateExercisesRefs(
    Expression<bool> Function($$WorkoutTemplateExercisesTableFilterComposer f)
    f,
  ) {
    final $$WorkoutTemplateExercisesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workoutTemplateExercises,
          getReferencedColumn: (t) => t.workoutTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutTemplateExercisesTableFilterComposer(
                $db: $db,
                $table: $db.workoutTemplateExercises,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> scheduledWorkoutsRefs(
    Expression<bool> Function($$ScheduledWorkoutsTableFilterComposer f) f,
  ) {
    final $$ScheduledWorkoutsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduledWorkouts,
      getReferencedColumn: (t) => t.workoutTemplateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledWorkoutsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledWorkouts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sessionLogsRefs(
    Expression<bool> Function($$SessionLogsTableFilterComposer f) f,
  ) {
    final $$SessionLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionLogs,
      getReferencedColumn: (t) => t.workoutTemplateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CampaignsTableOrderingComposer get sourceCampaignId {
    final $$CampaignsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCampaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableOrderingComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CampaignsTableAnnotationComposer get sourceCampaignId {
    final $$CampaignsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCampaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableAnnotationComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> workoutTemplateExercisesRefs<T extends Object>(
    Expression<T> Function($$WorkoutTemplateExercisesTableAnnotationComposer a)
    f,
  ) {
    final $$WorkoutTemplateExercisesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.workoutTemplateExercises,
          getReferencedColumn: (t) => t.workoutTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutTemplateExercisesTableAnnotationComposer(
                $db: $db,
                $table: $db.workoutTemplateExercises,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> scheduledWorkoutsRefs<T extends Object>(
    Expression<T> Function($$ScheduledWorkoutsTableAnnotationComposer a) f,
  ) {
    final $$ScheduledWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduledWorkouts,
          getReferencedColumn: (t) => t.workoutTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledWorkoutsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledWorkouts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> sessionLogsRefs<T extends Object>(
    Expression<T> Function($$SessionLogsTableAnnotationComposer a) f,
  ) {
    final $$SessionLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionLogs,
      getReferencedColumn: (t) => t.workoutTemplateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutTemplatesTable,
          WorkoutTemplate,
          $$WorkoutTemplatesTableFilterComposer,
          $$WorkoutTemplatesTableOrderingComposer,
          $$WorkoutTemplatesTableAnnotationComposer,
          $$WorkoutTemplatesTableCreateCompanionBuilder,
          $$WorkoutTemplatesTableUpdateCompanionBuilder,
          (WorkoutTemplate, $$WorkoutTemplatesTableReferences),
          WorkoutTemplate,
          PrefetchHooks Function({
            bool sourceCampaignId,
            bool workoutTemplateExercisesRefs,
            bool scheduledWorkoutsRefs,
            bool sessionLogsRefs,
          })
        > {
  $$WorkoutTemplatesTableTableManager(
    _$AppDatabase db,
    $WorkoutTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> sourceCampaignId = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion(
                id: id,
                name: name,
                description: description,
                sourceCampaignId: sourceCampaignId,
                isSeedContent: isSeedContent,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> sourceCampaignId = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion.insert(
                id: id,
                name: name,
                description: description,
                sourceCampaignId: sourceCampaignId,
                isSeedContent: isSeedContent,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                sourceCampaignId = false,
                workoutTemplateExercisesRefs = false,
                scheduledWorkoutsRefs = false,
                sessionLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutTemplateExercisesRefs)
                      db.workoutTemplateExercises,
                    if (scheduledWorkoutsRefs) db.scheduledWorkouts,
                    if (sessionLogsRefs) db.sessionLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sourceCampaignId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceCampaignId,
                                    referencedTable:
                                        $$WorkoutTemplatesTableReferences
                                            ._sourceCampaignIdTable(db),
                                    referencedColumn:
                                        $$WorkoutTemplatesTableReferences
                                            ._sourceCampaignIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutTemplateExercisesRefs)
                        await $_getPrefetchedData<
                          WorkoutTemplate,
                          $WorkoutTemplatesTable,
                          WorkoutTemplateExercise
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutTemplatesTableReferences
                              ._workoutTemplateExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutTemplateExercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workoutTemplateId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scheduledWorkoutsRefs)
                        await $_getPrefetchedData<
                          WorkoutTemplate,
                          $WorkoutTemplatesTable,
                          ScheduledWorkout
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutTemplatesTableReferences
                              ._scheduledWorkoutsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduledWorkoutsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workoutTemplateId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sessionLogsRefs)
                        await $_getPrefetchedData<
                          WorkoutTemplate,
                          $WorkoutTemplatesTable,
                          SessionLog
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutTemplatesTableReferences
                              ._sessionLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workoutTemplateId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutTemplatesTable,
      WorkoutTemplate,
      $$WorkoutTemplatesTableFilterComposer,
      $$WorkoutTemplatesTableOrderingComposer,
      $$WorkoutTemplatesTableAnnotationComposer,
      $$WorkoutTemplatesTableCreateCompanionBuilder,
      $$WorkoutTemplatesTableUpdateCompanionBuilder,
      (WorkoutTemplate, $$WorkoutTemplatesTableReferences),
      WorkoutTemplate,
      PrefetchHooks Function({
        bool sourceCampaignId,
        bool workoutTemplateExercisesRefs,
        bool scheduledWorkoutsRefs,
        bool sessionLogsRefs,
      })
    >;
typedef $$WorkoutTemplateExercisesTableCreateCompanionBuilder =
    WorkoutTemplateExercisesCompanion Function({
      required String id,
      required String workoutTemplateId,
      required String exerciseId,
      required int sortOrder,
      Value<int?> targetSets,
      Value<String?> targetReps,
      Value<double?> targetWeight,
      Value<double?> targetRpe,
      Value<String?> restGuidance,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$WorkoutTemplateExercisesTableUpdateCompanionBuilder =
    WorkoutTemplateExercisesCompanion Function({
      Value<String> id,
      Value<String> workoutTemplateId,
      Value<String> exerciseId,
      Value<int> sortOrder,
      Value<int?> targetSets,
      Value<String?> targetReps,
      Value<double?> targetWeight,
      Value<double?> targetRpe,
      Value<String?> restGuidance,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$WorkoutTemplateExercisesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkoutTemplateExercisesTable,
          WorkoutTemplateExercise
        > {
  $$WorkoutTemplateExercisesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorkoutTemplatesTable _workoutTemplateIdTable(_$AppDatabase db) =>
      db.workoutTemplates.createAlias(
        $_aliasNameGenerator(
          db.workoutTemplateExercises.workoutTemplateId,
          db.workoutTemplates.id,
        ),
      );

  $$WorkoutTemplatesTableProcessedTableManager get workoutTemplateId {
    final $_column = $_itemColumn<String>('workout_template_id')!;

    final manager = $$WorkoutTemplatesTableTableManager(
      $_db,
      $_db.workoutTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutTemplateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(
          db.workoutTemplateExercises.exerciseId,
          db.exercises.id,
        ),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkoutTemplateExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutTemplateExercisesTable> {
  $$WorkoutTemplateExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetSets => $composableBuilder(
    column: $table.targetSets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetReps => $composableBuilder(
    column: $table.targetReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetRpe => $composableBuilder(
    column: $table.targetRpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get restGuidance => $composableBuilder(
    column: $table.restGuidance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutTemplatesTableFilterComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutTemplateExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutTemplateExercisesTable> {
  $$WorkoutTemplateExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetSets => $composableBuilder(
    column: $table.targetSets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetReps => $composableBuilder(
    column: $table.targetReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetRpe => $composableBuilder(
    column: $table.targetRpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get restGuidance => $composableBuilder(
    column: $table.restGuidance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutTemplatesTableOrderingComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutTemplateExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutTemplateExercisesTable> {
  $$WorkoutTemplateExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get targetSets => $composableBuilder(
    column: $table.targetSets,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetReps => $composableBuilder(
    column: $table.targetReps,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetRpe =>
      $composableBuilder(column: $table.targetRpe, builder: (column) => column);

  GeneratedColumn<String> get restGuidance => $composableBuilder(
    column: $table.restGuidance,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$WorkoutTemplatesTableAnnotationComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutTemplateExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutTemplateExercisesTable,
          WorkoutTemplateExercise,
          $$WorkoutTemplateExercisesTableFilterComposer,
          $$WorkoutTemplateExercisesTableOrderingComposer,
          $$WorkoutTemplateExercisesTableAnnotationComposer,
          $$WorkoutTemplateExercisesTableCreateCompanionBuilder,
          $$WorkoutTemplateExercisesTableUpdateCompanionBuilder,
          (WorkoutTemplateExercise, $$WorkoutTemplateExercisesTableReferences),
          WorkoutTemplateExercise,
          PrefetchHooks Function({bool workoutTemplateId, bool exerciseId})
        > {
  $$WorkoutTemplateExercisesTableTableManager(
    _$AppDatabase db,
    $WorkoutTemplateExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTemplateExercisesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$WorkoutTemplateExercisesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkoutTemplateExercisesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> workoutTemplateId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int?> targetSets = const Value.absent(),
                Value<String?> targetReps = const Value.absent(),
                Value<double?> targetWeight = const Value.absent(),
                Value<double?> targetRpe = const Value.absent(),
                Value<String?> restGuidance = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplateExercisesCompanion(
                id: id,
                workoutTemplateId: workoutTemplateId,
                exerciseId: exerciseId,
                sortOrder: sortOrder,
                targetSets: targetSets,
                targetReps: targetReps,
                targetWeight: targetWeight,
                targetRpe: targetRpe,
                restGuidance: restGuidance,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String workoutTemplateId,
                required String exerciseId,
                required int sortOrder,
                Value<int?> targetSets = const Value.absent(),
                Value<String?> targetReps = const Value.absent(),
                Value<double?> targetWeight = const Value.absent(),
                Value<double?> targetRpe = const Value.absent(),
                Value<String?> restGuidance = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplateExercisesCompanion.insert(
                id: id,
                workoutTemplateId: workoutTemplateId,
                exerciseId: exerciseId,
                sortOrder: sortOrder,
                targetSets: targetSets,
                targetReps: targetReps,
                targetWeight: targetWeight,
                targetRpe: targetRpe,
                restGuidance: restGuidance,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutTemplateExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workoutTemplateId = false, exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workoutTemplateId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workoutTemplateId,
                                referencedTable:
                                    $$WorkoutTemplateExercisesTableReferences
                                        ._workoutTemplateIdTable(db),
                                referencedColumn:
                                    $$WorkoutTemplateExercisesTableReferences
                                        ._workoutTemplateIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (exerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.exerciseId,
                                referencedTable:
                                    $$WorkoutTemplateExercisesTableReferences
                                        ._exerciseIdTable(db),
                                referencedColumn:
                                    $$WorkoutTemplateExercisesTableReferences
                                        ._exerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutTemplateExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutTemplateExercisesTable,
      WorkoutTemplateExercise,
      $$WorkoutTemplateExercisesTableFilterComposer,
      $$WorkoutTemplateExercisesTableOrderingComposer,
      $$WorkoutTemplateExercisesTableAnnotationComposer,
      $$WorkoutTemplateExercisesTableCreateCompanionBuilder,
      $$WorkoutTemplateExercisesTableUpdateCompanionBuilder,
      (WorkoutTemplateExercise, $$WorkoutTemplateExercisesTableReferences),
      WorkoutTemplateExercise,
      PrefetchHooks Function({bool workoutTemplateId, bool exerciseId})
    >;
typedef $$ProgramTemplatesTableCreateCompanionBuilder =
    ProgramTemplatesCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      Value<String?> sourceCampaignId,
      Value<bool> isSeedContent,
      Value<bool> isArchived,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ProgramTemplatesTableUpdateCompanionBuilder =
    ProgramTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> sourceCampaignId,
      Value<bool> isSeedContent,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ProgramTemplatesTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProgramTemplatesTable, ProgramTemplate> {
  $$ProgramTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CampaignsTable _sourceCampaignIdTable(_$AppDatabase db) =>
      db.campaigns.createAlias(
        $_aliasNameGenerator(
          db.programTemplates.sourceCampaignId,
          db.campaigns.id,
        ),
      );

  $$CampaignsTableProcessedTableManager? get sourceCampaignId {
    final $_column = $_itemColumn<String>('source_campaign_id');
    if ($_column == null) return null;
    final manager = $$CampaignsTableTableManager(
      $_db,
      $_db.campaigns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceCampaignIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ScheduledWorkoutsTable, List<ScheduledWorkout>>
  _scheduledWorkoutsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.scheduledWorkouts,
        aliasName: $_aliasNameGenerator(
          db.programTemplates.id,
          db.scheduledWorkouts.programTemplateId,
        ),
      );

  $$ScheduledWorkoutsTableProcessedTableManager get scheduledWorkoutsRefs {
    final manager =
        $$ScheduledWorkoutsTableTableManager(
          $_db,
          $_db.scheduledWorkouts,
        ).filter(
          (f) => f.programTemplateId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _scheduledWorkoutsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProgramTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramTemplatesTable> {
  $$ProgramTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CampaignsTableFilterComposer get sourceCampaignId {
    final $$CampaignsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCampaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableFilterComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> scheduledWorkoutsRefs(
    Expression<bool> Function($$ScheduledWorkoutsTableFilterComposer f) f,
  ) {
    final $$ScheduledWorkoutsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduledWorkouts,
      getReferencedColumn: (t) => t.programTemplateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledWorkoutsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledWorkouts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProgramTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramTemplatesTable> {
  $$ProgramTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CampaignsTableOrderingComposer get sourceCampaignId {
    final $$CampaignsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCampaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableOrderingComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgramTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramTemplatesTable> {
  $$ProgramTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CampaignsTableAnnotationComposer get sourceCampaignId {
    final $$CampaignsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCampaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableAnnotationComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> scheduledWorkoutsRefs<T extends Object>(
    Expression<T> Function($$ScheduledWorkoutsTableAnnotationComposer a) f,
  ) {
    final $$ScheduledWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.scheduledWorkouts,
          getReferencedColumn: (t) => t.programTemplateId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledWorkoutsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledWorkouts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProgramTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgramTemplatesTable,
          ProgramTemplate,
          $$ProgramTemplatesTableFilterComposer,
          $$ProgramTemplatesTableOrderingComposer,
          $$ProgramTemplatesTableAnnotationComposer,
          $$ProgramTemplatesTableCreateCompanionBuilder,
          $$ProgramTemplatesTableUpdateCompanionBuilder,
          (ProgramTemplate, $$ProgramTemplatesTableReferences),
          ProgramTemplate,
          PrefetchHooks Function({
            bool sourceCampaignId,
            bool scheduledWorkoutsRefs,
          })
        > {
  $$ProgramTemplatesTableTableManager(
    _$AppDatabase db,
    $ProgramTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgramTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> sourceCampaignId = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramTemplatesCompanion(
                id: id,
                name: name,
                description: description,
                sourceCampaignId: sourceCampaignId,
                isSeedContent: isSeedContent,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> sourceCampaignId = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProgramTemplatesCompanion.insert(
                id: id,
                name: name,
                description: description,
                sourceCampaignId: sourceCampaignId,
                isSeedContent: isSeedContent,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgramTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sourceCampaignId = false, scheduledWorkoutsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (scheduledWorkoutsRefs) db.scheduledWorkouts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sourceCampaignId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceCampaignId,
                                    referencedTable:
                                        $$ProgramTemplatesTableReferences
                                            ._sourceCampaignIdTable(db),
                                    referencedColumn:
                                        $$ProgramTemplatesTableReferences
                                            ._sourceCampaignIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (scheduledWorkoutsRefs)
                        await $_getPrefetchedData<
                          ProgramTemplate,
                          $ProgramTemplatesTable,
                          ScheduledWorkout
                        >(
                          currentTable: table,
                          referencedTable: $$ProgramTemplatesTableReferences
                              ._scheduledWorkoutsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProgramTemplatesTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduledWorkoutsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.programTemplateId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProgramTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgramTemplatesTable,
      ProgramTemplate,
      $$ProgramTemplatesTableFilterComposer,
      $$ProgramTemplatesTableOrderingComposer,
      $$ProgramTemplatesTableAnnotationComposer,
      $$ProgramTemplatesTableCreateCompanionBuilder,
      $$ProgramTemplatesTableUpdateCompanionBuilder,
      (ProgramTemplate, $$ProgramTemplatesTableReferences),
      ProgramTemplate,
      PrefetchHooks Function({
        bool sourceCampaignId,
        bool scheduledWorkoutsRefs,
      })
    >;
typedef $$CampaignPhasesTableCreateCompanionBuilder =
    CampaignPhasesCompanion Function({
      required String id,
      required String campaignId,
      required String name,
      required int phaseOrder,
      required DateTime startDate,
      required DateTime endDate,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$CampaignPhasesTableUpdateCompanionBuilder =
    CampaignPhasesCompanion Function({
      Value<String> id,
      Value<String> campaignId,
      Value<String> name,
      Value<int> phaseOrder,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$CampaignPhasesTableReferences
    extends BaseReferences<_$AppDatabase, $CampaignPhasesTable, CampaignPhase> {
  $$CampaignPhasesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CampaignsTable _campaignIdTable(_$AppDatabase db) =>
      db.campaigns.createAlias(
        $_aliasNameGenerator(db.campaignPhases.campaignId, db.campaigns.id),
      );

  $$CampaignsTableProcessedTableManager get campaignId {
    final $_column = $_itemColumn<String>('campaign_id')!;

    final manager = $$CampaignsTableTableManager(
      $_db,
      $_db.campaigns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_campaignIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CampaignPhasesTableFilterComposer
    extends Composer<_$AppDatabase, $CampaignPhasesTable> {
  $$CampaignPhasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phaseOrder => $composableBuilder(
    column: $table.phaseOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$CampaignsTableFilterComposer get campaignId {
    final $$CampaignsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableFilterComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CampaignPhasesTableOrderingComposer
    extends Composer<_$AppDatabase, $CampaignPhasesTable> {
  $$CampaignPhasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phaseOrder => $composableBuilder(
    column: $table.phaseOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$CampaignsTableOrderingComposer get campaignId {
    final $$CampaignsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableOrderingComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CampaignPhasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CampaignPhasesTable> {
  $$CampaignPhasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get phaseOrder => $composableBuilder(
    column: $table.phaseOrder,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CampaignsTableAnnotationComposer get campaignId {
    final $$CampaignsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableAnnotationComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CampaignPhasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CampaignPhasesTable,
          CampaignPhase,
          $$CampaignPhasesTableFilterComposer,
          $$CampaignPhasesTableOrderingComposer,
          $$CampaignPhasesTableAnnotationComposer,
          $$CampaignPhasesTableCreateCompanionBuilder,
          $$CampaignPhasesTableUpdateCompanionBuilder,
          (CampaignPhase, $$CampaignPhasesTableReferences),
          CampaignPhase,
          PrefetchHooks Function({bool campaignId})
        > {
  $$CampaignPhasesTableTableManager(
    _$AppDatabase db,
    $CampaignPhasesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CampaignPhasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CampaignPhasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CampaignPhasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> campaignId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> phaseOrder = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CampaignPhasesCompanion(
                id: id,
                campaignId: campaignId,
                name: name,
                phaseOrder: phaseOrder,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String campaignId,
                required String name,
                required int phaseOrder,
                required DateTime startDate,
                required DateTime endDate,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CampaignPhasesCompanion.insert(
                id: id,
                campaignId: campaignId,
                name: name,
                phaseOrder: phaseOrder,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CampaignPhasesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({campaignId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (campaignId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.campaignId,
                                referencedTable: $$CampaignPhasesTableReferences
                                    ._campaignIdTable(db),
                                referencedColumn:
                                    $$CampaignPhasesTableReferences
                                        ._campaignIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CampaignPhasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CampaignPhasesTable,
      CampaignPhase,
      $$CampaignPhasesTableFilterComposer,
      $$CampaignPhasesTableOrderingComposer,
      $$CampaignPhasesTableAnnotationComposer,
      $$CampaignPhasesTableCreateCompanionBuilder,
      $$CampaignPhasesTableUpdateCompanionBuilder,
      (CampaignPhase, $$CampaignPhasesTableReferences),
      CampaignPhase,
      PrefetchHooks Function({bool campaignId})
    >;
typedef $$ScheduledWorkoutsTableCreateCompanionBuilder =
    ScheduledWorkoutsCompanion Function({
      required String id,
      Value<String?> campaignId,
      Value<String?> programTemplateId,
      required String workoutTemplateId,
      required DateTime scheduledFor,
      Value<String> status,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ScheduledWorkoutsTableUpdateCompanionBuilder =
    ScheduledWorkoutsCompanion Function({
      Value<String> id,
      Value<String?> campaignId,
      Value<String?> programTemplateId,
      Value<String> workoutTemplateId,
      Value<DateTime> scheduledFor,
      Value<String> status,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ScheduledWorkoutsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ScheduledWorkoutsTable,
          ScheduledWorkout
        > {
  $$ScheduledWorkoutsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CampaignsTable _campaignIdTable(_$AppDatabase db) =>
      db.campaigns.createAlias(
        $_aliasNameGenerator(db.scheduledWorkouts.campaignId, db.campaigns.id),
      );

  $$CampaignsTableProcessedTableManager? get campaignId {
    final $_column = $_itemColumn<String>('campaign_id');
    if ($_column == null) return null;
    final manager = $$CampaignsTableTableManager(
      $_db,
      $_db.campaigns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_campaignIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProgramTemplatesTable _programTemplateIdTable(_$AppDatabase db) =>
      db.programTemplates.createAlias(
        $_aliasNameGenerator(
          db.scheduledWorkouts.programTemplateId,
          db.programTemplates.id,
        ),
      );

  $$ProgramTemplatesTableProcessedTableManager? get programTemplateId {
    final $_column = $_itemColumn<String>('program_template_id');
    if ($_column == null) return null;
    final manager = $$ProgramTemplatesTableTableManager(
      $_db,
      $_db.programTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_programTemplateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WorkoutTemplatesTable _workoutTemplateIdTable(_$AppDatabase db) =>
      db.workoutTemplates.createAlias(
        $_aliasNameGenerator(
          db.scheduledWorkouts.workoutTemplateId,
          db.workoutTemplates.id,
        ),
      );

  $$WorkoutTemplatesTableProcessedTableManager get workoutTemplateId {
    final $_column = $_itemColumn<String>('workout_template_id')!;

    final manager = $$WorkoutTemplatesTableTableManager(
      $_db,
      $_db.workoutTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutTemplateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SessionLogsTable, List<SessionLog>>
  _sessionLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sessionLogs,
    aliasName: $_aliasNameGenerator(
      db.scheduledWorkouts.id,
      db.sessionLogs.scheduledWorkoutId,
    ),
  );

  $$SessionLogsTableProcessedTableManager get sessionLogsRefs {
    final manager = $$SessionLogsTableTableManager($_db, $_db.sessionLogs)
        .filter(
          (f) => f.scheduledWorkoutId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_sessionLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ScheduledWorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduledWorkoutsTable> {
  $$ScheduledWorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CampaignsTableFilterComposer get campaignId {
    final $$CampaignsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableFilterComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProgramTemplatesTableFilterComposer get programTemplateId {
    final $$ProgramTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.programTemplateId,
      referencedTable: $db.programTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.programTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTemplatesTableFilterComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> sessionLogsRefs(
    Expression<bool> Function($$SessionLogsTableFilterComposer f) f,
  ) {
    final $$SessionLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionLogs,
      getReferencedColumn: (t) => t.scheduledWorkoutId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScheduledWorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduledWorkoutsTable> {
  $$ScheduledWorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CampaignsTableOrderingComposer get campaignId {
    final $$CampaignsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableOrderingComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProgramTemplatesTableOrderingComposer get programTemplateId {
    final $$ProgramTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.programTemplateId,
      referencedTable: $db.programTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.programTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTemplatesTableOrderingComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduledWorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduledWorkoutsTable> {
  $$ScheduledWorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CampaignsTableAnnotationComposer get campaignId {
    final $$CampaignsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableAnnotationComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProgramTemplatesTableAnnotationComposer get programTemplateId {
    final $$ProgramTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.programTemplateId,
      referencedTable: $db.programTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.programTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTemplatesTableAnnotationComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> sessionLogsRefs<T extends Object>(
    Expression<T> Function($$SessionLogsTableAnnotationComposer a) f,
  ) {
    final $$SessionLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionLogs,
      getReferencedColumn: (t) => t.scheduledWorkoutId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScheduledWorkoutsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduledWorkoutsTable,
          ScheduledWorkout,
          $$ScheduledWorkoutsTableFilterComposer,
          $$ScheduledWorkoutsTableOrderingComposer,
          $$ScheduledWorkoutsTableAnnotationComposer,
          $$ScheduledWorkoutsTableCreateCompanionBuilder,
          $$ScheduledWorkoutsTableUpdateCompanionBuilder,
          (ScheduledWorkout, $$ScheduledWorkoutsTableReferences),
          ScheduledWorkout,
          PrefetchHooks Function({
            bool campaignId,
            bool programTemplateId,
            bool workoutTemplateId,
            bool sessionLogsRefs,
          })
        > {
  $$ScheduledWorkoutsTableTableManager(
    _$AppDatabase db,
    $ScheduledWorkoutsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduledWorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduledWorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduledWorkoutsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> campaignId = const Value.absent(),
                Value<String?> programTemplateId = const Value.absent(),
                Value<String> workoutTemplateId = const Value.absent(),
                Value<DateTime> scheduledFor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScheduledWorkoutsCompanion(
                id: id,
                campaignId: campaignId,
                programTemplateId: programTemplateId,
                workoutTemplateId: workoutTemplateId,
                scheduledFor: scheduledFor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> campaignId = const Value.absent(),
                Value<String?> programTemplateId = const Value.absent(),
                required String workoutTemplateId,
                required DateTime scheduledFor,
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ScheduledWorkoutsCompanion.insert(
                id: id,
                campaignId: campaignId,
                programTemplateId: programTemplateId,
                workoutTemplateId: workoutTemplateId,
                scheduledFor: scheduledFor,
                status: status,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScheduledWorkoutsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                campaignId = false,
                programTemplateId = false,
                workoutTemplateId = false,
                sessionLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sessionLogsRefs) db.sessionLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (campaignId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.campaignId,
                                    referencedTable:
                                        $$ScheduledWorkoutsTableReferences
                                            ._campaignIdTable(db),
                                    referencedColumn:
                                        $$ScheduledWorkoutsTableReferences
                                            ._campaignIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (programTemplateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.programTemplateId,
                                    referencedTable:
                                        $$ScheduledWorkoutsTableReferences
                                            ._programTemplateIdTable(db),
                                    referencedColumn:
                                        $$ScheduledWorkoutsTableReferences
                                            ._programTemplateIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (workoutTemplateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workoutTemplateId,
                                    referencedTable:
                                        $$ScheduledWorkoutsTableReferences
                                            ._workoutTemplateIdTable(db),
                                    referencedColumn:
                                        $$ScheduledWorkoutsTableReferences
                                            ._workoutTemplateIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sessionLogsRefs)
                        await $_getPrefetchedData<
                          ScheduledWorkout,
                          $ScheduledWorkoutsTable,
                          SessionLog
                        >(
                          currentTable: table,
                          referencedTable: $$ScheduledWorkoutsTableReferences
                              ._sessionLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScheduledWorkoutsTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.scheduledWorkoutId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ScheduledWorkoutsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduledWorkoutsTable,
      ScheduledWorkout,
      $$ScheduledWorkoutsTableFilterComposer,
      $$ScheduledWorkoutsTableOrderingComposer,
      $$ScheduledWorkoutsTableAnnotationComposer,
      $$ScheduledWorkoutsTableCreateCompanionBuilder,
      $$ScheduledWorkoutsTableUpdateCompanionBuilder,
      (ScheduledWorkout, $$ScheduledWorkoutsTableReferences),
      ScheduledWorkout,
      PrefetchHooks Function({
        bool campaignId,
        bool programTemplateId,
        bool workoutTemplateId,
        bool sessionLogsRefs,
      })
    >;
typedef $$SessionLogsTableCreateCompanionBuilder =
    SessionLogsCompanion Function({
      required String id,
      Value<String?> scheduledWorkoutId,
      Value<String?> workoutTemplateId,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<int?> durationSeconds,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SessionLogsTableUpdateCompanionBuilder =
    SessionLogsCompanion Function({
      Value<String> id,
      Value<String?> scheduledWorkoutId,
      Value<String?> workoutTemplateId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<int?> durationSeconds,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$SessionLogsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionLogsTable, SessionLog> {
  $$SessionLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ScheduledWorkoutsTable _scheduledWorkoutIdTable(_$AppDatabase db) =>
      db.scheduledWorkouts.createAlias(
        $_aliasNameGenerator(
          db.sessionLogs.scheduledWorkoutId,
          db.scheduledWorkouts.id,
        ),
      );

  $$ScheduledWorkoutsTableProcessedTableManager? get scheduledWorkoutId {
    final $_column = $_itemColumn<String>('scheduled_workout_id');
    if ($_column == null) return null;
    final manager = $$ScheduledWorkoutsTableTableManager(
      $_db,
      $_db.scheduledWorkouts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scheduledWorkoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WorkoutTemplatesTable _workoutTemplateIdTable(_$AppDatabase db) =>
      db.workoutTemplates.createAlias(
        $_aliasNameGenerator(
          db.sessionLogs.workoutTemplateId,
          db.workoutTemplates.id,
        ),
      );

  $$WorkoutTemplatesTableProcessedTableManager? get workoutTemplateId {
    final $_column = $_itemColumn<String>('workout_template_id');
    if ($_column == null) return null;
    final manager = $$WorkoutTemplatesTableTableManager(
      $_db,
      $_db.workoutTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutTemplateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ExerciseLogsTable, List<ExerciseLog>>
  _exerciseLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exerciseLogs,
    aliasName: $_aliasNameGenerator(
      db.sessionLogs.id,
      db.exerciseLogs.sessionLogId,
    ),
  );

  $$ExerciseLogsTableProcessedTableManager get exerciseLogsRefs {
    final manager = $$ExerciseLogsTableTableManager(
      $_db,
      $_db.exerciseLogs,
    ).filter((f) => f.sessionLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_exerciseLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionLogsTable> {
  $$SessionLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ScheduledWorkoutsTableFilterComposer get scheduledWorkoutId {
    final $$ScheduledWorkoutsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduledWorkoutId,
      referencedTable: $db.scheduledWorkouts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledWorkoutsTableFilterComposer(
            $db: $db,
            $table: $db.scheduledWorkouts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTemplatesTableFilterComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> exerciseLogsRefs(
    Expression<bool> Function($$ExerciseLogsTableFilterComposer f) f,
  ) {
    final $$ExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseLogs,
      getReferencedColumn: (t) => t.sessionLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.exerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionLogsTable> {
  $$SessionLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ScheduledWorkoutsTableOrderingComposer get scheduledWorkoutId {
    final $$ScheduledWorkoutsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduledWorkoutId,
      referencedTable: $db.scheduledWorkouts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduledWorkoutsTableOrderingComposer(
            $db: $db,
            $table: $db.scheduledWorkouts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutTemplatesTableOrderingComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionLogsTable> {
  $$SessionLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ScheduledWorkoutsTableAnnotationComposer get scheduledWorkoutId {
    final $$ScheduledWorkoutsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.scheduledWorkoutId,
          referencedTable: $db.scheduledWorkouts,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ScheduledWorkoutsTableAnnotationComposer(
                $db: $db,
                $table: $db.scheduledWorkouts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$WorkoutTemplatesTableAnnotationComposer get workoutTemplateId {
    final $$WorkoutTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutTemplateId,
      referencedTable: $db.workoutTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> exerciseLogsRefs<T extends Object>(
    Expression<T> Function($$ExerciseLogsTableAnnotationComposer a) f,
  ) {
    final $$ExerciseLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseLogs,
      getReferencedColumn: (t) => t.sessionLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.exerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionLogsTable,
          SessionLog,
          $$SessionLogsTableFilterComposer,
          $$SessionLogsTableOrderingComposer,
          $$SessionLogsTableAnnotationComposer,
          $$SessionLogsTableCreateCompanionBuilder,
          $$SessionLogsTableUpdateCompanionBuilder,
          (SessionLog, $$SessionLogsTableReferences),
          SessionLog,
          PrefetchHooks Function({
            bool scheduledWorkoutId,
            bool workoutTemplateId,
            bool exerciseLogsRefs,
          })
        > {
  $$SessionLogsTableTableManager(_$AppDatabase db, $SessionLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> scheduledWorkoutId = const Value.absent(),
                Value<String?> workoutTemplateId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionLogsCompanion(
                id: id,
                scheduledWorkoutId: scheduledWorkoutId,
                workoutTemplateId: workoutTemplateId,
                startedAt: startedAt,
                completedAt: completedAt,
                durationSeconds: durationSeconds,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> scheduledWorkoutId = const Value.absent(),
                Value<String?> workoutTemplateId = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SessionLogsCompanion.insert(
                id: id,
                scheduledWorkoutId: scheduledWorkoutId,
                workoutTemplateId: workoutTemplateId,
                startedAt: startedAt,
                completedAt: completedAt,
                durationSeconds: durationSeconds,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                scheduledWorkoutId = false,
                workoutTemplateId = false,
                exerciseLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (exerciseLogsRefs) db.exerciseLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (scheduledWorkoutId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.scheduledWorkoutId,
                                    referencedTable:
                                        $$SessionLogsTableReferences
                                            ._scheduledWorkoutIdTable(db),
                                    referencedColumn:
                                        $$SessionLogsTableReferences
                                            ._scheduledWorkoutIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (workoutTemplateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workoutTemplateId,
                                    referencedTable:
                                        $$SessionLogsTableReferences
                                            ._workoutTemplateIdTable(db),
                                    referencedColumn:
                                        $$SessionLogsTableReferences
                                            ._workoutTemplateIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exerciseLogsRefs)
                        await $_getPrefetchedData<
                          SessionLog,
                          $SessionLogsTable,
                          ExerciseLog
                        >(
                          currentTable: table,
                          referencedTable: $$SessionLogsTableReferences
                              ._exerciseLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SessionLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionLogsTable,
      SessionLog,
      $$SessionLogsTableFilterComposer,
      $$SessionLogsTableOrderingComposer,
      $$SessionLogsTableAnnotationComposer,
      $$SessionLogsTableCreateCompanionBuilder,
      $$SessionLogsTableUpdateCompanionBuilder,
      (SessionLog, $$SessionLogsTableReferences),
      SessionLog,
      PrefetchHooks Function({
        bool scheduledWorkoutId,
        bool workoutTemplateId,
        bool exerciseLogsRefs,
      })
    >;
typedef $$ExerciseLogsTableCreateCompanionBuilder =
    ExerciseLogsCompanion Function({
      required String id,
      required String sessionLogId,
      required String exerciseId,
      required int sortOrder,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ExerciseLogsTableUpdateCompanionBuilder =
    ExerciseLogsCompanion Function({
      Value<String> id,
      Value<String> sessionLogId,
      Value<String> exerciseId,
      Value<int> sortOrder,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$ExerciseLogsTableReferences
    extends BaseReferences<_$AppDatabase, $ExerciseLogsTable, ExerciseLog> {
  $$ExerciseLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SessionLogsTable _sessionLogIdTable(_$AppDatabase db) =>
      db.sessionLogs.createAlias(
        $_aliasNameGenerator(db.exerciseLogs.sessionLogId, db.sessionLogs.id),
      );

  $$SessionLogsTableProcessedTableManager get sessionLogId {
    final $_column = $_itemColumn<String>('session_log_id')!;

    final manager = $$SessionLogsTableTableManager(
      $_db,
      $_db.sessionLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(db.exerciseLogs.exerciseId, db.exercises.id),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SetLogsTable, List<SetLog>> _setLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.setLogs,
    aliasName: $_aliasNameGenerator(
      db.exerciseLogs.id,
      db.setLogs.exerciseLogId,
    ),
  );

  $$SetLogsTableProcessedTableManager get setLogsRefs {
    final manager = $$SetLogsTableTableManager(
      $_db,
      $_db.setLogs,
    ).filter((f) => f.exerciseLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_setLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExerciseLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseLogsTable> {
  $$ExerciseLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$SessionLogsTableFilterComposer get sessionLogId {
    final $$SessionLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionLogId,
      referencedTable: $db.sessionLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> setLogsRefs(
    Expression<bool> Function($$SetLogsTableFilterComposer f) f,
  ) {
    final $$SetLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.exerciseLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableFilterComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExerciseLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseLogsTable> {
  $$ExerciseLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$SessionLogsTableOrderingComposer get sessionLogId {
    final $$SessionLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionLogId,
      referencedTable: $db.sessionLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionLogsTableOrderingComposer(
            $db: $db,
            $table: $db.sessionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseLogsTable> {
  $$ExerciseLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$SessionLogsTableAnnotationComposer get sessionLogId {
    final $$SessionLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionLogId,
      referencedTable: $db.sessionLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> setLogsRefs<T extends Object>(
    Expression<T> Function($$SetLogsTableAnnotationComposer a) f,
  ) {
    final $$SetLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.exerciseLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExerciseLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseLogsTable,
          ExerciseLog,
          $$ExerciseLogsTableFilterComposer,
          $$ExerciseLogsTableOrderingComposer,
          $$ExerciseLogsTableAnnotationComposer,
          $$ExerciseLogsTableCreateCompanionBuilder,
          $$ExerciseLogsTableUpdateCompanionBuilder,
          (ExerciseLog, $$ExerciseLogsTableReferences),
          ExerciseLog,
          PrefetchHooks Function({
            bool sessionLogId,
            bool exerciseId,
            bool setLogsRefs,
          })
        > {
  $$ExerciseLogsTableTableManager(_$AppDatabase db, $ExerciseLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionLogId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseLogsCompanion(
                id: id,
                sessionLogId: sessionLogId,
                exerciseId: exerciseId,
                sortOrder: sortOrder,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionLogId,
                required String exerciseId,
                required int sortOrder,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseLogsCompanion.insert(
                id: id,
                sessionLogId: sessionLogId,
                exerciseId: exerciseId,
                sortOrder: sortOrder,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExerciseLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                sessionLogId = false,
                exerciseId = false,
                setLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (setLogsRefs) db.setLogs],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sessionLogId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sessionLogId,
                                    referencedTable:
                                        $$ExerciseLogsTableReferences
                                            ._sessionLogIdTable(db),
                                    referencedColumn:
                                        $$ExerciseLogsTableReferences
                                            ._sessionLogIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (exerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.exerciseId,
                                    referencedTable:
                                        $$ExerciseLogsTableReferences
                                            ._exerciseIdTable(db),
                                    referencedColumn:
                                        $$ExerciseLogsTableReferences
                                            ._exerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (setLogsRefs)
                        await $_getPrefetchedData<
                          ExerciseLog,
                          $ExerciseLogsTable,
                          SetLog
                        >(
                          currentTable: table,
                          referencedTable: $$ExerciseLogsTableReferences
                              ._setLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExerciseLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).setLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExerciseLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseLogsTable,
      ExerciseLog,
      $$ExerciseLogsTableFilterComposer,
      $$ExerciseLogsTableOrderingComposer,
      $$ExerciseLogsTableAnnotationComposer,
      $$ExerciseLogsTableCreateCompanionBuilder,
      $$ExerciseLogsTableUpdateCompanionBuilder,
      (ExerciseLog, $$ExerciseLogsTableReferences),
      ExerciseLog,
      PrefetchHooks Function({
        bool sessionLogId,
        bool exerciseId,
        bool setLogsRefs,
      })
    >;
typedef $$SetLogsTableCreateCompanionBuilder =
    SetLogsCompanion Function({
      required String id,
      required String exerciseLogId,
      required int setNumber,
      Value<int?> reps,
      Value<double?> weight,
      Value<double?> rpe,
      Value<int?> durationSeconds,
      Value<double?> distanceMeters,
      Value<bool> isComplete,
      Value<String?> notes,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$SetLogsTableUpdateCompanionBuilder =
    SetLogsCompanion Function({
      Value<String> id,
      Value<String> exerciseLogId,
      Value<int> setNumber,
      Value<int?> reps,
      Value<double?> weight,
      Value<double?> rpe,
      Value<int?> durationSeconds,
      Value<double?> distanceMeters,
      Value<bool> isComplete,
      Value<String?> notes,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

final class $$SetLogsTableReferences
    extends BaseReferences<_$AppDatabase, $SetLogsTable, SetLog> {
  $$SetLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExerciseLogsTable _exerciseLogIdTable(_$AppDatabase db) =>
      db.exerciseLogs.createAlias(
        $_aliasNameGenerator(db.setLogs.exerciseLogId, db.exerciseLogs.id),
      );

  $$ExerciseLogsTableProcessedTableManager get exerciseLogId {
    final $_column = $_itemColumn<String>('exercise_log_id')!;

    final manager = $$ExerciseLogsTableTableManager(
      $_db,
      $_db.exerciseLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WorkingWeightsTable, List<WorkingWeight>>
  _workingWeightsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workingWeights,
    aliasName: $_aliasNameGenerator(
      db.setLogs.id,
      db.workingWeights.sourceSetLogId,
    ),
  );

  $$WorkingWeightsTableProcessedTableManager get workingWeightsRefs {
    final manager = $$WorkingWeightsTableTableManager(
      $_db,
      $_db.workingWeights,
    ).filter((f) => f.sourceSetLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_workingWeightsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SetLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SetLogsTable> {
  $$SetLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ExerciseLogsTableFilterComposer get exerciseLogId {
    final $$ExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseLogId,
      referencedTable: $db.exerciseLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.exerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> workingWeightsRefs(
    Expression<bool> Function($$WorkingWeightsTableFilterComposer f) f,
  ) {
    final $$WorkingWeightsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workingWeights,
      getReferencedColumn: (t) => t.sourceSetLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkingWeightsTableFilterComposer(
            $db: $db,
            $table: $db.workingWeights,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SetLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SetLogsTable> {
  $$SetLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ExerciseLogsTableOrderingComposer get exerciseLogId {
    final $$ExerciseLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseLogId,
      referencedTable: $db.exerciseLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableOrderingComposer(
            $db: $db,
            $table: $db.exerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SetLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetLogsTable> {
  $$SetLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$ExerciseLogsTableAnnotationComposer get exerciseLogId {
    final $$ExerciseLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseLogId,
      referencedTable: $db.exerciseLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.exerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> workingWeightsRefs<T extends Object>(
    Expression<T> Function($$WorkingWeightsTableAnnotationComposer a) f,
  ) {
    final $$WorkingWeightsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workingWeights,
      getReferencedColumn: (t) => t.sourceSetLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkingWeightsTableAnnotationComposer(
            $db: $db,
            $table: $db.workingWeights,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SetLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SetLogsTable,
          SetLog,
          $$SetLogsTableFilterComposer,
          $$SetLogsTableOrderingComposer,
          $$SetLogsTableAnnotationComposer,
          $$SetLogsTableCreateCompanionBuilder,
          $$SetLogsTableUpdateCompanionBuilder,
          (SetLog, $$SetLogsTableReferences),
          SetLog,
          PrefetchHooks Function({bool exerciseLogId, bool workingWeightsRefs})
        > {
  $$SetLogsTableTableManager(_$AppDatabase db, $SetLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> exerciseLogId = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> rpe = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<double?> distanceMeters = const Value.absent(),
                Value<bool> isComplete = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetLogsCompanion(
                id: id,
                exerciseLogId: exerciseLogId,
                setNumber: setNumber,
                reps: reps,
                weight: weight,
                rpe: rpe,
                durationSeconds: durationSeconds,
                distanceMeters: distanceMeters,
                isComplete: isComplete,
                notes: notes,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String exerciseLogId,
                required int setNumber,
                Value<int?> reps = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> rpe = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<double?> distanceMeters = const Value.absent(),
                Value<bool> isComplete = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetLogsCompanion.insert(
                id: id,
                exerciseLogId: exerciseLogId,
                setNumber: setNumber,
                reps: reps,
                weight: weight,
                rpe: rpe,
                durationSeconds: durationSeconds,
                distanceMeters: distanceMeters,
                isComplete: isComplete,
                notes: notes,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SetLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({exerciseLogId = false, workingWeightsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workingWeightsRefs) db.workingWeights,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (exerciseLogId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.exerciseLogId,
                                    referencedTable: $$SetLogsTableReferences
                                        ._exerciseLogIdTable(db),
                                    referencedColumn: $$SetLogsTableReferences
                                        ._exerciseLogIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workingWeightsRefs)
                        await $_getPrefetchedData<
                          SetLog,
                          $SetLogsTable,
                          WorkingWeight
                        >(
                          currentTable: table,
                          referencedTable: $$SetLogsTableReferences
                              ._workingWeightsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SetLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).workingWeightsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceSetLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SetLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SetLogsTable,
      SetLog,
      $$SetLogsTableFilterComposer,
      $$SetLogsTableOrderingComposer,
      $$SetLogsTableAnnotationComposer,
      $$SetLogsTableCreateCompanionBuilder,
      $$SetLogsTableUpdateCompanionBuilder,
      (SetLog, $$SetLogsTableReferences),
      SetLog,
      PrefetchHooks Function({bool exerciseLogId, bool workingWeightsRefs})
    >;
typedef $$WorkingWeightsTableCreateCompanionBuilder =
    WorkingWeightsCompanion Function({
      required String exerciseId,
      required double weight,
      Value<String> unit,
      Value<double?> estimatedOneRepMax,
      Value<String?> sourceSetLogId,
      Value<bool> isManualOverride,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$WorkingWeightsTableUpdateCompanionBuilder =
    WorkingWeightsCompanion Function({
      Value<String> exerciseId,
      Value<double> weight,
      Value<String> unit,
      Value<double?> estimatedOneRepMax,
      Value<String?> sourceSetLogId,
      Value<bool> isManualOverride,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$WorkingWeightsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkingWeightsTable, WorkingWeight> {
  $$WorkingWeightsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(db.workingWeights.exerciseId, db.exercises.id),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SetLogsTable _sourceSetLogIdTable(_$AppDatabase db) =>
      db.setLogs.createAlias(
        $_aliasNameGenerator(db.workingWeights.sourceSetLogId, db.setLogs.id),
      );

  $$SetLogsTableProcessedTableManager? get sourceSetLogId {
    final $_column = $_itemColumn<String>('source_set_log_id');
    if ($_column == null) return null;
    final manager = $$SetLogsTableTableManager(
      $_db,
      $_db.setLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceSetLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WorkingWeightsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkingWeightsTable> {
  $$WorkingWeightsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get estimatedOneRepMax => $composableBuilder(
    column: $table.estimatedOneRepMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isManualOverride => $composableBuilder(
    column: $table.isManualOverride,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SetLogsTableFilterComposer get sourceSetLogId {
    final $$SetLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceSetLogId,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableFilterComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkingWeightsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkingWeightsTable> {
  $$WorkingWeightsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get estimatedOneRepMax => $composableBuilder(
    column: $table.estimatedOneRepMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isManualOverride => $composableBuilder(
    column: $table.isManualOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SetLogsTableOrderingComposer get sourceSetLogId {
    final $$SetLogsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceSetLogId,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableOrderingComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkingWeightsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkingWeightsTable> {
  $$WorkingWeightsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get estimatedOneRepMax => $composableBuilder(
    column: $table.estimatedOneRepMax,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isManualOverride => $composableBuilder(
    column: $table.isManualOverride,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SetLogsTableAnnotationComposer get sourceSetLogId {
    final $$SetLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceSetLogId,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkingWeightsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkingWeightsTable,
          WorkingWeight,
          $$WorkingWeightsTableFilterComposer,
          $$WorkingWeightsTableOrderingComposer,
          $$WorkingWeightsTableAnnotationComposer,
          $$WorkingWeightsTableCreateCompanionBuilder,
          $$WorkingWeightsTableUpdateCompanionBuilder,
          (WorkingWeight, $$WorkingWeightsTableReferences),
          WorkingWeight,
          PrefetchHooks Function({bool exerciseId, bool sourceSetLogId})
        > {
  $$WorkingWeightsTableTableManager(
    _$AppDatabase db,
    $WorkingWeightsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkingWeightsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkingWeightsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkingWeightsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> exerciseId = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<double?> estimatedOneRepMax = const Value.absent(),
                Value<String?> sourceSetLogId = const Value.absent(),
                Value<bool> isManualOverride = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkingWeightsCompanion(
                exerciseId: exerciseId,
                weight: weight,
                unit: unit,
                estimatedOneRepMax: estimatedOneRepMax,
                sourceSetLogId: sourceSetLogId,
                isManualOverride: isManualOverride,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String exerciseId,
                required double weight,
                Value<String> unit = const Value.absent(),
                Value<double?> estimatedOneRepMax = const Value.absent(),
                Value<String?> sourceSetLogId = const Value.absent(),
                Value<bool> isManualOverride = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => WorkingWeightsCompanion.insert(
                exerciseId: exerciseId,
                weight: weight,
                unit: unit,
                estimatedOneRepMax: estimatedOneRepMax,
                sourceSetLogId: sourceSetLogId,
                isManualOverride: isManualOverride,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkingWeightsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({exerciseId = false, sourceSetLogId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (exerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.exerciseId,
                                    referencedTable:
                                        $$WorkingWeightsTableReferences
                                            ._exerciseIdTable(db),
                                    referencedColumn:
                                        $$WorkingWeightsTableReferences
                                            ._exerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sourceSetLogId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceSetLogId,
                                    referencedTable:
                                        $$WorkingWeightsTableReferences
                                            ._sourceSetLogIdTable(db),
                                    referencedColumn:
                                        $$WorkingWeightsTableReferences
                                            ._sourceSetLogIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$WorkingWeightsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkingWeightsTable,
      WorkingWeight,
      $$WorkingWeightsTableFilterComposer,
      $$WorkingWeightsTableOrderingComposer,
      $$WorkingWeightsTableAnnotationComposer,
      $$WorkingWeightsTableCreateCompanionBuilder,
      $$WorkingWeightsTableUpdateCompanionBuilder,
      (WorkingWeight, $$WorkingWeightsTableReferences),
      WorkingWeight,
      PrefetchHooks Function({bool exerciseId, bool sourceSetLogId})
    >;
typedef $$CardioLogsTableCreateCompanionBuilder =
    CardioLogsCompanion Function({
      required String id,
      required DateTime loggedAt,
      Value<String> activityType,
      required double distanceMeters,
      required int durationSeconds,
      required double paceSecondsPerKm,
      Value<String?> notes,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$CardioLogsTableUpdateCompanionBuilder =
    CardioLogsCompanion Function({
      Value<String> id,
      Value<DateTime> loggedAt,
      Value<String> activityType,
      Value<double> distanceMeters,
      Value<int> durationSeconds,
      Value<double> paceSecondsPerKm,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$CardioLogsTableFilterComposer
    extends Composer<_$AppDatabase, $CardioLogsTable> {
  $$CardioLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paceSecondsPerKm => $composableBuilder(
    column: $table.paceSecondsPerKm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CardioLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardioLogsTable> {
  $$CardioLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paceSecondsPerKm => $composableBuilder(
    column: $table.paceSecondsPerKm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CardioLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardioLogsTable> {
  $$CardioLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distanceMeters => $composableBuilder(
    column: $table.distanceMeters,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get paceSecondsPerKm => $composableBuilder(
    column: $table.paceSecondsPerKm,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CardioLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardioLogsTable,
          CardioLog,
          $$CardioLogsTableFilterComposer,
          $$CardioLogsTableOrderingComposer,
          $$CardioLogsTableAnnotationComposer,
          $$CardioLogsTableCreateCompanionBuilder,
          $$CardioLogsTableUpdateCompanionBuilder,
          (
            CardioLog,
            BaseReferences<_$AppDatabase, $CardioLogsTable, CardioLog>,
          ),
          CardioLog,
          PrefetchHooks Function()
        > {
  $$CardioLogsTableTableManager(_$AppDatabase db, $CardioLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardioLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardioLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardioLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<String> activityType = const Value.absent(),
                Value<double> distanceMeters = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<double> paceSecondsPerKm = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardioLogsCompanion(
                id: id,
                loggedAt: loggedAt,
                activityType: activityType,
                distanceMeters: distanceMeters,
                durationSeconds: durationSeconds,
                paceSecondsPerKm: paceSecondsPerKm,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime loggedAt,
                Value<String> activityType = const Value.absent(),
                required double distanceMeters,
                required int durationSeconds,
                required double paceSecondsPerKm,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CardioLogsCompanion.insert(
                id: id,
                loggedAt: loggedAt,
                activityType: activityType,
                distanceMeters: distanceMeters,
                durationSeconds: durationSeconds,
                paceSecondsPerKm: paceSecondsPerKm,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CardioLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardioLogsTable,
      CardioLog,
      $$CardioLogsTableFilterComposer,
      $$CardioLogsTableOrderingComposer,
      $$CardioLogsTableAnnotationComposer,
      $$CardioLogsTableCreateCompanionBuilder,
      $$CardioLogsTableUpdateCompanionBuilder,
      (CardioLog, BaseReferences<_$AppDatabase, $CardioLogsTable, CardioLog>),
      CardioLog,
      PrefetchHooks Function()
    >;
typedef $$ProgressionSuggestionsTableCreateCompanionBuilder =
    ProgressionSuggestionsCompanion Function({
      required String id,
      required String exerciseId,
      required double currentWeight,
      required double suggestedWeight,
      Value<String> unit,
      required String reason,
      Value<String> status,
      required DateTime createdAt,
      Value<DateTime?> resolvedAt,
      Value<int> rowid,
    });
typedef $$ProgressionSuggestionsTableUpdateCompanionBuilder =
    ProgressionSuggestionsCompanion Function({
      Value<String> id,
      Value<String> exerciseId,
      Value<double> currentWeight,
      Value<double> suggestedWeight,
      Value<String> unit,
      Value<String> reason,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime?> resolvedAt,
      Value<int> rowid,
    });

final class $$ProgressionSuggestionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProgressionSuggestionsTable,
          ProgressionSuggestion
        > {
  $$ProgressionSuggestionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(
          db.progressionSuggestions.exerciseId,
          db.exercises.id,
        ),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProgressionSuggestionsTableFilterComposer
    extends Composer<_$AppDatabase, $ProgressionSuggestionsTable> {
  $$ProgressionSuggestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentWeight => $composableBuilder(
    column: $table.currentWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get suggestedWeight => $composableBuilder(
    column: $table.suggestedWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressionSuggestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgressionSuggestionsTable> {
  $$ProgressionSuggestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentWeight => $composableBuilder(
    column: $table.currentWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get suggestedWeight => $composableBuilder(
    column: $table.suggestedWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressionSuggestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgressionSuggestionsTable> {
  $$ProgressionSuggestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get currentWeight => $composableBuilder(
    column: $table.currentWeight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get suggestedWeight => $composableBuilder(
    column: $table.suggestedWeight,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => column,
  );

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressionSuggestionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgressionSuggestionsTable,
          ProgressionSuggestion,
          $$ProgressionSuggestionsTableFilterComposer,
          $$ProgressionSuggestionsTableOrderingComposer,
          $$ProgressionSuggestionsTableAnnotationComposer,
          $$ProgressionSuggestionsTableCreateCompanionBuilder,
          $$ProgressionSuggestionsTableUpdateCompanionBuilder,
          (ProgressionSuggestion, $$ProgressionSuggestionsTableReferences),
          ProgressionSuggestion,
          PrefetchHooks Function({bool exerciseId})
        > {
  $$ProgressionSuggestionsTableTableManager(
    _$AppDatabase db,
    $ProgressionSuggestionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgressionSuggestionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ProgressionSuggestionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProgressionSuggestionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<double> currentWeight = const Value.absent(),
                Value<double> suggestedWeight = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> resolvedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressionSuggestionsCompanion(
                id: id,
                exerciseId: exerciseId,
                currentWeight: currentWeight,
                suggestedWeight: suggestedWeight,
                unit: unit,
                reason: reason,
                status: status,
                createdAt: createdAt,
                resolvedAt: resolvedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String exerciseId,
                required double currentWeight,
                required double suggestedWeight,
                Value<String> unit = const Value.absent(),
                required String reason,
                Value<String> status = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> resolvedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressionSuggestionsCompanion.insert(
                id: id,
                exerciseId: exerciseId,
                currentWeight: currentWeight,
                suggestedWeight: suggestedWeight,
                unit: unit,
                reason: reason,
                status: status,
                createdAt: createdAt,
                resolvedAt: resolvedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgressionSuggestionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (exerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.exerciseId,
                                referencedTable:
                                    $$ProgressionSuggestionsTableReferences
                                        ._exerciseIdTable(db),
                                referencedColumn:
                                    $$ProgressionSuggestionsTableReferences
                                        ._exerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProgressionSuggestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgressionSuggestionsTable,
      ProgressionSuggestion,
      $$ProgressionSuggestionsTableFilterComposer,
      $$ProgressionSuggestionsTableOrderingComposer,
      $$ProgressionSuggestionsTableAnnotationComposer,
      $$ProgressionSuggestionsTableCreateCompanionBuilder,
      $$ProgressionSuggestionsTableUpdateCompanionBuilder,
      (ProgressionSuggestion, $$ProgressionSuggestionsTableReferences),
      ProgressionSuggestion,
      PrefetchHooks Function({bool exerciseId})
    >;
typedef $$AdventurersTableCreateCompanionBuilder =
    AdventurersCompanion Function({
      required String id,
      required String name,
      Value<int> level,
      Value<int> xp,
      required String selectedClass,
      required String currentTitle,
      Value<int> might,
      Value<int> endurance,
      Value<int> discipline,
      Value<int> vitality,
      Value<int> agility,
      Value<int> wisdom,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AdventurersTableUpdateCompanionBuilder =
    AdventurersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> level,
      Value<int> xp,
      Value<String> selectedClass,
      Value<String> currentTitle,
      Value<int> might,
      Value<int> endurance,
      Value<int> discipline,
      Value<int> vitality,
      Value<int> agility,
      Value<int> wisdom,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AdventurersTableReferences
    extends BaseReferences<_$AppDatabase, $AdventurersTable, Adventurer> {
  $$AdventurersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$XpHistoryTable, List<XpHistoryData>>
  _xpHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.xpHistory,
    aliasName: $_aliasNameGenerator(
      db.adventurers.id,
      db.xpHistory.adventurerId,
    ),
  );

  $$XpHistoryTableProcessedTableManager get xpHistoryRefs {
    final manager = $$XpHistoryTableTableManager(
      $_db,
      $_db.xpHistory,
    ).filter((f) => f.adventurerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_xpHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AdventurersTableFilterComposer
    extends Composer<_$AppDatabase, $AdventurersTable> {
  $$AdventurersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedClass => $composableBuilder(
    column: $table.selectedClass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentTitle => $composableBuilder(
    column: $table.currentTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get might => $composableBuilder(
    column: $table.might,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endurance => $composableBuilder(
    column: $table.endurance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vitality => $composableBuilder(
    column: $table.vitality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agility => $composableBuilder(
    column: $table.agility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wisdom => $composableBuilder(
    column: $table.wisdom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> xpHistoryRefs(
    Expression<bool> Function($$XpHistoryTableFilterComposer f) f,
  ) {
    final $$XpHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.xpHistory,
      getReferencedColumn: (t) => t.adventurerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpHistoryTableFilterComposer(
            $db: $db,
            $table: $db.xpHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AdventurersTableOrderingComposer
    extends Composer<_$AppDatabase, $AdventurersTable> {
  $$AdventurersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedClass => $composableBuilder(
    column: $table.selectedClass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentTitle => $composableBuilder(
    column: $table.currentTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get might => $composableBuilder(
    column: $table.might,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endurance => $composableBuilder(
    column: $table.endurance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vitality => $composableBuilder(
    column: $table.vitality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agility => $composableBuilder(
    column: $table.agility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wisdom => $composableBuilder(
    column: $table.wisdom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdventurersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdventurersTable> {
  $$AdventurersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get xp =>
      $composableBuilder(column: $table.xp, builder: (column) => column);

  GeneratedColumn<String> get selectedClass => $composableBuilder(
    column: $table.selectedClass,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentTitle => $composableBuilder(
    column: $table.currentTitle,
    builder: (column) => column,
  );

  GeneratedColumn<int> get might =>
      $composableBuilder(column: $table.might, builder: (column) => column);

  GeneratedColumn<int> get endurance =>
      $composableBuilder(column: $table.endurance, builder: (column) => column);

  GeneratedColumn<int> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => column,
  );

  GeneratedColumn<int> get vitality =>
      $composableBuilder(column: $table.vitality, builder: (column) => column);

  GeneratedColumn<int> get agility =>
      $composableBuilder(column: $table.agility, builder: (column) => column);

  GeneratedColumn<int> get wisdom =>
      $composableBuilder(column: $table.wisdom, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> xpHistoryRefs<T extends Object>(
    Expression<T> Function($$XpHistoryTableAnnotationComposer a) f,
  ) {
    final $$XpHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.xpHistory,
      getReferencedColumn: (t) => t.adventurerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.xpHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AdventurersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdventurersTable,
          Adventurer,
          $$AdventurersTableFilterComposer,
          $$AdventurersTableOrderingComposer,
          $$AdventurersTableAnnotationComposer,
          $$AdventurersTableCreateCompanionBuilder,
          $$AdventurersTableUpdateCompanionBuilder,
          (Adventurer, $$AdventurersTableReferences),
          Adventurer,
          PrefetchHooks Function({bool xpHistoryRefs})
        > {
  $$AdventurersTableTableManager(_$AppDatabase db, $AdventurersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdventurersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdventurersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdventurersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> xp = const Value.absent(),
                Value<String> selectedClass = const Value.absent(),
                Value<String> currentTitle = const Value.absent(),
                Value<int> might = const Value.absent(),
                Value<int> endurance = const Value.absent(),
                Value<int> discipline = const Value.absent(),
                Value<int> vitality = const Value.absent(),
                Value<int> agility = const Value.absent(),
                Value<int> wisdom = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdventurersCompanion(
                id: id,
                name: name,
                level: level,
                xp: xp,
                selectedClass: selectedClass,
                currentTitle: currentTitle,
                might: might,
                endurance: endurance,
                discipline: discipline,
                vitality: vitality,
                agility: agility,
                wisdom: wisdom,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> level = const Value.absent(),
                Value<int> xp = const Value.absent(),
                required String selectedClass,
                required String currentTitle,
                Value<int> might = const Value.absent(),
                Value<int> endurance = const Value.absent(),
                Value<int> discipline = const Value.absent(),
                Value<int> vitality = const Value.absent(),
                Value<int> agility = const Value.absent(),
                Value<int> wisdom = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AdventurersCompanion.insert(
                id: id,
                name: name,
                level: level,
                xp: xp,
                selectedClass: selectedClass,
                currentTitle: currentTitle,
                might: might,
                endurance: endurance,
                discipline: discipline,
                vitality: vitality,
                agility: agility,
                wisdom: wisdom,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AdventurersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({xpHistoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (xpHistoryRefs) db.xpHistory],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (xpHistoryRefs)
                    await $_getPrefetchedData<
                      Adventurer,
                      $AdventurersTable,
                      XpHistoryData
                    >(
                      currentTable: table,
                      referencedTable: $$AdventurersTableReferences
                          ._xpHistoryRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AdventurersTableReferences(
                            db,
                            table,
                            p0,
                          ).xpHistoryRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.adventurerId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AdventurersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdventurersTable,
      Adventurer,
      $$AdventurersTableFilterComposer,
      $$AdventurersTableOrderingComposer,
      $$AdventurersTableAnnotationComposer,
      $$AdventurersTableCreateCompanionBuilder,
      $$AdventurersTableUpdateCompanionBuilder,
      (Adventurer, $$AdventurersTableReferences),
      Adventurer,
      PrefetchHooks Function({bool xpHistoryRefs})
    >;
typedef $$FitnessEventsTableCreateCompanionBuilder =
    FitnessEventsCompanion Function({
      required String id,
      required String type,
      required DateTime occurredAt,
      required String sourceType,
      Value<String?> sourceId,
      Value<String?> metadataJson,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$FitnessEventsTableUpdateCompanionBuilder =
    FitnessEventsCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<DateTime> occurredAt,
      Value<String> sourceType,
      Value<String?> sourceId,
      Value<String?> metadataJson,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$FitnessEventsTableReferences
    extends BaseReferences<_$AppDatabase, $FitnessEventsTable, FitnessEvent> {
  $$FitnessEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$RewardEventsTable, List<RewardEvent>>
  _rewardEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rewardEvents,
    aliasName: $_aliasNameGenerator(
      db.fitnessEvents.id,
      db.rewardEvents.fitnessEventId,
    ),
  );

  $$RewardEventsTableProcessedTableManager get rewardEventsRefs {
    final manager = $$RewardEventsTableTableManager(
      $_db,
      $_db.rewardEvents,
    ).filter((f) => f.fitnessEventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_rewardEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FitnessEventsTableFilterComposer
    extends Composer<_$AppDatabase, $FitnessEventsTable> {
  $$FitnessEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> rewardEventsRefs(
    Expression<bool> Function($$RewardEventsTableFilterComposer f) f,
  ) {
    final $$RewardEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.fitnessEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableFilterComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FitnessEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $FitnessEventsTable> {
  $$FitnessEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FitnessEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FitnessEventsTable> {
  $$FitnessEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get metadataJson => $composableBuilder(
    column: $table.metadataJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> rewardEventsRefs<T extends Object>(
    Expression<T> Function($$RewardEventsTableAnnotationComposer a) f,
  ) {
    final $$RewardEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.fitnessEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FitnessEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FitnessEventsTable,
          FitnessEvent,
          $$FitnessEventsTableFilterComposer,
          $$FitnessEventsTableOrderingComposer,
          $$FitnessEventsTableAnnotationComposer,
          $$FitnessEventsTableCreateCompanionBuilder,
          $$FitnessEventsTableUpdateCompanionBuilder,
          (FitnessEvent, $$FitnessEventsTableReferences),
          FitnessEvent,
          PrefetchHooks Function({bool rewardEventsRefs})
        > {
  $$FitnessEventsTableTableManager(_$AppDatabase db, $FitnessEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FitnessEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FitnessEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FitnessEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String?> sourceId = const Value.absent(),
                Value<String?> metadataJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FitnessEventsCompanion(
                id: id,
                type: type,
                occurredAt: occurredAt,
                sourceType: sourceType,
                sourceId: sourceId,
                metadataJson: metadataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                required DateTime occurredAt,
                required String sourceType,
                Value<String?> sourceId = const Value.absent(),
                Value<String?> metadataJson = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FitnessEventsCompanion.insert(
                id: id,
                type: type,
                occurredAt: occurredAt,
                sourceType: sourceType,
                sourceId: sourceId,
                metadataJson: metadataJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FitnessEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({rewardEventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (rewardEventsRefs) db.rewardEvents],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (rewardEventsRefs)
                    await $_getPrefetchedData<
                      FitnessEvent,
                      $FitnessEventsTable,
                      RewardEvent
                    >(
                      currentTable: table,
                      referencedTable: $$FitnessEventsTableReferences
                          ._rewardEventsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FitnessEventsTableReferences(
                            db,
                            table,
                            p0,
                          ).rewardEventsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.fitnessEventId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FitnessEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FitnessEventsTable,
      FitnessEvent,
      $$FitnessEventsTableFilterComposer,
      $$FitnessEventsTableOrderingComposer,
      $$FitnessEventsTableAnnotationComposer,
      $$FitnessEventsTableCreateCompanionBuilder,
      $$FitnessEventsTableUpdateCompanionBuilder,
      (FitnessEvent, $$FitnessEventsTableReferences),
      FitnessEvent,
      PrefetchHooks Function({bool rewardEventsRefs})
    >;
typedef $$RewardEventsTableCreateCompanionBuilder =
    RewardEventsCompanion Function({
      required String id,
      required String fitnessEventId,
      required String type,
      Value<int> xpAmount,
      required String summary,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$RewardEventsTableUpdateCompanionBuilder =
    RewardEventsCompanion Function({
      Value<String> id,
      Value<String> fitnessEventId,
      Value<String> type,
      Value<int> xpAmount,
      Value<String> summary,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$RewardEventsTableReferences
    extends BaseReferences<_$AppDatabase, $RewardEventsTable, RewardEvent> {
  $$RewardEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FitnessEventsTable _fitnessEventIdTable(_$AppDatabase db) =>
      db.fitnessEvents.createAlias(
        $_aliasNameGenerator(
          db.rewardEvents.fitnessEventId,
          db.fitnessEvents.id,
        ),
      );

  $$FitnessEventsTableProcessedTableManager get fitnessEventId {
    final $_column = $_itemColumn<String>('fitness_event_id')!;

    final manager = $$FitnessEventsTableTableManager(
      $_db,
      $_db.fitnessEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fitnessEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$XpHistoryTable, List<XpHistoryData>>
  _xpHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.xpHistory,
    aliasName: $_aliasNameGenerator(
      db.rewardEvents.id,
      db.xpHistory.rewardEventId,
    ),
  );

  $$XpHistoryTableProcessedTableManager get xpHistoryRefs {
    final manager = $$XpHistoryTableTableManager(
      $_db,
      $_db.xpHistory,
    ).filter((f) => f.rewardEventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_xpHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EquipmentInventoryTable,
    List<EquipmentInventoryData>
  >
  _equipmentInventoryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.equipmentInventory,
        aliasName: $_aliasNameGenerator(
          db.rewardEvents.id,
          db.equipmentInventory.sourceRewardEventId,
        ),
      );

  $$EquipmentInventoryTableProcessedTableManager get equipmentInventoryRefs {
    final manager =
        $$EquipmentInventoryTableTableManager(
          $_db,
          $_db.equipmentInventory,
        ).filter(
          (f) =>
              f.sourceRewardEventId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _equipmentInventoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AdventurerTitlesTable, List<AdventurerTitle>>
  _adventurerTitlesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.adventurerTitles,
    aliasName: $_aliasNameGenerator(
      db.rewardEvents.id,
      db.adventurerTitles.sourceRewardEventId,
    ),
  );

  $$AdventurerTitlesTableProcessedTableManager get adventurerTitlesRefs {
    final manager =
        $$AdventurerTitlesTableTableManager($_db, $_db.adventurerTitles).filter(
          (f) =>
              f.sourceRewardEventId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _adventurerTitlesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RewardEventsTableFilterComposer
    extends Composer<_$AppDatabase, $RewardEventsTable> {
  $$RewardEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpAmount => $composableBuilder(
    column: $table.xpAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FitnessEventsTableFilterComposer get fitnessEventId {
    final $$FitnessEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fitnessEventId,
      referencedTable: $db.fitnessEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FitnessEventsTableFilterComposer(
            $db: $db,
            $table: $db.fitnessEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> xpHistoryRefs(
    Expression<bool> Function($$XpHistoryTableFilterComposer f) f,
  ) {
    final $$XpHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.xpHistory,
      getReferencedColumn: (t) => t.rewardEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpHistoryTableFilterComposer(
            $db: $db,
            $table: $db.xpHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> equipmentInventoryRefs(
    Expression<bool> Function($$EquipmentInventoryTableFilterComposer f) f,
  ) {
    final $$EquipmentInventoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.equipmentInventory,
      getReferencedColumn: (t) => t.sourceRewardEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentInventoryTableFilterComposer(
            $db: $db,
            $table: $db.equipmentInventory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> adventurerTitlesRefs(
    Expression<bool> Function($$AdventurerTitlesTableFilterComposer f) f,
  ) {
    final $$AdventurerTitlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adventurerTitles,
      getReferencedColumn: (t) => t.sourceRewardEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdventurerTitlesTableFilterComposer(
            $db: $db,
            $table: $db.adventurerTitles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RewardEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $RewardEventsTable> {
  $$RewardEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpAmount => $composableBuilder(
    column: $table.xpAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FitnessEventsTableOrderingComposer get fitnessEventId {
    final $$FitnessEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fitnessEventId,
      referencedTable: $db.fitnessEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FitnessEventsTableOrderingComposer(
            $db: $db,
            $table: $db.fitnessEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RewardEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RewardEventsTable> {
  $$RewardEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get xpAmount =>
      $composableBuilder(column: $table.xpAmount, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$FitnessEventsTableAnnotationComposer get fitnessEventId {
    final $$FitnessEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.fitnessEventId,
      referencedTable: $db.fitnessEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FitnessEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.fitnessEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> xpHistoryRefs<T extends Object>(
    Expression<T> Function($$XpHistoryTableAnnotationComposer a) f,
  ) {
    final $$XpHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.xpHistory,
      getReferencedColumn: (t) => t.rewardEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.xpHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> equipmentInventoryRefs<T extends Object>(
    Expression<T> Function($$EquipmentInventoryTableAnnotationComposer a) f,
  ) {
    final $$EquipmentInventoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.equipmentInventory,
          getReferencedColumn: (t) => t.sourceRewardEventId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentInventoryTableAnnotationComposer(
                $db: $db,
                $table: $db.equipmentInventory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> adventurerTitlesRefs<T extends Object>(
    Expression<T> Function($$AdventurerTitlesTableAnnotationComposer a) f,
  ) {
    final $$AdventurerTitlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adventurerTitles,
      getReferencedColumn: (t) => t.sourceRewardEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdventurerTitlesTableAnnotationComposer(
            $db: $db,
            $table: $db.adventurerTitles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RewardEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RewardEventsTable,
          RewardEvent,
          $$RewardEventsTableFilterComposer,
          $$RewardEventsTableOrderingComposer,
          $$RewardEventsTableAnnotationComposer,
          $$RewardEventsTableCreateCompanionBuilder,
          $$RewardEventsTableUpdateCompanionBuilder,
          (RewardEvent, $$RewardEventsTableReferences),
          RewardEvent,
          PrefetchHooks Function({
            bool fitnessEventId,
            bool xpHistoryRefs,
            bool equipmentInventoryRefs,
            bool adventurerTitlesRefs,
          })
        > {
  $$RewardEventsTableTableManager(_$AppDatabase db, $RewardEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RewardEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RewardEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RewardEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fitnessEventId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> xpAmount = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RewardEventsCompanion(
                id: id,
                fitnessEventId: fitnessEventId,
                type: type,
                xpAmount: xpAmount,
                summary: summary,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fitnessEventId,
                required String type,
                Value<int> xpAmount = const Value.absent(),
                required String summary,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RewardEventsCompanion.insert(
                id: id,
                fitnessEventId: fitnessEventId,
                type: type,
                xpAmount: xpAmount,
                summary: summary,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RewardEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                fitnessEventId = false,
                xpHistoryRefs = false,
                equipmentInventoryRefs = false,
                adventurerTitlesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (xpHistoryRefs) db.xpHistory,
                    if (equipmentInventoryRefs) db.equipmentInventory,
                    if (adventurerTitlesRefs) db.adventurerTitles,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (fitnessEventId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.fitnessEventId,
                                    referencedTable:
                                        $$RewardEventsTableReferences
                                            ._fitnessEventIdTable(db),
                                    referencedColumn:
                                        $$RewardEventsTableReferences
                                            ._fitnessEventIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (xpHistoryRefs)
                        await $_getPrefetchedData<
                          RewardEvent,
                          $RewardEventsTable,
                          XpHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$RewardEventsTableReferences
                              ._xpHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RewardEventsTableReferences(
                                db,
                                table,
                                p0,
                              ).xpHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.rewardEventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (equipmentInventoryRefs)
                        await $_getPrefetchedData<
                          RewardEvent,
                          $RewardEventsTable,
                          EquipmentInventoryData
                        >(
                          currentTable: table,
                          referencedTable: $$RewardEventsTableReferences
                              ._equipmentInventoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RewardEventsTableReferences(
                                db,
                                table,
                                p0,
                              ).equipmentInventoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceRewardEventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (adventurerTitlesRefs)
                        await $_getPrefetchedData<
                          RewardEvent,
                          $RewardEventsTable,
                          AdventurerTitle
                        >(
                          currentTable: table,
                          referencedTable: $$RewardEventsTableReferences
                              ._adventurerTitlesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RewardEventsTableReferences(
                                db,
                                table,
                                p0,
                              ).adventurerTitlesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceRewardEventId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RewardEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RewardEventsTable,
      RewardEvent,
      $$RewardEventsTableFilterComposer,
      $$RewardEventsTableOrderingComposer,
      $$RewardEventsTableAnnotationComposer,
      $$RewardEventsTableCreateCompanionBuilder,
      $$RewardEventsTableUpdateCompanionBuilder,
      (RewardEvent, $$RewardEventsTableReferences),
      RewardEvent,
      PrefetchHooks Function({
        bool fitnessEventId,
        bool xpHistoryRefs,
        bool equipmentInventoryRefs,
        bool adventurerTitlesRefs,
      })
    >;
typedef $$XpHistoryTableCreateCompanionBuilder =
    XpHistoryCompanion Function({
      required String id,
      required String rewardEventId,
      required String adventurerId,
      required int amount,
      required int levelBefore,
      required int levelAfter,
      required int xpBefore,
      required int xpAfter,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$XpHistoryTableUpdateCompanionBuilder =
    XpHistoryCompanion Function({
      Value<String> id,
      Value<String> rewardEventId,
      Value<String> adventurerId,
      Value<int> amount,
      Value<int> levelBefore,
      Value<int> levelAfter,
      Value<int> xpBefore,
      Value<int> xpAfter,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$XpHistoryTableReferences
    extends BaseReferences<_$AppDatabase, $XpHistoryTable, XpHistoryData> {
  $$XpHistoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RewardEventsTable _rewardEventIdTable(_$AppDatabase db) =>
      db.rewardEvents.createAlias(
        $_aliasNameGenerator(db.xpHistory.rewardEventId, db.rewardEvents.id),
      );

  $$RewardEventsTableProcessedTableManager get rewardEventId {
    final $_column = $_itemColumn<String>('reward_event_id')!;

    final manager = $$RewardEventsTableTableManager(
      $_db,
      $_db.rewardEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rewardEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AdventurersTable _adventurerIdTable(_$AppDatabase db) =>
      db.adventurers.createAlias(
        $_aliasNameGenerator(db.xpHistory.adventurerId, db.adventurers.id),
      );

  $$AdventurersTableProcessedTableManager get adventurerId {
    final $_column = $_itemColumn<String>('adventurer_id')!;

    final manager = $$AdventurersTableTableManager(
      $_db,
      $_db.adventurers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_adventurerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$XpHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $XpHistoryTable> {
  $$XpHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get levelBefore => $composableBuilder(
    column: $table.levelBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get levelAfter => $composableBuilder(
    column: $table.levelAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpBefore => $composableBuilder(
    column: $table.xpBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpAfter => $composableBuilder(
    column: $table.xpAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RewardEventsTableFilterComposer get rewardEventId {
    final $$RewardEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableFilterComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AdventurersTableFilterComposer get adventurerId {
    final $$AdventurersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.adventurerId,
      referencedTable: $db.adventurers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdventurersTableFilterComposer(
            $db: $db,
            $table: $db.adventurers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $XpHistoryTable> {
  $$XpHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get levelBefore => $composableBuilder(
    column: $table.levelBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get levelAfter => $composableBuilder(
    column: $table.levelAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpBefore => $composableBuilder(
    column: $table.xpBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpAfter => $composableBuilder(
    column: $table.xpAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RewardEventsTableOrderingComposer get rewardEventId {
    final $$RewardEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableOrderingComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AdventurersTableOrderingComposer get adventurerId {
    final $$AdventurersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.adventurerId,
      referencedTable: $db.adventurers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdventurersTableOrderingComposer(
            $db: $db,
            $table: $db.adventurers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $XpHistoryTable> {
  $$XpHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get levelBefore => $composableBuilder(
    column: $table.levelBefore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get levelAfter => $composableBuilder(
    column: $table.levelAfter,
    builder: (column) => column,
  );

  GeneratedColumn<int> get xpBefore =>
      $composableBuilder(column: $table.xpBefore, builder: (column) => column);

  GeneratedColumn<int> get xpAfter =>
      $composableBuilder(column: $table.xpAfter, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RewardEventsTableAnnotationComposer get rewardEventId {
    final $$RewardEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AdventurersTableAnnotationComposer get adventurerId {
    final $$AdventurersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.adventurerId,
      referencedTable: $db.adventurers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdventurersTableAnnotationComposer(
            $db: $db,
            $table: $db.adventurers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $XpHistoryTable,
          XpHistoryData,
          $$XpHistoryTableFilterComposer,
          $$XpHistoryTableOrderingComposer,
          $$XpHistoryTableAnnotationComposer,
          $$XpHistoryTableCreateCompanionBuilder,
          $$XpHistoryTableUpdateCompanionBuilder,
          (XpHistoryData, $$XpHistoryTableReferences),
          XpHistoryData,
          PrefetchHooks Function({bool rewardEventId, bool adventurerId})
        > {
  $$XpHistoryTableTableManager(_$AppDatabase db, $XpHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$XpHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$XpHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$XpHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> rewardEventId = const Value.absent(),
                Value<String> adventurerId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> levelBefore = const Value.absent(),
                Value<int> levelAfter = const Value.absent(),
                Value<int> xpBefore = const Value.absent(),
                Value<int> xpAfter = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => XpHistoryCompanion(
                id: id,
                rewardEventId: rewardEventId,
                adventurerId: adventurerId,
                amount: amount,
                levelBefore: levelBefore,
                levelAfter: levelAfter,
                xpBefore: xpBefore,
                xpAfter: xpAfter,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String rewardEventId,
                required String adventurerId,
                required int amount,
                required int levelBefore,
                required int levelAfter,
                required int xpBefore,
                required int xpAfter,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => XpHistoryCompanion.insert(
                id: id,
                rewardEventId: rewardEventId,
                adventurerId: adventurerId,
                amount: amount,
                levelBefore: levelBefore,
                levelAfter: levelAfter,
                xpBefore: xpBefore,
                xpAfter: xpAfter,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$XpHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({rewardEventId = false, adventurerId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (rewardEventId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.rewardEventId,
                                    referencedTable: $$XpHistoryTableReferences
                                        ._rewardEventIdTable(db),
                                    referencedColumn: $$XpHistoryTableReferences
                                        ._rewardEventIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (adventurerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.adventurerId,
                                    referencedTable: $$XpHistoryTableReferences
                                        ._adventurerIdTable(db),
                                    referencedColumn: $$XpHistoryTableReferences
                                        ._adventurerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$XpHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $XpHistoryTable,
      XpHistoryData,
      $$XpHistoryTableFilterComposer,
      $$XpHistoryTableOrderingComposer,
      $$XpHistoryTableAnnotationComposer,
      $$XpHistoryTableCreateCompanionBuilder,
      $$XpHistoryTableUpdateCompanionBuilder,
      (XpHistoryData, $$XpHistoryTableReferences),
      XpHistoryData,
      PrefetchHooks Function({bool rewardEventId, bool adventurerId})
    >;
typedef $$AchievementsTableCreateCompanionBuilder =
    AchievementsCompanion Function({
      required String id,
      required String name,
      required String description,
      required String category,
      required int targetValue,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$AchievementsTableUpdateCompanionBuilder =
    AchievementsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<String> category,
      Value<int> targetValue,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$AchievementsTableReferences
    extends BaseReferences<_$AppDatabase, $AchievementsTable, Achievement> {
  $$AchievementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AchievementStatesTable, List<AchievementState>>
  _achievementStatesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.achievementStates,
        aliasName: $_aliasNameGenerator(
          db.achievements.id,
          db.achievementStates.achievementId,
        ),
      );

  $$AchievementStatesTableProcessedTableManager get achievementStatesRefs {
    final manager = $$AchievementStatesTableTableManager(
      $_db,
      $_db.achievementStates,
    ).filter((f) => f.achievementId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _achievementStatesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> achievementStatesRefs(
    Expression<bool> Function($$AchievementStatesTableFilterComposer f) f,
  ) {
    final $$AchievementStatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.achievementStates,
      getReferencedColumn: (t) => t.achievementId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementStatesTableFilterComposer(
            $db: $db,
            $table: $db.achievementStates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> achievementStatesRefs<T extends Object>(
    Expression<T> Function($$AchievementStatesTableAnnotationComposer a) f,
  ) {
    final $$AchievementStatesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.achievementStates,
          getReferencedColumn: (t) => t.achievementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AchievementStatesTableAnnotationComposer(
                $db: $db,
                $table: $db.achievementStates,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AchievementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementsTable,
          Achievement,
          $$AchievementsTableFilterComposer,
          $$AchievementsTableOrderingComposer,
          $$AchievementsTableAnnotationComposer,
          $$AchievementsTableCreateCompanionBuilder,
          $$AchievementsTableUpdateCompanionBuilder,
          (Achievement, $$AchievementsTableReferences),
          Achievement,
          PrefetchHooks Function({bool achievementStatesRefs})
        > {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> targetValue = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion(
                id: id,
                name: name,
                description: description,
                category: category,
                targetValue: targetValue,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                required String category,
                required int targetValue,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion.insert(
                id: id,
                name: name,
                description: description,
                category: category,
                targetValue: targetValue,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AchievementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({achievementStatesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (achievementStatesRefs) db.achievementStates,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (achievementStatesRefs)
                    await $_getPrefetchedData<
                      Achievement,
                      $AchievementsTable,
                      AchievementState
                    >(
                      currentTable: table,
                      referencedTable: $$AchievementsTableReferences
                          ._achievementStatesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AchievementsTableReferences(
                            db,
                            table,
                            p0,
                          ).achievementStatesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.achievementId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AchievementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementsTable,
      Achievement,
      $$AchievementsTableFilterComposer,
      $$AchievementsTableOrderingComposer,
      $$AchievementsTableAnnotationComposer,
      $$AchievementsTableCreateCompanionBuilder,
      $$AchievementsTableUpdateCompanionBuilder,
      (Achievement, $$AchievementsTableReferences),
      Achievement,
      PrefetchHooks Function({bool achievementStatesRefs})
    >;
typedef $$AchievementStatesTableCreateCompanionBuilder =
    AchievementStatesCompanion Function({
      required String achievementId,
      Value<int> currentValue,
      Value<bool> isUnlocked,
      Value<DateTime?> unlockedAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AchievementStatesTableUpdateCompanionBuilder =
    AchievementStatesCompanion Function({
      Value<String> achievementId,
      Value<int> currentValue,
      Value<bool> isUnlocked,
      Value<DateTime?> unlockedAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$AchievementStatesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AchievementStatesTable,
          AchievementState
        > {
  $$AchievementStatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AchievementsTable _achievementIdTable(_$AppDatabase db) =>
      db.achievements.createAlias(
        $_aliasNameGenerator(
          db.achievementStates.achievementId,
          db.achievements.id,
        ),
      );

  $$AchievementsTableProcessedTableManager get achievementId {
    final $_column = $_itemColumn<String>('achievement_id')!;

    final manager = $$AchievementsTableTableManager(
      $_db,
      $_db.achievements,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_achievementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AchievementStatesTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementStatesTable> {
  $$AchievementStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AchievementsTableFilterComposer get achievementId {
    final $$AchievementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achievementId,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableFilterComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AchievementStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementStatesTable> {
  $$AchievementStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AchievementsTableOrderingComposer get achievementId {
    final $$AchievementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achievementId,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableOrderingComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AchievementStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementStatesTable> {
  $$AchievementStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AchievementsTableAnnotationComposer get achievementId {
    final $$AchievementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.achievementId,
      referencedTable: $db.achievements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AchievementsTableAnnotationComposer(
            $db: $db,
            $table: $db.achievements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AchievementStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementStatesTable,
          AchievementState,
          $$AchievementStatesTableFilterComposer,
          $$AchievementStatesTableOrderingComposer,
          $$AchievementStatesTableAnnotationComposer,
          $$AchievementStatesTableCreateCompanionBuilder,
          $$AchievementStatesTableUpdateCompanionBuilder,
          (AchievementState, $$AchievementStatesTableReferences),
          AchievementState,
          PrefetchHooks Function({bool achievementId})
        > {
  $$AchievementStatesTableTableManager(
    _$AppDatabase db,
    $AchievementStatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementStatesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> achievementId = const Value.absent(),
                Value<int> currentValue = const Value.absent(),
                Value<bool> isUnlocked = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementStatesCompanion(
                achievementId: achievementId,
                currentValue: currentValue,
                isUnlocked: isUnlocked,
                unlockedAt: unlockedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String achievementId,
                Value<int> currentValue = const Value.absent(),
                Value<bool> isUnlocked = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AchievementStatesCompanion.insert(
                achievementId: achievementId,
                currentValue: currentValue,
                isUnlocked: isUnlocked,
                unlockedAt: unlockedAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AchievementStatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({achievementId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (achievementId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.achievementId,
                                referencedTable:
                                    $$AchievementStatesTableReferences
                                        ._achievementIdTable(db),
                                referencedColumn:
                                    $$AchievementStatesTableReferences
                                        ._achievementIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AchievementStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementStatesTable,
      AchievementState,
      $$AchievementStatesTableFilterComposer,
      $$AchievementStatesTableOrderingComposer,
      $$AchievementStatesTableAnnotationComposer,
      $$AchievementStatesTableCreateCompanionBuilder,
      $$AchievementStatesTableUpdateCompanionBuilder,
      (AchievementState, $$AchievementStatesTableReferences),
      AchievementState,
      PrefetchHooks Function({bool achievementId})
    >;
typedef $$EquipmentDefinitionsTableCreateCompanionBuilder =
    EquipmentDefinitionsCompanion Function({
      required String id,
      required String name,
      required String slot,
      required String description,
      required String iconKey,
      Value<String> rarity,
      Value<int> sortOrder,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$EquipmentDefinitionsTableUpdateCompanionBuilder =
    EquipmentDefinitionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> slot,
      Value<String> description,
      Value<String> iconKey,
      Value<String> rarity,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$EquipmentDefinitionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EquipmentDefinitionsTable,
          EquipmentDefinition
        > {
  $$EquipmentDefinitionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $EquipmentInventoryTable,
    List<EquipmentInventoryData>
  >
  _equipmentInventoryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.equipmentInventory,
        aliasName: $_aliasNameGenerator(
          db.equipmentDefinitions.id,
          db.equipmentInventory.equipmentId,
        ),
      );

  $$EquipmentInventoryTableProcessedTableManager get equipmentInventoryRefs {
    final manager = $$EquipmentInventoryTableTableManager(
      $_db,
      $_db.equipmentInventory,
    ).filter((f) => f.equipmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _equipmentInventoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EquippedEquipmentTable,
    List<EquippedEquipmentData>
  >
  _equippedEquipmentRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.equippedEquipment,
        aliasName: $_aliasNameGenerator(
          db.equipmentDefinitions.id,
          db.equippedEquipment.equipmentId,
        ),
      );

  $$EquippedEquipmentTableProcessedTableManager get equippedEquipmentRefs {
    final manager = $$EquippedEquipmentTableTableManager(
      $_db,
      $_db.equippedEquipment,
    ).filter((f) => f.equipmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _equippedEquipmentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EquipmentDefinitionsTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentDefinitionsTable> {
  $$EquipmentDefinitionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> equipmentInventoryRefs(
    Expression<bool> Function($$EquipmentInventoryTableFilterComposer f) f,
  ) {
    final $$EquipmentInventoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.equipmentInventory,
      getReferencedColumn: (t) => t.equipmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentInventoryTableFilterComposer(
            $db: $db,
            $table: $db.equipmentInventory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> equippedEquipmentRefs(
    Expression<bool> Function($$EquippedEquipmentTableFilterComposer f) f,
  ) {
    final $$EquippedEquipmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.equippedEquipment,
      getReferencedColumn: (t) => t.equipmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquippedEquipmentTableFilterComposer(
            $db: $db,
            $table: $db.equippedEquipment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EquipmentDefinitionsTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentDefinitionsTable> {
  $$EquipmentDefinitionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EquipmentDefinitionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentDefinitionsTable> {
  $$EquipmentDefinitionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconKey =>
      $composableBuilder(column: $table.iconKey, builder: (column) => column);

  GeneratedColumn<String> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> equipmentInventoryRefs<T extends Object>(
    Expression<T> Function($$EquipmentInventoryTableAnnotationComposer a) f,
  ) {
    final $$EquipmentInventoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.equipmentInventory,
          getReferencedColumn: (t) => t.equipmentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentInventoryTableAnnotationComposer(
                $db: $db,
                $table: $db.equipmentInventory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> equippedEquipmentRefs<T extends Object>(
    Expression<T> Function($$EquippedEquipmentTableAnnotationComposer a) f,
  ) {
    final $$EquippedEquipmentTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.equippedEquipment,
          getReferencedColumn: (t) => t.equipmentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquippedEquipmentTableAnnotationComposer(
                $db: $db,
                $table: $db.equippedEquipment,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EquipmentDefinitionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentDefinitionsTable,
          EquipmentDefinition,
          $$EquipmentDefinitionsTableFilterComposer,
          $$EquipmentDefinitionsTableOrderingComposer,
          $$EquipmentDefinitionsTableAnnotationComposer,
          $$EquipmentDefinitionsTableCreateCompanionBuilder,
          $$EquipmentDefinitionsTableUpdateCompanionBuilder,
          (EquipmentDefinition, $$EquipmentDefinitionsTableReferences),
          EquipmentDefinition,
          PrefetchHooks Function({
            bool equipmentInventoryRefs,
            bool equippedEquipmentRefs,
          })
        > {
  $$EquipmentDefinitionsTableTableManager(
    _$AppDatabase db,
    $EquipmentDefinitionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentDefinitionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquipmentDefinitionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EquipmentDefinitionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> iconKey = const Value.absent(),
                Value<String> rarity = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EquipmentDefinitionsCompanion(
                id: id,
                name: name,
                slot: slot,
                description: description,
                iconKey: iconKey,
                rarity: rarity,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String slot,
                required String description,
                required String iconKey,
                Value<String> rarity = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => EquipmentDefinitionsCompanion.insert(
                id: id,
                name: name,
                slot: slot,
                description: description,
                iconKey: iconKey,
                rarity: rarity,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EquipmentDefinitionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                equipmentInventoryRefs = false,
                equippedEquipmentRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (equipmentInventoryRefs) db.equipmentInventory,
                    if (equippedEquipmentRefs) db.equippedEquipment,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (equipmentInventoryRefs)
                        await $_getPrefetchedData<
                          EquipmentDefinition,
                          $EquipmentDefinitionsTable,
                          EquipmentInventoryData
                        >(
                          currentTable: table,
                          referencedTable: $$EquipmentDefinitionsTableReferences
                              ._equipmentInventoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EquipmentDefinitionsTableReferences(
                                db,
                                table,
                                p0,
                              ).equipmentInventoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.equipmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (equippedEquipmentRefs)
                        await $_getPrefetchedData<
                          EquipmentDefinition,
                          $EquipmentDefinitionsTable,
                          EquippedEquipmentData
                        >(
                          currentTable: table,
                          referencedTable: $$EquipmentDefinitionsTableReferences
                              ._equippedEquipmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EquipmentDefinitionsTableReferences(
                                db,
                                table,
                                p0,
                              ).equippedEquipmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.equipmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EquipmentDefinitionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentDefinitionsTable,
      EquipmentDefinition,
      $$EquipmentDefinitionsTableFilterComposer,
      $$EquipmentDefinitionsTableOrderingComposer,
      $$EquipmentDefinitionsTableAnnotationComposer,
      $$EquipmentDefinitionsTableCreateCompanionBuilder,
      $$EquipmentDefinitionsTableUpdateCompanionBuilder,
      (EquipmentDefinition, $$EquipmentDefinitionsTableReferences),
      EquipmentDefinition,
      PrefetchHooks Function({
        bool equipmentInventoryRefs,
        bool equippedEquipmentRefs,
      })
    >;
typedef $$EquipmentInventoryTableCreateCompanionBuilder =
    EquipmentInventoryCompanion Function({
      required String equipmentId,
      Value<String?> sourceRewardEventId,
      required DateTime unlockedAt,
      Value<int> rowid,
    });
typedef $$EquipmentInventoryTableUpdateCompanionBuilder =
    EquipmentInventoryCompanion Function({
      Value<String> equipmentId,
      Value<String?> sourceRewardEventId,
      Value<DateTime> unlockedAt,
      Value<int> rowid,
    });

final class $$EquipmentInventoryTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EquipmentInventoryTable,
          EquipmentInventoryData
        > {
  $$EquipmentInventoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EquipmentDefinitionsTable _equipmentIdTable(_$AppDatabase db) =>
      db.equipmentDefinitions.createAlias(
        $_aliasNameGenerator(
          db.equipmentInventory.equipmentId,
          db.equipmentDefinitions.id,
        ),
      );

  $$EquipmentDefinitionsTableProcessedTableManager get equipmentId {
    final $_column = $_itemColumn<String>('equipment_id')!;

    final manager = $$EquipmentDefinitionsTableTableManager(
      $_db,
      $_db.equipmentDefinitions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_equipmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RewardEventsTable _sourceRewardEventIdTable(_$AppDatabase db) =>
      db.rewardEvents.createAlias(
        $_aliasNameGenerator(
          db.equipmentInventory.sourceRewardEventId,
          db.rewardEvents.id,
        ),
      );

  $$RewardEventsTableProcessedTableManager? get sourceRewardEventId {
    final $_column = $_itemColumn<String>('source_reward_event_id');
    if ($_column == null) return null;
    final manager = $$RewardEventsTableTableManager(
      $_db,
      $_db.rewardEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceRewardEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EquipmentInventoryTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentInventoryTable> {
  $$EquipmentInventoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EquipmentDefinitionsTableFilterComposer get equipmentId {
    final $$EquipmentDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentId,
      referencedTable: $db.equipmentDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.equipmentDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RewardEventsTableFilterComposer get sourceRewardEventId {
    final $$RewardEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceRewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableFilterComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentInventoryTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentInventoryTable> {
  $$EquipmentInventoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EquipmentDefinitionsTableOrderingComposer get equipmentId {
    final $$EquipmentDefinitionsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.equipmentId,
          referencedTable: $db.equipmentDefinitions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentDefinitionsTableOrderingComposer(
                $db: $db,
                $table: $db.equipmentDefinitions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$RewardEventsTableOrderingComposer get sourceRewardEventId {
    final $$RewardEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceRewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableOrderingComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentInventoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentInventoryTable> {
  $$EquipmentInventoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );

  $$EquipmentDefinitionsTableAnnotationComposer get equipmentId {
    final $$EquipmentDefinitionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.equipmentId,
          referencedTable: $db.equipmentDefinitions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentDefinitionsTableAnnotationComposer(
                $db: $db,
                $table: $db.equipmentDefinitions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$RewardEventsTableAnnotationComposer get sourceRewardEventId {
    final $$RewardEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceRewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentInventoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentInventoryTable,
          EquipmentInventoryData,
          $$EquipmentInventoryTableFilterComposer,
          $$EquipmentInventoryTableOrderingComposer,
          $$EquipmentInventoryTableAnnotationComposer,
          $$EquipmentInventoryTableCreateCompanionBuilder,
          $$EquipmentInventoryTableUpdateCompanionBuilder,
          (EquipmentInventoryData, $$EquipmentInventoryTableReferences),
          EquipmentInventoryData,
          PrefetchHooks Function({bool equipmentId, bool sourceRewardEventId})
        > {
  $$EquipmentInventoryTableTableManager(
    _$AppDatabase db,
    $EquipmentInventoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentInventoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquipmentInventoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EquipmentInventoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> equipmentId = const Value.absent(),
                Value<String?> sourceRewardEventId = const Value.absent(),
                Value<DateTime> unlockedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EquipmentInventoryCompanion(
                equipmentId: equipmentId,
                sourceRewardEventId: sourceRewardEventId,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String equipmentId,
                Value<String?> sourceRewardEventId = const Value.absent(),
                required DateTime unlockedAt,
                Value<int> rowid = const Value.absent(),
              }) => EquipmentInventoryCompanion.insert(
                equipmentId: equipmentId,
                sourceRewardEventId: sourceRewardEventId,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EquipmentInventoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({equipmentId = false, sourceRewardEventId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (equipmentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.equipmentId,
                                    referencedTable:
                                        $$EquipmentInventoryTableReferences
                                            ._equipmentIdTable(db),
                                    referencedColumn:
                                        $$EquipmentInventoryTableReferences
                                            ._equipmentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sourceRewardEventId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceRewardEventId,
                                    referencedTable:
                                        $$EquipmentInventoryTableReferences
                                            ._sourceRewardEventIdTable(db),
                                    referencedColumn:
                                        $$EquipmentInventoryTableReferences
                                            ._sourceRewardEventIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$EquipmentInventoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentInventoryTable,
      EquipmentInventoryData,
      $$EquipmentInventoryTableFilterComposer,
      $$EquipmentInventoryTableOrderingComposer,
      $$EquipmentInventoryTableAnnotationComposer,
      $$EquipmentInventoryTableCreateCompanionBuilder,
      $$EquipmentInventoryTableUpdateCompanionBuilder,
      (EquipmentInventoryData, $$EquipmentInventoryTableReferences),
      EquipmentInventoryData,
      PrefetchHooks Function({bool equipmentId, bool sourceRewardEventId})
    >;
typedef $$EquippedEquipmentTableCreateCompanionBuilder =
    EquippedEquipmentCompanion Function({
      required String slot,
      required String equipmentId,
      required DateTime equippedAt,
      Value<int> rowid,
    });
typedef $$EquippedEquipmentTableUpdateCompanionBuilder =
    EquippedEquipmentCompanion Function({
      Value<String> slot,
      Value<String> equipmentId,
      Value<DateTime> equippedAt,
      Value<int> rowid,
    });

final class $$EquippedEquipmentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EquippedEquipmentTable,
          EquippedEquipmentData
        > {
  $$EquippedEquipmentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EquipmentDefinitionsTable _equipmentIdTable(_$AppDatabase db) =>
      db.equipmentDefinitions.createAlias(
        $_aliasNameGenerator(
          db.equippedEquipment.equipmentId,
          db.equipmentDefinitions.id,
        ),
      );

  $$EquipmentDefinitionsTableProcessedTableManager get equipmentId {
    final $_column = $_itemColumn<String>('equipment_id')!;

    final manager = $$EquipmentDefinitionsTableTableManager(
      $_db,
      $_db.equipmentDefinitions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_equipmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EquippedEquipmentTableFilterComposer
    extends Composer<_$AppDatabase, $EquippedEquipmentTable> {
  $$EquippedEquipmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get equippedAt => $composableBuilder(
    column: $table.equippedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EquipmentDefinitionsTableFilterComposer get equipmentId {
    final $$EquipmentDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentId,
      referencedTable: $db.equipmentDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.equipmentDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquippedEquipmentTableOrderingComposer
    extends Composer<_$AppDatabase, $EquippedEquipmentTable> {
  $$EquippedEquipmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get equippedAt => $composableBuilder(
    column: $table.equippedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EquipmentDefinitionsTableOrderingComposer get equipmentId {
    final $$EquipmentDefinitionsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.equipmentId,
          referencedTable: $db.equipmentDefinitions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentDefinitionsTableOrderingComposer(
                $db: $db,
                $table: $db.equipmentDefinitions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$EquippedEquipmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquippedEquipmentTable> {
  $$EquippedEquipmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<DateTime> get equippedAt => $composableBuilder(
    column: $table.equippedAt,
    builder: (column) => column,
  );

  $$EquipmentDefinitionsTableAnnotationComposer get equipmentId {
    final $$EquipmentDefinitionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.equipmentId,
          referencedTable: $db.equipmentDefinitions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentDefinitionsTableAnnotationComposer(
                $db: $db,
                $table: $db.equipmentDefinitions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$EquippedEquipmentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquippedEquipmentTable,
          EquippedEquipmentData,
          $$EquippedEquipmentTableFilterComposer,
          $$EquippedEquipmentTableOrderingComposer,
          $$EquippedEquipmentTableAnnotationComposer,
          $$EquippedEquipmentTableCreateCompanionBuilder,
          $$EquippedEquipmentTableUpdateCompanionBuilder,
          (EquippedEquipmentData, $$EquippedEquipmentTableReferences),
          EquippedEquipmentData,
          PrefetchHooks Function({bool equipmentId})
        > {
  $$EquippedEquipmentTableTableManager(
    _$AppDatabase db,
    $EquippedEquipmentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquippedEquipmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquippedEquipmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EquippedEquipmentTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> slot = const Value.absent(),
                Value<String> equipmentId = const Value.absent(),
                Value<DateTime> equippedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EquippedEquipmentCompanion(
                slot: slot,
                equipmentId: equipmentId,
                equippedAt: equippedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String slot,
                required String equipmentId,
                required DateTime equippedAt,
                Value<int> rowid = const Value.absent(),
              }) => EquippedEquipmentCompanion.insert(
                slot: slot,
                equipmentId: equipmentId,
                equippedAt: equippedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EquippedEquipmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({equipmentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (equipmentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.equipmentId,
                                referencedTable:
                                    $$EquippedEquipmentTableReferences
                                        ._equipmentIdTable(db),
                                referencedColumn:
                                    $$EquippedEquipmentTableReferences
                                        ._equipmentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EquippedEquipmentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquippedEquipmentTable,
      EquippedEquipmentData,
      $$EquippedEquipmentTableFilterComposer,
      $$EquippedEquipmentTableOrderingComposer,
      $$EquippedEquipmentTableAnnotationComposer,
      $$EquippedEquipmentTableCreateCompanionBuilder,
      $$EquippedEquipmentTableUpdateCompanionBuilder,
      (EquippedEquipmentData, $$EquippedEquipmentTableReferences),
      EquippedEquipmentData,
      PrefetchHooks Function({bool equipmentId})
    >;
typedef $$TitleDefinitionsTableCreateCompanionBuilder =
    TitleDefinitionsCompanion Function({
      required String id,
      required String name,
      required String description,
      Value<int> requiredLevel,
      Value<int> sortOrder,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TitleDefinitionsTableUpdateCompanionBuilder =
    TitleDefinitionsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<int> requiredLevel,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$TitleDefinitionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $TitleDefinitionsTable, TitleDefinition> {
  $$TitleDefinitionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$AdventurerTitlesTable, List<AdventurerTitle>>
  _adventurerTitlesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.adventurerTitles,
    aliasName: $_aliasNameGenerator(
      db.titleDefinitions.id,
      db.adventurerTitles.titleId,
    ),
  );

  $$AdventurerTitlesTableProcessedTableManager get adventurerTitlesRefs {
    final manager = $$AdventurerTitlesTableTableManager(
      $_db,
      $_db.adventurerTitles,
    ).filter((f) => f.titleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _adventurerTitlesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TitleDefinitionsTableFilterComposer
    extends Composer<_$AppDatabase, $TitleDefinitionsTable> {
  $$TitleDefinitionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requiredLevel => $composableBuilder(
    column: $table.requiredLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> adventurerTitlesRefs(
    Expression<bool> Function($$AdventurerTitlesTableFilterComposer f) f,
  ) {
    final $$AdventurerTitlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adventurerTitles,
      getReferencedColumn: (t) => t.titleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdventurerTitlesTableFilterComposer(
            $db: $db,
            $table: $db.adventurerTitles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TitleDefinitionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TitleDefinitionsTable> {
  $$TitleDefinitionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requiredLevel => $composableBuilder(
    column: $table.requiredLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TitleDefinitionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TitleDefinitionsTable> {
  $$TitleDefinitionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get requiredLevel => $composableBuilder(
    column: $table.requiredLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> adventurerTitlesRefs<T extends Object>(
    Expression<T> Function($$AdventurerTitlesTableAnnotationComposer a) f,
  ) {
    final $$AdventurerTitlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adventurerTitles,
      getReferencedColumn: (t) => t.titleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdventurerTitlesTableAnnotationComposer(
            $db: $db,
            $table: $db.adventurerTitles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TitleDefinitionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TitleDefinitionsTable,
          TitleDefinition,
          $$TitleDefinitionsTableFilterComposer,
          $$TitleDefinitionsTableOrderingComposer,
          $$TitleDefinitionsTableAnnotationComposer,
          $$TitleDefinitionsTableCreateCompanionBuilder,
          $$TitleDefinitionsTableUpdateCompanionBuilder,
          (TitleDefinition, $$TitleDefinitionsTableReferences),
          TitleDefinition,
          PrefetchHooks Function({bool adventurerTitlesRefs})
        > {
  $$TitleDefinitionsTableTableManager(
    _$AppDatabase db,
    $TitleDefinitionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TitleDefinitionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TitleDefinitionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TitleDefinitionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> requiredLevel = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TitleDefinitionsCompanion(
                id: id,
                name: name,
                description: description,
                requiredLevel: requiredLevel,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                Value<int> requiredLevel = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TitleDefinitionsCompanion.insert(
                id: id,
                name: name,
                description: description,
                requiredLevel: requiredLevel,
                sortOrder: sortOrder,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TitleDefinitionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({adventurerTitlesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (adventurerTitlesRefs) db.adventurerTitles,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (adventurerTitlesRefs)
                    await $_getPrefetchedData<
                      TitleDefinition,
                      $TitleDefinitionsTable,
                      AdventurerTitle
                    >(
                      currentTable: table,
                      referencedTable: $$TitleDefinitionsTableReferences
                          ._adventurerTitlesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TitleDefinitionsTableReferences(
                            db,
                            table,
                            p0,
                          ).adventurerTitlesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.titleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TitleDefinitionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TitleDefinitionsTable,
      TitleDefinition,
      $$TitleDefinitionsTableFilterComposer,
      $$TitleDefinitionsTableOrderingComposer,
      $$TitleDefinitionsTableAnnotationComposer,
      $$TitleDefinitionsTableCreateCompanionBuilder,
      $$TitleDefinitionsTableUpdateCompanionBuilder,
      (TitleDefinition, $$TitleDefinitionsTableReferences),
      TitleDefinition,
      PrefetchHooks Function({bool adventurerTitlesRefs})
    >;
typedef $$AdventurerTitlesTableCreateCompanionBuilder =
    AdventurerTitlesCompanion Function({
      required String titleId,
      Value<String?> sourceRewardEventId,
      required DateTime unlockedAt,
      Value<int> rowid,
    });
typedef $$AdventurerTitlesTableUpdateCompanionBuilder =
    AdventurerTitlesCompanion Function({
      Value<String> titleId,
      Value<String?> sourceRewardEventId,
      Value<DateTime> unlockedAt,
      Value<int> rowid,
    });

final class $$AdventurerTitlesTableReferences
    extends
        BaseReferences<_$AppDatabase, $AdventurerTitlesTable, AdventurerTitle> {
  $$AdventurerTitlesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TitleDefinitionsTable _titleIdTable(_$AppDatabase db) =>
      db.titleDefinitions.createAlias(
        $_aliasNameGenerator(
          db.adventurerTitles.titleId,
          db.titleDefinitions.id,
        ),
      );

  $$TitleDefinitionsTableProcessedTableManager get titleId {
    final $_column = $_itemColumn<String>('title_id')!;

    final manager = $$TitleDefinitionsTableTableManager(
      $_db,
      $_db.titleDefinitions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_titleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RewardEventsTable _sourceRewardEventIdTable(_$AppDatabase db) =>
      db.rewardEvents.createAlias(
        $_aliasNameGenerator(
          db.adventurerTitles.sourceRewardEventId,
          db.rewardEvents.id,
        ),
      );

  $$RewardEventsTableProcessedTableManager? get sourceRewardEventId {
    final $_column = $_itemColumn<String>('source_reward_event_id');
    if ($_column == null) return null;
    final manager = $$RewardEventsTableTableManager(
      $_db,
      $_db.rewardEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceRewardEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AdventurerTitlesTableFilterComposer
    extends Composer<_$AppDatabase, $AdventurerTitlesTable> {
  $$AdventurerTitlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TitleDefinitionsTableFilterComposer get titleId {
    final $$TitleDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.titleId,
      referencedTable: $db.titleDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TitleDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.titleDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RewardEventsTableFilterComposer get sourceRewardEventId {
    final $$RewardEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceRewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableFilterComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdventurerTitlesTableOrderingComposer
    extends Composer<_$AppDatabase, $AdventurerTitlesTable> {
  $$AdventurerTitlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TitleDefinitionsTableOrderingComposer get titleId {
    final $$TitleDefinitionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.titleId,
      referencedTable: $db.titleDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TitleDefinitionsTableOrderingComposer(
            $db: $db,
            $table: $db.titleDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RewardEventsTableOrderingComposer get sourceRewardEventId {
    final $$RewardEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceRewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableOrderingComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdventurerTitlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdventurerTitlesTable> {
  $$AdventurerTitlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );

  $$TitleDefinitionsTableAnnotationComposer get titleId {
    final $$TitleDefinitionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.titleId,
      referencedTable: $db.titleDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TitleDefinitionsTableAnnotationComposer(
            $db: $db,
            $table: $db.titleDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RewardEventsTableAnnotationComposer get sourceRewardEventId {
    final $$RewardEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceRewardEventId,
      referencedTable: $db.rewardEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RewardEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.rewardEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdventurerTitlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdventurerTitlesTable,
          AdventurerTitle,
          $$AdventurerTitlesTableFilterComposer,
          $$AdventurerTitlesTableOrderingComposer,
          $$AdventurerTitlesTableAnnotationComposer,
          $$AdventurerTitlesTableCreateCompanionBuilder,
          $$AdventurerTitlesTableUpdateCompanionBuilder,
          (AdventurerTitle, $$AdventurerTitlesTableReferences),
          AdventurerTitle,
          PrefetchHooks Function({bool titleId, bool sourceRewardEventId})
        > {
  $$AdventurerTitlesTableTableManager(
    _$AppDatabase db,
    $AdventurerTitlesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdventurerTitlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdventurerTitlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdventurerTitlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> titleId = const Value.absent(),
                Value<String?> sourceRewardEventId = const Value.absent(),
                Value<DateTime> unlockedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdventurerTitlesCompanion(
                titleId: titleId,
                sourceRewardEventId: sourceRewardEventId,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String titleId,
                Value<String?> sourceRewardEventId = const Value.absent(),
                required DateTime unlockedAt,
                Value<int> rowid = const Value.absent(),
              }) => AdventurerTitlesCompanion.insert(
                titleId: titleId,
                sourceRewardEventId: sourceRewardEventId,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AdventurerTitlesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({titleId = false, sourceRewardEventId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (titleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.titleId,
                                    referencedTable:
                                        $$AdventurerTitlesTableReferences
                                            ._titleIdTable(db),
                                    referencedColumn:
                                        $$AdventurerTitlesTableReferences
                                            ._titleIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sourceRewardEventId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceRewardEventId,
                                    referencedTable:
                                        $$AdventurerTitlesTableReferences
                                            ._sourceRewardEventIdTable(db),
                                    referencedColumn:
                                        $$AdventurerTitlesTableReferences
                                            ._sourceRewardEventIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AdventurerTitlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdventurerTitlesTable,
      AdventurerTitle,
      $$AdventurerTitlesTableFilterComposer,
      $$AdventurerTitlesTableOrderingComposer,
      $$AdventurerTitlesTableAnnotationComposer,
      $$AdventurerTitlesTableCreateCompanionBuilder,
      $$AdventurerTitlesTableUpdateCompanionBuilder,
      (AdventurerTitle, $$AdventurerTitlesTableReferences),
      AdventurerTitle,
      PrefetchHooks Function({bool titleId, bool sourceRewardEventId})
    >;
typedef $$BodyweightLogsTableCreateCompanionBuilder =
    BodyweightLogsCompanion Function({
      required String id,
      required DateTime loggedAt,
      required double weightKg,
      Value<String?> notes,
      Value<bool> isSeedExample,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$BodyweightLogsTableUpdateCompanionBuilder =
    BodyweightLogsCompanion Function({
      Value<String> id,
      Value<DateTime> loggedAt,
      Value<double> weightKg,
      Value<String?> notes,
      Value<bool> isSeedExample,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$BodyweightLogsTableFilterComposer
    extends Composer<_$AppDatabase, $BodyweightLogsTable> {
  $$BodyweightLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeedExample => $composableBuilder(
    column: $table.isSeedExample,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BodyweightLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyweightLogsTable> {
  $$BodyweightLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeedExample => $composableBuilder(
    column: $table.isSeedExample,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BodyweightLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyweightLogsTable> {
  $$BodyweightLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isSeedExample => $composableBuilder(
    column: $table.isSeedExample,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BodyweightLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BodyweightLogsTable,
          BodyweightLog,
          $$BodyweightLogsTableFilterComposer,
          $$BodyweightLogsTableOrderingComposer,
          $$BodyweightLogsTableAnnotationComposer,
          $$BodyweightLogsTableCreateCompanionBuilder,
          $$BodyweightLogsTableUpdateCompanionBuilder,
          (
            BodyweightLog,
            BaseReferences<_$AppDatabase, $BodyweightLogsTable, BodyweightLog>,
          ),
          BodyweightLog,
          PrefetchHooks Function()
        > {
  $$BodyweightLogsTableTableManager(
    _$AppDatabase db,
    $BodyweightLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyweightLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BodyweightLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BodyweightLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isSeedExample = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BodyweightLogsCompanion(
                id: id,
                loggedAt: loggedAt,
                weightKg: weightKg,
                notes: notes,
                isSeedExample: isSeedExample,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime loggedAt,
                required double weightKg,
                Value<String?> notes = const Value.absent(),
                Value<bool> isSeedExample = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => BodyweightLogsCompanion.insert(
                id: id,
                loggedAt: loggedAt,
                weightKg: weightKg,
                notes: notes,
                isSeedExample: isSeedExample,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BodyweightLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BodyweightLogsTable,
      BodyweightLog,
      $$BodyweightLogsTableFilterComposer,
      $$BodyweightLogsTableOrderingComposer,
      $$BodyweightLogsTableAnnotationComposer,
      $$BodyweightLogsTableCreateCompanionBuilder,
      $$BodyweightLogsTableUpdateCompanionBuilder,
      (
        BodyweightLog,
        BaseReferences<_$AppDatabase, $BodyweightLogsTable, BodyweightLog>,
      ),
      BodyweightLog,
      PrefetchHooks Function()
    >;
typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      required String id,
      Value<String?> campaignId,
      required String name,
      required String category,
      Value<double?> currentValue,
      required double targetValue,
      required String unit,
      required String direction,
      Value<String?> linkedMetric,
      Value<DateTime?> targetDate,
      Value<bool> isSeedContent,
      Value<bool> isArchived,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<String> id,
      Value<String?> campaignId,
      Value<String> name,
      Value<String> category,
      Value<double?> currentValue,
      Value<double> targetValue,
      Value<String> unit,
      Value<String> direction,
      Value<String?> linkedMetric,
      Value<DateTime?> targetDate,
      Value<bool> isSeedContent,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CampaignsTable _campaignIdTable(_$AppDatabase db) => db.campaigns
      .createAlias($_aliasNameGenerator(db.goals.campaignId, db.campaigns.id));

  $$CampaignsTableProcessedTableManager? get campaignId {
    final $_column = $_itemColumn<String>('campaign_id');
    if ($_column == null) return null;
    final manager = $$CampaignsTableTableManager(
      $_db,
      $_db.campaigns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_campaignIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedMetric => $composableBuilder(
    column: $table.linkedMetric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CampaignsTableFilterComposer get campaignId {
    final $$CampaignsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableFilterComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedMetric => $composableBuilder(
    column: $table.linkedMetric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CampaignsTableOrderingComposer get campaignId {
    final $$CampaignsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableOrderingComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get currentValue => $composableBuilder(
    column: $table.currentValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetValue => $composableBuilder(
    column: $table.targetValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get linkedMetric => $composableBuilder(
    column: $table.linkedMetric,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSeedContent => $composableBuilder(
    column: $table.isSeedContent,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CampaignsTableAnnotationComposer get campaignId {
    final $$CampaignsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.campaignId,
      referencedTable: $db.campaigns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CampaignsTableAnnotationComposer(
            $db: $db,
            $table: $db.campaigns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, $$GoalsTableReferences),
          Goal,
          PrefetchHooks Function({bool campaignId})
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> campaignId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double?> currentValue = const Value.absent(),
                Value<double> targetValue = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> direction = const Value.absent(),
                Value<String?> linkedMetric = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                campaignId: campaignId,
                name: name,
                category: category,
                currentValue: currentValue,
                targetValue: targetValue,
                unit: unit,
                direction: direction,
                linkedMetric: linkedMetric,
                targetDate: targetDate,
                isSeedContent: isSeedContent,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> campaignId = const Value.absent(),
                required String name,
                required String category,
                Value<double?> currentValue = const Value.absent(),
                required double targetValue,
                required String unit,
                required String direction,
                Value<String?> linkedMetric = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<bool> isSeedContent = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion.insert(
                id: id,
                campaignId: campaignId,
                name: name,
                category: category,
                currentValue: currentValue,
                targetValue: targetValue,
                unit: unit,
                direction: direction,
                linkedMetric: linkedMetric,
                targetDate: targetDate,
                isSeedContent: isSeedContent,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GoalsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({campaignId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (campaignId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.campaignId,
                                referencedTable: $$GoalsTableReferences
                                    ._campaignIdTable(db),
                                referencedColumn: $$GoalsTableReferences
                                    ._campaignIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, $$GoalsTableReferences),
      Goal,
      PrefetchHooks Function({bool campaignId})
    >;
typedef $$SeedRunsTableCreateCompanionBuilder =
    SeedRunsCompanion Function({
      required String id,
      required String seedName,
      required int seedVersion,
      required DateTime appliedAt,
      Value<int> rowid,
    });
typedef $$SeedRunsTableUpdateCompanionBuilder =
    SeedRunsCompanion Function({
      Value<String> id,
      Value<String> seedName,
      Value<int> seedVersion,
      Value<DateTime> appliedAt,
      Value<int> rowid,
    });

class $$SeedRunsTableFilterComposer
    extends Composer<_$AppDatabase, $SeedRunsTable> {
  $$SeedRunsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seedName => $composableBuilder(
    column: $table.seedName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SeedRunsTableOrderingComposer
    extends Composer<_$AppDatabase, $SeedRunsTable> {
  $$SeedRunsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seedName => $composableBuilder(
    column: $table.seedName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SeedRunsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeedRunsTable> {
  $$SeedRunsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get seedName =>
      $composableBuilder(column: $table.seedName, builder: (column) => column);

  GeneratedColumn<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get appliedAt =>
      $composableBuilder(column: $table.appliedAt, builder: (column) => column);
}

class $$SeedRunsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeedRunsTable,
          SeedRun,
          $$SeedRunsTableFilterComposer,
          $$SeedRunsTableOrderingComposer,
          $$SeedRunsTableAnnotationComposer,
          $$SeedRunsTableCreateCompanionBuilder,
          $$SeedRunsTableUpdateCompanionBuilder,
          (SeedRun, BaseReferences<_$AppDatabase, $SeedRunsTable, SeedRun>),
          SeedRun,
          PrefetchHooks Function()
        > {
  $$SeedRunsTableTableManager(_$AppDatabase db, $SeedRunsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeedRunsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeedRunsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeedRunsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> seedName = const Value.absent(),
                Value<int> seedVersion = const Value.absent(),
                Value<DateTime> appliedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SeedRunsCompanion(
                id: id,
                seedName: seedName,
                seedVersion: seedVersion,
                appliedAt: appliedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String seedName,
                required int seedVersion,
                required DateTime appliedAt,
                Value<int> rowid = const Value.absent(),
              }) => SeedRunsCompanion.insert(
                id: id,
                seedName: seedName,
                seedVersion: seedVersion,
                appliedAt: appliedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SeedRunsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeedRunsTable,
      SeedRun,
      $$SeedRunsTableFilterComposer,
      $$SeedRunsTableOrderingComposer,
      $$SeedRunsTableAnnotationComposer,
      $$SeedRunsTableCreateCompanionBuilder,
      $$SeedRunsTableUpdateCompanionBuilder,
      (SeedRun, BaseReferences<_$AppDatabase, $SeedRunsTable, SeedRun>),
      SeedRun,
      PrefetchHooks Function()
    >;
typedef $$PetsTableCreateCompanionBuilder =
    PetsCompanion Function({
      required String id,
      Value<String> name,
      Value<String> speciesKey,
      Value<int> evolutionStage,
      Value<int> bondLevel,
      Value<int> bondXp,
      Value<String> mood,
      Value<double> energyPercent,
      Value<DateTime?> lastTreatAt,
      Value<DateTime?> lastPlayAt,
      Value<DateTime?> lastRestAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PetsTableUpdateCompanionBuilder =
    PetsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> speciesKey,
      Value<int> evolutionStage,
      Value<int> bondLevel,
      Value<int> bondXp,
      Value<String> mood,
      Value<double> energyPercent,
      Value<DateTime?> lastTreatAt,
      Value<DateTime?> lastPlayAt,
      Value<DateTime?> lastRestAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$PetsTableReferences
    extends BaseReferences<_$AppDatabase, $PetsTable, Pet> {
  $$PetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $PetEvolutionHistoryTable,
    List<PetEvolutionHistoryData>
  >
  _petEvolutionHistoryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.petEvolutionHistory,
        aliasName: $_aliasNameGenerator(
          db.pets.id,
          db.petEvolutionHistory.petId,
        ),
      );

  $$PetEvolutionHistoryTableProcessedTableManager get petEvolutionHistoryRefs {
    final manager = $$PetEvolutionHistoryTableTableManager(
      $_db,
      $_db.petEvolutionHistory,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _petEvolutionHistoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PetsTableFilterComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speciesKey => $composableBuilder(
    column: $table.speciesKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get evolutionStage => $composableBuilder(
    column: $table.evolutionStage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bondLevel => $composableBuilder(
    column: $table.bondLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bondXp => $composableBuilder(
    column: $table.bondXp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get energyPercent => $composableBuilder(
    column: $table.energyPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastTreatAt => $composableBuilder(
    column: $table.lastTreatAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPlayAt => $composableBuilder(
    column: $table.lastPlayAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastRestAt => $composableBuilder(
    column: $table.lastRestAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> petEvolutionHistoryRefs(
    Expression<bool> Function($$PetEvolutionHistoryTableFilterComposer f) f,
  ) {
    final $$PetEvolutionHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.petEvolutionHistory,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetEvolutionHistoryTableFilterComposer(
            $db: $db,
            $table: $db.petEvolutionHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PetsTableOrderingComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speciesKey => $composableBuilder(
    column: $table.speciesKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get evolutionStage => $composableBuilder(
    column: $table.evolutionStage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bondLevel => $composableBuilder(
    column: $table.bondLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bondXp => $composableBuilder(
    column: $table.bondXp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get energyPercent => $composableBuilder(
    column: $table.energyPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastTreatAt => $composableBuilder(
    column: $table.lastTreatAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPlayAt => $composableBuilder(
    column: $table.lastPlayAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastRestAt => $composableBuilder(
    column: $table.lastRestAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get speciesKey => $composableBuilder(
    column: $table.speciesKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get evolutionStage => $composableBuilder(
    column: $table.evolutionStage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bondLevel =>
      $composableBuilder(column: $table.bondLevel, builder: (column) => column);

  GeneratedColumn<int> get bondXp =>
      $composableBuilder(column: $table.bondXp, builder: (column) => column);

  GeneratedColumn<String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<double> get energyPercent => $composableBuilder(
    column: $table.energyPercent,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastTreatAt => $composableBuilder(
    column: $table.lastTreatAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPlayAt => $composableBuilder(
    column: $table.lastPlayAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastRestAt => $composableBuilder(
    column: $table.lastRestAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> petEvolutionHistoryRefs<T extends Object>(
    Expression<T> Function($$PetEvolutionHistoryTableAnnotationComposer a) f,
  ) {
    final $$PetEvolutionHistoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.petEvolutionHistory,
          getReferencedColumn: (t) => t.petId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PetEvolutionHistoryTableAnnotationComposer(
                $db: $db,
                $table: $db.petEvolutionHistory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetsTable,
          Pet,
          $$PetsTableFilterComposer,
          $$PetsTableOrderingComposer,
          $$PetsTableAnnotationComposer,
          $$PetsTableCreateCompanionBuilder,
          $$PetsTableUpdateCompanionBuilder,
          (Pet, $$PetsTableReferences),
          Pet,
          PrefetchHooks Function({bool petEvolutionHistoryRefs})
        > {
  $$PetsTableTableManager(_$AppDatabase db, $PetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> speciesKey = const Value.absent(),
                Value<int> evolutionStage = const Value.absent(),
                Value<int> bondLevel = const Value.absent(),
                Value<int> bondXp = const Value.absent(),
                Value<String> mood = const Value.absent(),
                Value<double> energyPercent = const Value.absent(),
                Value<DateTime?> lastTreatAt = const Value.absent(),
                Value<DateTime?> lastPlayAt = const Value.absent(),
                Value<DateTime?> lastRestAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion(
                id: id,
                name: name,
                speciesKey: speciesKey,
                evolutionStage: evolutionStage,
                bondLevel: bondLevel,
                bondXp: bondXp,
                mood: mood,
                energyPercent: energyPercent,
                lastTreatAt: lastTreatAt,
                lastPlayAt: lastPlayAt,
                lastRestAt: lastRestAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> name = const Value.absent(),
                Value<String> speciesKey = const Value.absent(),
                Value<int> evolutionStage = const Value.absent(),
                Value<int> bondLevel = const Value.absent(),
                Value<int> bondXp = const Value.absent(),
                Value<String> mood = const Value.absent(),
                Value<double> energyPercent = const Value.absent(),
                Value<DateTime?> lastTreatAt = const Value.absent(),
                Value<DateTime?> lastPlayAt = const Value.absent(),
                Value<DateTime?> lastRestAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion.insert(
                id: id,
                name: name,
                speciesKey: speciesKey,
                evolutionStage: evolutionStage,
                bondLevel: bondLevel,
                bondXp: bondXp,
                mood: mood,
                energyPercent: energyPercent,
                lastTreatAt: lastTreatAt,
                lastPlayAt: lastPlayAt,
                lastRestAt: lastRestAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PetsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({petEvolutionHistoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (petEvolutionHistoryRefs) db.petEvolutionHistory,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (petEvolutionHistoryRefs)
                    await $_getPrefetchedData<
                      Pet,
                      $PetsTable,
                      PetEvolutionHistoryData
                    >(
                      currentTable: table,
                      referencedTable: $$PetsTableReferences
                          ._petEvolutionHistoryRefsTable(db),
                      managerFromTypedResult: (p0) => $$PetsTableReferences(
                        db,
                        table,
                        p0,
                      ).petEvolutionHistoryRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.petId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetsTable,
      Pet,
      $$PetsTableFilterComposer,
      $$PetsTableOrderingComposer,
      $$PetsTableAnnotationComposer,
      $$PetsTableCreateCompanionBuilder,
      $$PetsTableUpdateCompanionBuilder,
      (Pet, $$PetsTableReferences),
      Pet,
      PrefetchHooks Function({bool petEvolutionHistoryRefs})
    >;
typedef $$PetEvolutionHistoryTableCreateCompanionBuilder =
    PetEvolutionHistoryCompanion Function({
      required String id,
      required String petId,
      required int fromStage,
      required int toStage,
      required DateTime evolvedAt,
      Value<int> rowid,
    });
typedef $$PetEvolutionHistoryTableUpdateCompanionBuilder =
    PetEvolutionHistoryCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<int> fromStage,
      Value<int> toStage,
      Value<DateTime> evolvedAt,
      Value<int> rowid,
    });

final class $$PetEvolutionHistoryTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PetEvolutionHistoryTable,
          PetEvolutionHistoryData
        > {
  $$PetEvolutionHistoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PetsTable _petIdTable(_$AppDatabase db) => db.pets.createAlias(
    $_aliasNameGenerator(db.petEvolutionHistory.petId, db.pets.id),
  );

  $$PetsTableProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $$PetsTableTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PetEvolutionHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $PetEvolutionHistoryTable> {
  $$PetEvolutionHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fromStage => $composableBuilder(
    column: $table.fromStage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toStage => $composableBuilder(
    column: $table.toStage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get evolvedAt => $composableBuilder(
    column: $table.evolvedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PetsTableFilterComposer get petId {
    final $$PetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PetEvolutionHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $PetEvolutionHistoryTable> {
  $$PetEvolutionHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fromStage => $composableBuilder(
    column: $table.fromStage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toStage => $composableBuilder(
    column: $table.toStage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get evolvedAt => $composableBuilder(
    column: $table.evolvedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PetsTableOrderingComposer get petId {
    final $$PetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PetEvolutionHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetEvolutionHistoryTable> {
  $$PetEvolutionHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get fromStage =>
      $composableBuilder(column: $table.fromStage, builder: (column) => column);

  GeneratedColumn<int> get toStage =>
      $composableBuilder(column: $table.toStage, builder: (column) => column);

  GeneratedColumn<DateTime> get evolvedAt =>
      $composableBuilder(column: $table.evolvedAt, builder: (column) => column);

  $$PetsTableAnnotationComposer get petId {
    final $$PetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PetsTableAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PetEvolutionHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetEvolutionHistoryTable,
          PetEvolutionHistoryData,
          $$PetEvolutionHistoryTableFilterComposer,
          $$PetEvolutionHistoryTableOrderingComposer,
          $$PetEvolutionHistoryTableAnnotationComposer,
          $$PetEvolutionHistoryTableCreateCompanionBuilder,
          $$PetEvolutionHistoryTableUpdateCompanionBuilder,
          (PetEvolutionHistoryData, $$PetEvolutionHistoryTableReferences),
          PetEvolutionHistoryData,
          PrefetchHooks Function({bool petId})
        > {
  $$PetEvolutionHistoryTableTableManager(
    _$AppDatabase db,
    $PetEvolutionHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PetEvolutionHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PetEvolutionHistoryTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PetEvolutionHistoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<int> fromStage = const Value.absent(),
                Value<int> toStage = const Value.absent(),
                Value<DateTime> evolvedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetEvolutionHistoryCompanion(
                id: id,
                petId: petId,
                fromStage: fromStage,
                toStage: toStage,
                evolvedAt: evolvedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required int fromStage,
                required int toStage,
                required DateTime evolvedAt,
                Value<int> rowid = const Value.absent(),
              }) => PetEvolutionHistoryCompanion.insert(
                id: id,
                petId: petId,
                fromStage: fromStage,
                toStage: toStage,
                evolvedAt: evolvedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PetEvolutionHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (petId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.petId,
                                referencedTable:
                                    $$PetEvolutionHistoryTableReferences
                                        ._petIdTable(db),
                                referencedColumn:
                                    $$PetEvolutionHistoryTableReferences
                                        ._petIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PetEvolutionHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetEvolutionHistoryTable,
      PetEvolutionHistoryData,
      $$PetEvolutionHistoryTableFilterComposer,
      $$PetEvolutionHistoryTableOrderingComposer,
      $$PetEvolutionHistoryTableAnnotationComposer,
      $$PetEvolutionHistoryTableCreateCompanionBuilder,
      $$PetEvolutionHistoryTableUpdateCompanionBuilder,
      (PetEvolutionHistoryData, $$PetEvolutionHistoryTableReferences),
      PetEvolutionHistoryData,
      PrefetchHooks Function({bool petId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$CampaignsTableTableManager get campaigns =>
      $$CampaignsTableTableManager(_db, _db.campaigns);
  $$WorkoutTemplatesTableTableManager get workoutTemplates =>
      $$WorkoutTemplatesTableTableManager(_db, _db.workoutTemplates);
  $$WorkoutTemplateExercisesTableTableManager get workoutTemplateExercises =>
      $$WorkoutTemplateExercisesTableTableManager(
        _db,
        _db.workoutTemplateExercises,
      );
  $$ProgramTemplatesTableTableManager get programTemplates =>
      $$ProgramTemplatesTableTableManager(_db, _db.programTemplates);
  $$CampaignPhasesTableTableManager get campaignPhases =>
      $$CampaignPhasesTableTableManager(_db, _db.campaignPhases);
  $$ScheduledWorkoutsTableTableManager get scheduledWorkouts =>
      $$ScheduledWorkoutsTableTableManager(_db, _db.scheduledWorkouts);
  $$SessionLogsTableTableManager get sessionLogs =>
      $$SessionLogsTableTableManager(_db, _db.sessionLogs);
  $$ExerciseLogsTableTableManager get exerciseLogs =>
      $$ExerciseLogsTableTableManager(_db, _db.exerciseLogs);
  $$SetLogsTableTableManager get setLogs =>
      $$SetLogsTableTableManager(_db, _db.setLogs);
  $$WorkingWeightsTableTableManager get workingWeights =>
      $$WorkingWeightsTableTableManager(_db, _db.workingWeights);
  $$CardioLogsTableTableManager get cardioLogs =>
      $$CardioLogsTableTableManager(_db, _db.cardioLogs);
  $$ProgressionSuggestionsTableTableManager get progressionSuggestions =>
      $$ProgressionSuggestionsTableTableManager(
        _db,
        _db.progressionSuggestions,
      );
  $$AdventurersTableTableManager get adventurers =>
      $$AdventurersTableTableManager(_db, _db.adventurers);
  $$FitnessEventsTableTableManager get fitnessEvents =>
      $$FitnessEventsTableTableManager(_db, _db.fitnessEvents);
  $$RewardEventsTableTableManager get rewardEvents =>
      $$RewardEventsTableTableManager(_db, _db.rewardEvents);
  $$XpHistoryTableTableManager get xpHistory =>
      $$XpHistoryTableTableManager(_db, _db.xpHistory);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$AchievementStatesTableTableManager get achievementStates =>
      $$AchievementStatesTableTableManager(_db, _db.achievementStates);
  $$EquipmentDefinitionsTableTableManager get equipmentDefinitions =>
      $$EquipmentDefinitionsTableTableManager(_db, _db.equipmentDefinitions);
  $$EquipmentInventoryTableTableManager get equipmentInventory =>
      $$EquipmentInventoryTableTableManager(_db, _db.equipmentInventory);
  $$EquippedEquipmentTableTableManager get equippedEquipment =>
      $$EquippedEquipmentTableTableManager(_db, _db.equippedEquipment);
  $$TitleDefinitionsTableTableManager get titleDefinitions =>
      $$TitleDefinitionsTableTableManager(_db, _db.titleDefinitions);
  $$AdventurerTitlesTableTableManager get adventurerTitles =>
      $$AdventurerTitlesTableTableManager(_db, _db.adventurerTitles);
  $$BodyweightLogsTableTableManager get bodyweightLogs =>
      $$BodyweightLogsTableTableManager(_db, _db.bodyweightLogs);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$SeedRunsTableTableManager get seedRuns =>
      $$SeedRunsTableTableManager(_db, _db.seedRuns);
  $$PetsTableTableManager get pets => $$PetsTableTableManager(_db, _db.pets);
  $$PetEvolutionHistoryTableTableManager get petEvolutionHistory =>
      $$PetEvolutionHistoryTableTableManager(_db, _db.petEvolutionHistory);
}
