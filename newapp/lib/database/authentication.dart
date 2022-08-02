import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';


class Authentication with ChangeNotifier
{
  Future<void> register(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyABVXvGqOybYs7B25F5aHbelS4UfoBt-0E';

    try{
      final response = await http.post(Uri.parse(url),
          body:json.encode(
              {
                'email': email,
                'password':password,
                'returnSecureToken':true,
              }
          ));
      final responseData = json.decode(response.body);
      //print(responseData);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
    }catch(error)
    {
      throw error;
    }

  }

  Future<void> logIn(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyABVXvGqOybYs7B25F5aHbelS4UfoBt-0E';

    try{
      final response = await http.post(Uri.parse(url),
          body:json.encode(
              {
                'email': email,
                'password':password,
                'returnSecureToken':true,
              }
          ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
        {
          throw HttpException(responseData['error']['message']);
        }
      //print(responseData);
    }catch(error)
    {
      throw error;
    }

  }
  Future<void> forgotPassword(String email) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyABVXvGqOybYs7B25F5aHbelS4UfoBt-0E';

    try{
      final response = await http.post(Uri.parse(url),
          body:json.encode(
              {
                'email': email,
                'requestType': 'PASSWORD_RESET',
              }
          ));
      final responseData = json.decode(response.body);
      //print(responseData);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
    }catch(error){
      throw error;
    }

  }

  Future<void> signInWithFacebook(String requestUri, String postBody) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithIdp?key=AIzaSyABVXvGqOybYs7B25F5aHbelS4UfoBt-0E';

    try{
      final response = await http.post(Uri.parse(url),
          body:json.encode(
              {
                'postBody':'access_token=[FACEBOOK_ACCESS_TOKEN]&providerId=[facebook.com]',
                'requestUri':'[http://localhost]'
                // 'returnIdpCredential':true,
                //'returnSecureToken':true,
              }
          ));
      final responseData = json.decode(response.body);
      //print(responseData);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
    }catch(error){
      throw error;
    }

  }
}

