import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../constants/enums/username_status_enum.dart';
import '../../../../../../../constants/local_storage_cache_keys.dart';
import '../../blocs/sign_up_data_preservation_bloc/sign_up_data_preservation_bloc.dart';

class UserInformationForm extends StatefulWidget {
  const UserInformationForm({
    super.key,
    required GlobalKey<FormState> userInformationFormKey,
  }) : _userInformationFormKey = userInformationFormKey;

  final GlobalKey<FormState> _userInformationFormKey;

  @override
  State<UserInformationForm> createState() => _UserInformationFormState();
}

class _UserInformationFormState extends State<UserInformationForm> {
  // Step 1: User Information.
  late UsernameStatusEnum _usernameStatusEnum;
  late Icon _usernameStatusIcon;
  late bool _wasDidChangeDependenciesAlreadyCalledOnce;

  @override
  void initState() {
    super.initState();

    // Step 1: User Information.
    _usernameStatusEnum = UsernameStatusEnum.unknown;
    _wasDidChangeDependenciesAlreadyCalledOnce = false;
  }

  // This is here (instead of of using a ternary operator in the build method) because
  // there are three states for the username status icon indicator: unknown, available, and
  // unavailable. The unknown state is the default state.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_wasDidChangeDependenciesAlreadyCalledOnce) {
      _usernameStatusIcon = Icon(
        Icons.remove_circle_outline_rounded,
        color: Theme.of(context).colorScheme.secondary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._userInformationFormKey,
      child: Column(
        children: <Widget>[
          // TODO: Implement add user display photo feature.

          // Username and username status checker icon.
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Username.
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Username',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Username.';
                    }

                    return null;
                  },
                  onSaved: (String? newValue) {
                    // The [newValue] is guaranteed to be non-null because of the validator.
                    BlocProvider.of<SignUpDataPreservationBloc>(context).add(
                      SignUpDataPreservationFormSaved(
                        key: LocalStorageCacheKeys.username,
                        value: newValue as String,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12.0),

              // Username status checker icon.
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _usernameStatusIcon,
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Horizontal divider.
          const Divider(),
          const SizedBox(height: 8.0),

          // First name and Middle initial.
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // First name.
              Expanded(
                flex: 75,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'First Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your First Name.';
                    }

                    return null;
                  },
                  onSaved: (String? newValue) {
                    // The [newValue] is guaranteed to be non-null because of the validator.
                    BlocProvider.of<SignUpDataPreservationBloc>(context).add(
                      SignUpDataPreservationFormSaved(
                        key: LocalStorageCacheKeys.firstName,
                        value: newValue as String,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12.0),

              // Middle initial.
              Expanded(
                flex: 25,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'M.I.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Middle Initial.';
                    }

                    return null;
                  },
                  onSaved: (String? newValue) {
                    // The [newValue] is guaranteed to be non-null because of the validator.
                    BlocProvider.of<SignUpDataPreservationBloc>(context).add(
                      SignUpDataPreservationFormSaved(
                        key: LocalStorageCacheKeys.middleInitial,
                        value: newValue as String,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          // Last name and suffix.
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Last name.
              Expanded(
                flex: 70,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Last Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last Name.';
                    }

                    return null;
                  },
                  onSaved: (String? newValue) {
                    // The [newValue] is guaranteed to be non-null because of the validator.
                    BlocProvider.of<SignUpDataPreservationBloc>(context).add(
                      SignUpDataPreservationFormSaved(
                        key: LocalStorageCacheKeys.lastName,
                        value: newValue as String,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12.0),

              // Suffix.
              Expanded(
                flex: 30,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    labelText: 'Suffix',
                  ),
                  onSaved: (String? newValue) {
                    // The caching policy would be if a value is null, then an empty string
                    // would be put as the value. This is to not make the null-exception handler
                    // in the infrastructure layer more complicated than what it needs to be.
                    BlocProvider.of<SignUpDataPreservationBloc>(context).add(
                      SignUpDataPreservationFormSaved(
                        key: LocalStorageCacheKeys.suffix,
                        value: newValue ?? '',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
