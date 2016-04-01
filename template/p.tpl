<html>
<head>
 <title>Temporal.PW - Temporary secure storage for passwords</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css">
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.8/clipboard.min.js"></script>
 <script type="text/javascript" src="https://cdn.rawgit.com/ricmoo/aes-js/master/index.js"></script>
 <script type="text/javascript" src="https://cdn.rawgit.com/45678/base58/master/Base58.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jshashes/1.0.5/hashes.min.js"></script>
</head>
<body>

<style type="text/css">
  body { background: #d3d3d3 !important; }
  .col-centered { float: none; margin: 0 auto; }
</style>

<script>
$(document).ready(function(){
  var clipboard = new Clipboard( "#clip-btn" );
  clipboard.on('success', function(e) {
    $( "#clip-btn" ).tooltip( "enable" ).attr( "title", "Password copied to clipboard" ).tooltip( "fixTitle" ).tooltip( "show" );
  });
  $( "#clip-btn" ).mouseleave( function() {
    $( "#clip-btn" ).tooltip( "disable" );
  });
  
  function simple_checksum(s) { // based on Schnaader's
    var i;
    var chk = 0x12345678;
    for (i = 0; i < s.length; i++) {
      chk += (s.charCodeAt(i) * (i + 1));
    }
    return (chk & 0xff).toString(16); // 2-char is sufficient  -- Depreciated, doesn't null-pad on 0-f, migrate to sha256 instead
  };
  
  // attempt to fetch password based on URL fragment (only the password ID is sent to the server, NOT the decryption key)
  if ( window.location.hash ) {
    var SHA256 = new Hashes.SHA256;
    
    var token = window.location.hash.substring( 1 ).slice( 0, -2 ); // strip "#" from URL fragment
    var checksum = window.location.hash.substring( 1 ).slice( -2 ); // checksum used for better error message
    var id_and_key = token.split( "-", 2 );
    
    var pw_id = id_and_key[ 0 ]; // pw_id used to fetch encrypted password from server
    var key   = id_and_key[ 1 ]; // password decryption key is never sent to server!
    
    if ( checksum != simple_checksum( token ) && checksum != SHA256.hex( token ).substr( 0, 2 ) ) { // checksum only used to provide alternate error (and postpone deleting the encrypted password from server) in the case of accidental URL mangling (e.g. the user is going to get a malformed password by decrypting with a mangled key)
      $( "#message" ).text( "Invalid password URL" );
    } else {
      $.getJSON( "/get/" + pw_id, // this GET also deletes the encrypted password from the server
             function( data ) {
               // decode encrypted password ..
               var decoded_encrypted_bytes = Base58.decode( data.cipher );
               
               // decode key ..
               var decoded_key = Base58.decode( key );
               
               // decrypt decoded password with decoded key ..
               var aesCtr = new aesjs.ModeOfOperation.ctr( decoded_key, new aesjs.Counter( 5 ) );
               var decrypted_bytes = aesCtr.decrypt( decoded_encrypted_bytes );
               
               // Convert our bytes back into text
               var decrypted_password = aesjs.util.convertBytesToString( decrypted_bytes );
               
               $( "#message" ).text( "Your password is:" );
               $( "#password" ).text( decrypted_password );
               $( "#clip-btn" ).removeClass( "hidden" );
               $( "#warning" ).removeClass( "hidden" );
               
             } );
    } // checksum check
  }
  
});

</script>

<center>
<div class="container text-center center-block" align="center">
<br/>
<br/>

<h2><span id="message">This password doesn't exist</span></h2>

<hr>
<h1><span id="password" style="font-family: monospace"></span></h1>
<hr>
<span class="input-group-btn">
  <button type="button" id="clip-btn" class="btn btn-success mytooltip hidden" data-clipboard-target="#password" data-placement="right">Copy password to clipboard</button>
</span>

<br/>
<br/>

<h4><b><span id="warning" class="hidden">WARNING: This is the ONLY time this password will be visible via this URL.</span></b></h4>

<br/>

<a href="/">Send another password</a> | <a href="/about">About</a> | <a href="https://github.com/tkooda/temporalpw">Source</a></br>

</div>

</center>
</body>
</html>
