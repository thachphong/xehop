<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1,maximum-scale=1">
	  {% set define= elements.get_define()%}
	  <meta property="og:site_name" content='{{constant("DOMAIN_NAME")}}'>
      <meta property="og:title" content="{{post_name}}">
      <meta property="og:description" content="{{des}}">  
     <!-- <meta property="og:image" content="/images/logo.png"> -->
      <title>{{post_name}}</title>
      {{ partial('includes/header') }}        
   </head>
   <body>
      {{ partial('includes/menu') }}
      {{ content() }}
      {{ partial('includes/footer') }}
   </body>
</html>