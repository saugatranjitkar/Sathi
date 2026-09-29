
import 'package:flutter/material.dart';
import 'package:sathi/Page1.dart';

void main() {
runApp(const SathiApp());
}

// ============================================================
// APP ROOT
// ============================================================

class SathiApp extends StatelessWidget {
const SathiApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Sathi',
debugShowCheckedModeBanner: false,

theme: ThemeData(
useMaterial3: true,
colorScheme: ColorScheme.fromSeed(
seedColor: const Color(0xFF5B5BD6),
),
scaffoldBackgroundColor: const Color(0xFFF7F7FB),
),

initialRoute: '/login',

routes: {
'/login': (context) => const LoginPage(),
'/register': (context) => const RegisterPage(),
'/page1': (context) => const Page1(),
},
);
}
}

// ============================================================
// APP HEADER
// ============================================================

class AppHeader extends StatelessWidget {
final String title;
final String subtitle;

const AppHeader({
super.key,
required this.title,
required this.subtitle,
});

@override
Widget build(BuildContext context) {
final scheme = Theme.of(context).colorScheme;

return Column(
children: [
// Logo
Container(
width: 84,
height: 84,

decoration: BoxDecoration(
gradient: LinearGradient(
colors: [
scheme.primary,
scheme.tertiary,
],
begin: Alignment.topLeft,
end: Alignment.bottomRight,
),

borderRadius: BorderRadius.circular(24),

boxShadow: [
BoxShadow(
color: scheme.primary.withAlpha(80),
blurRadius: 20,
offset: const Offset(0, 10),
),
],
),

child: const Icon(
Icons.diversity_3_rounded,
color: Colors.white,
size: 44,
),
),

const SizedBox(height: 16),

// App name
Text(
'Sathi',
style: Theme.of(context)
    .textTheme
    .headlineMedium
    ?.copyWith(
fontWeight: FontWeight.w800,
letterSpacing: 1,
),
),

const SizedBox(height: 24),

// Page title
Text(
title,
style: Theme.of(context)
    .textTheme
    .titleLarge
    ?.copyWith(
fontWeight: FontWeight.w700,
),
),

const SizedBox(height: 4),

// Subtitle
Text(
subtitle,
textAlign: TextAlign.center,

style: Theme.of(context)
    .textTheme
    .bodyMedium
    ?.copyWith(
color: Colors.grey[600],
),
),
],
);
}
}

// ============================================================
// TEXT FIELD
// ============================================================

class AppTextField extends StatelessWidget {
final TextEditingController controller;
final String label;
final IconData icon;
final TextInputType keyboardType;
final String? Function(String?)? validator;

const AppTextField({
super.key,
required this.controller,
required this.label,
required this.icon,
this.keyboardType = TextInputType.text,
this.validator,
});

@override
Widget build(BuildContext context) {
return TextFormField(
controller: controller,

keyboardType: keyboardType,

validator: validator,

decoration: InputDecoration(
labelText: label,

prefixIcon: Icon(icon),

filled: true,

fillColor: Colors.white,

contentPadding: const EdgeInsets.symmetric(
vertical: 18,
horizontal: 16,
),

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),

borderSide: BorderSide.none,
),

enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),

borderSide: BorderSide(
color: Colors.grey.shade300,
),
),
),
);
}
}

// ============================================================
// PASSWORD FIELD
// ============================================================

class PasswordField extends StatefulWidget {
final TextEditingController controller;
final String label;
final String? Function(String?)? validator;

const PasswordField({
super.key,
required this.controller,
required this.label,
this.validator,
});

@override
State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
bool _obscure = true;

@override
Widget build(BuildContext context) {
return TextFormField(
controller: widget.controller,

obscureText: _obscure,

validator: widget.validator,

decoration: InputDecoration(
labelText: widget.label,

prefixIcon: const Icon(
Icons.lock_outline,
),

suffixIcon: IconButton(
icon: Icon(
_obscure
? Icons.visibility_off
    : Icons.visibility,
),

onPressed: () {
setState(() {
_obscure = !_obscure;
});
},
),

filled: true,

fillColor: Colors.white,

contentPadding: const EdgeInsets.symmetric(
vertical: 18,
horizontal: 16,
),

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),

borderSide: BorderSide.none,
),

enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(14),

borderSide: BorderSide(
color: Colors.grey.shade300,
),
),
),
);
}
}

