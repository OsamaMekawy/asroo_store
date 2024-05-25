
import 'package:asro/core/app/upload_image/model/upload_image_response.dart';
import 'package:asro/features/auth/data/models/login_response.dart';
import 'package:asro/features/auth/data/models/signup_reponse.dart';
import 'package:asro/features/auth/data/models/user_role_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_sevice.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


   @POST(graphql)
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> mutation,
  );

   @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole();

    @POST('/api/v1/files/upload')
  Future<UploadImageResourse> uploadImage(
    @Body() FormData file,
  );

    @POST(graphql)
  Future<SignUpResponse> signUp(
    @Body() Map<String, dynamic> mutation,
  );


}