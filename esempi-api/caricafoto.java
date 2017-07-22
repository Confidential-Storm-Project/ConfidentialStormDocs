  new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    OkHttpClient client = new OkHttpClient();

                    MultipartBody.Builder builder = new MultipartBody.Builder()
                            .setType(MultipartBody.FORM);

                    MediaType mediaType = MediaType.parse("image/png");
                    builder.addFormDataPart("foto",fileToUp.getName(),RequestBody.create(mediaType, fileToUp));
                    RequestBody body = builder.build();

                    okhttp3.Request request = new okhttp3.Request.Builder()
                            .url(URL)
                            .post(body)
                            .addHeader("content-type", "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW")
                            .addHeader("token", userToken)
                            .addHeader("cache-control", "no-cache")
                            .build();


                    okhttp3.Response response = client.newCall(request).execute();



                    if(DEBUG)
                        Log.d(TAG_FRAGMENT,mediaType.toString());

                    if(DEBUG)
                        Log.d(TAG_FRAGMENT,response.body().string());

                } catch (IOException | NullPointerException e) {
                    e.printStackTrace();
                }

            }
        }).start();
