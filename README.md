# in order to use dynamic environments in nginx .conf file fallow the next steps

# create a folder named templates

1. mkdir templates

# inside the folder create a file ends with .conf.templates

2. touch /templates/default.conf.templates

# in the folder you can use environment variables

3. server {
   listen ${PORT};
   }

# in the dockerfile copy the templates folder into /etc/nginx/templates

4. COPY /templates /etc/nginx/templates

# in order to use environment variables in a static page fallow the next steps assuming you have configured your project as explained earlier

# add a script tag in your index.html that assigned a key value to the window object note! the value should be a string for example

1.  <script>
      window._BASE_URL_ = "BASE_URL_PLACEHOLDER";
    </script>

# now we need to access to it but we are using typescript so we can do this

2. interface Window {
   _BASE_URL_: string;
   }

export const BASE*URL = (window as unknown as Window).\_BASE_URL* || "failed";

# and now we are free to go

# we need to configure that the value of the environment variable will take the strings place in the default.conf.template add those tow lines in the location block

3. location / {
   sub_filter_once on;
   sub_filter "BASE_URL_PLACEHOLDER" ${BASE_URL};
   }

# in order to prevent the server to send to the browser using a cached version of the resource add to the location block this line

4. add_header Cache-Control "no-store";

# happy coding

# to deploy the image in k8s

kubectl create namespace env-test
