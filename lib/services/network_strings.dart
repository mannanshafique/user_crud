// ignore_for_file: constant_identifier_names

class NetworkStrings {
   //////////////////// API BASE URL //////////////////////////////////
 
  static const String API_BASE_URL =
      "https://jsonplaceholder.typicode.com/";

  /////// API HEADER TEXT ////////////////////////
  static const String ACCEPT = 'application/json';

  ////////////////////// API ENDPOINTS  ////////////////////////
  static const String GET_USER_ENDPOINT = "users";


  ////// API STATUS CODE/////////////
  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_CODE = 401;
  static const int CARD_ERROR_CODE = 402;
  static const int BAD_REQUEST_CODE = 400;
  static const int FORBIDDEN_CODE = 403;


  /////////// API TOAST MESSAGES //////////////////
  static const String NO_INTERNET_CONNECTION = "No Internet Connection!";
  static const String SOMETHING_WENT_WRONG = "Something Went Wrong";
   static const String BAD_REQUEST_CODE_TEXT = 'Bad Request Code';
  static const String FORBIDDEN_CODE_TEXT = 'Forbidden Code';
  static const String UNAUTHORIZED_CODE_TEXT = 'Unauthorized Code';


}
