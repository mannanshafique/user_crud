import 'package:flutter/material.dart';
import 'package:user_crud/core/controller/user_provider.dart';
import 'package:user_crud/core/model/user_model.dart';
import 'package:user_crud/utils/app_colors.dart';
import 'package:user_crud/utils/app_dialogs.dart';
import 'package:user_crud/utils/app_navigation.dart';
import 'package:user_crud/utils/app_strings.dart';
import 'package:user_crud/utils/constant.dart';
import 'package:user_crud/utils/validation_extension.dart';
import 'package:user_crud/widgets/custom_text.dart';

class AddNewUserScreen extends StatefulWidget {
  const AddNewUserScreen({super.key});

  @override
  State<AddNewUserScreen> createState() => _AddNewUserScreenState();
}

class _AddNewUserScreenState extends State<AddNewUserScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      AppNavigation.navigatorPop(context);
      Cn<UserProvider>().c?.addDataInUserList(
          isInsert: true,
          userData: UserData(
              id: DateTime.now().millisecondsSinceEpoch,
              email: _emailController.text,
              username: _usernameController.text,
              name: _fullNameController.text,
              phone: _phoneController.text,
              company: CompanyData(name: _companyController.text)));
      AppDialogs.showToast(message: AppStrings.FORM_SUBMIT_TEXT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.ADD_NEW_USER_TEXT)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  controller: _usernameController,
                  label: AppStrings.USERNAME_TEXT,
                  validator: (value) => value.validateUsername,
                ),
                _buildTextField(
                  controller: _fullNameController,
                  label: AppStrings.FULL_NAME_TEXT,
                  validator: (value) => value.validateFullName,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: AppStrings.EMAIL_TEXT,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value.validateEmail,
                ),
                _buildTextField(
                  controller: _phoneController,
                  label: AppStrings.PHONE_TEXT,
                  keyboardType: TextInputType.phone,
                  validator: (value) => value.validatePhone,
                ),
                _buildTextField(
                  controller: _addressController,
                  label: AppStrings.ADDRESS_TEXT,
                  validator: (value) => value.validateAddress,
                ),
                _buildTextField(
                  controller: _companyController,
                  label: AppStrings.COMPANY_NAME_TEXT,
                  validator: (value) => value.validateCompany,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: CustomText(
                        text: AppStrings.SUBMIT_TEXT,
                        weight: FontWeight.bold,
                        fontSize: 16.0,
                        fontColor: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