// ============================================================
// PRIMARY BUTTON
// ============================================================

class PrimaryButton extends StatelessWidget {
final String text;
final VoidCallback onPressed;

const PrimaryButton({
super.key,
required this.text,
required this.onPressed,
});

@override
Widget build(BuildContext context) {
return SizedBox(
width: double.infinity,

height: 54,

child: FilledButton(
onPressed: onPressed,

style: FilledButton.styleFrom(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(14),
),
),

child: Text(
text,

style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.w600,
),
),
),
);
}
}

// ============================================================
// VALIDATORS
// ============================================================

String? validateRequired(
String? value,
String fieldName,
) {
if (value == null || value.trim().isEmpty) {
return '$fieldName is required';
}

return null;
}

String? validateEmail(String? value) {
if (value == null || value.trim().isEmpty) {
return 'Email is required';
}

final regex = RegExp(
r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
);

if (!regex.hasMatch(value.trim())) {
return 'Enter a valid email address';
}

return null;
}

String? validatePassword(String? value) {
if (value == null || value.isEmpty) {
return 'Password is required';
}

if (value.length < 6) {
return 'Password must be at least 6 characters';
}

return null;
}

// ============================================================
// LOGIN PAGE
// ============================================================

class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final _formKey = GlobalKey<FormState>();

final _emailCtrl = TextEditingController();

final _passwordCtrl = TextEditingController();

@override
void dispose() {
_emailCtrl.dispose();

_passwordCtrl.dispose();

super.dispose();
}

// ----------------------------------------------------------
// LOGIN
// ----------------------------------------------------------

void _login() {
if (_formKey.currentState!.validate()) {
Navigator.push(
context,

MaterialPageRoute(
builder: (context) => const Page1(),
),
);
}
}

// ----------------------------------------------------------
// FORGOT PASSWORD
// ----------------------------------------------------------

void _showForgotPassword() {
final resetCtrl = TextEditingController(
text: _emailCtrl.text,
);

final dialogKey = GlobalKey<FormState>();

showDialog(
context: context,

builder: (ctx) {
return AlertDialog(
title: const Text(
'Reset password',
),

content: Form(
key: dialogKey,

child: Column(
mainAxisSize: MainAxisSize.min,

children: [
const Text(
"Enter your email and we'll send you a reset link.",
),

const SizedBox(height: 16),

AppTextField(
controller: resetCtrl,

label: 'Email',

icon: Icons.email_outlined,

keyboardType:
TextInputType.emailAddress,

validator: validateEmail,
),
],
),
),

actions: [
TextButton(
onPressed: () {
Navigator.pop(ctx);
},

child: const Text(
'Cancel',
),
),

FilledButton(
onPressed: () {
if (dialogKey.currentState!.validate()) {
Navigator.pop(ctx);

ScaffoldMessenger.of(context)
    .showSnackBar(
SnackBar(
content: Text(
'Reset link sent to ${resetCtrl.text.trim()}',
),
),
);
}
},

child: const Text(
'Send link',
),
),
],
);
},
);
}

// ----------------------------------------------------------
// LOGIN UI
// ----------------------------------------------------------

