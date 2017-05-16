OkHttpClient client = new OkHttpClient();

MediaType mediaType = MediaType.parse("multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW");
RequestBody body = RequestBody.create(mediaType, "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"foto\"; filename=\"C:\\Users\\nicho\\Desktop\\idee.png\"\r\nContent-Type: image/png\r\n\r\n\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--");
Request request = new Request.Builder()
  .url("https://lalapark.it/api/user/pic")
  .post(body)
  .addHeader("content-type", "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW")
  .addHeader("token", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJwcm92YSIsImV4cCI6MTQ5NTUyNjQ0MTkyMX0.NYeq4xAiAo8iqDBK7LGkuE6FNCAXgsJE5Lhkw-w0N6g")
  .addHeader("cache-control", "no-cache")
  .addHeader("postman-token", "cfe21f73-1af0-5afb-8f89-311fc7e25b06")
  .build();

Response response = client.newCall(request).execute();