@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Center(
child: SingleChildScrollView(
padding: const EdgeInsets.symmetric(
horizontal: 24,
vertical: 32,
),

child: ConstrainedBox(
constraints: const BoxConstraints(
maxWidth: 420,
),

child: Form(
key: _formKey,

child: Column(
children: [
const AppHeader(
title: 'Welcome back',

subtitle: 'Log in to continue',
),

const SizedBox(height: 32),

// EMAIL
AppTextField(
controller: _emailCtrl,

label: 'Email or Username',

icon: Icons.person_outline,

keyboardType:
TextInputType.emailAddress,

validator: (value) {
return validateRequired(
value,
'Email or username',
);
},
),

const SizedBox(height: 16),

// PASSWORD
PasswordField(
controller: _passwordCtrl,

label: 'Password',

validator: validatePassword,
),

// FORGOT PASSWORD
Align(
alignment:
Alignment.centerRight,

child: TextButton(
onPressed:
_showForgotPassword,

child: const Text(
'Forgot Password?',
),
),
),

const SizedBox(height: 8),

// LOGIN BUTTON
PrimaryButton(
text: 'Login',

onPressed: _login,
),

const SizedBox(height: 24),

// REGISTER LINK
Row(
mainAxisAlignment:
MainAxisAlignment.center,

children: [
const Text(
"Don't have an account?",
),

TextButton(
onPressed: () {
Navigator
    .pushReplacementNamed(
context,
'/register',
);
},

child: const Text(
'Register',
),
),
],
),
],
),
),
),
),
),
),
);
}
}

// ============================================================
// REGISTER PAGE
// ============================================================

class RegisterPage extends StatefulWidget {
const RegisterPage({super.key});

@override
State<RegisterPage> createState() =>
_RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final _formKey = GlobalKey<FormState>();

final _nameCtrl = TextEditingController();

final _emailCtrl = TextEditingController();

final _passwordCtrl = TextEditingController();

final _confirmCtrl = TextEditingController();

@override
void dispose() {
_nameCtrl.dispose();

_emailCtrl.dispose();

_passwordCtrl.dispose();

_confirmCtrl.dispose();

super.dispose();
}

// ----------------------------------------------------------
// REGISTER
// ----------------------------------------------------------

void _register() {
if (_formKey.currentState!.validate()) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(
'Account created for ${_nameCtrl.text.trim()}',
),
),
);

Navigator.pushReplacementNamed(
context,
'/login',
);
}
}

// ----------------------------------------------------------
// REGISTER UI
// ----------------------------------------------------------

@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Center(
child: SingleChildScrollView(
padding: const EdgeInsets.symmetric(
horizontal: 24,
vertical: 32,
),

child: ConstrainedBox(
constraints: const BoxConstraints(
maxWidth: 420,
),

child: Form(
key: _formKey,

child: Column(
children: [
const AppHeader(
title: 'Create your account',

subtitle: 'Sign up to get started',
),

const SizedBox(height: 32),

// FULL NAME
AppTextField(
controller: _nameCtrl,

label: 'Full Name',

icon: Icons.badge_outlined,

validator: (value) {
return validateRequired(
value,
'Full name',
);
},
),

const SizedBox(height: 16),

// EMAIL
AppTextField(
controller: _emailCtrl,

label: 'Email',

icon: Icons.email_outlined,

keyboardType:
TextInputType.emailAddress,

validator: validateEmail,
),

const SizedBox(height: 16),

// PASSWORD
PasswordField(
controller: _passwordCtrl,

label: 'Password',

validator: validatePassword,
),

const SizedBox(height: 16),

// CONFIRM PASSWORD
PasswordField(
controller: _confirmCtrl,

label: 'Confirm Password',

validator: (value) {
if (value == null ||
value.isEmpty) {
return 'Please confirm your password';
}

if (value !=
_passwordCtrl.text) {
return 'Passwords do not match';
}

return null;
},
),

const SizedBox(height: 24),

// CREATE ACCOUNT
PrimaryButton(
text: 'Create Account',

onPressed: _register,
),

const SizedBox(height: 24),

// LOGIN LINK
Row(
mainAxisAlignment:
MainAxisAlignment.center,

children: [
const Text(
'Already have an account?',
),

TextButton(
onPressed: () {
Navigator
    .pushReplacementNamed(
context,
'/login',
);
},

child: const Text(
'Login',
),
),
],
),
],
),
),
),
),
),
),
);
}
}

