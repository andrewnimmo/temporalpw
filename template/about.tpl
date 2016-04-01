<html>
<head>
 <title>Temporal.PW - Temporary secure storage for passwords</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>

<style type="text/css">
  body { background: #d3d3d3 !important; }
</style>

<div class="container">

<h1>About <a href="/">Temporal.PW</a>:</h1><br/>
<h3>
<a href="/">Temporal.PW</a> can convert a password into a unique temporary secure URL that is safe to send via E-Mail.<br/>
<br/>
I made this because I needed a simple way to send passwords to people with whom I didn't already have end-to-end encryption established.<br/>
</h3>
<br/>

<h3>How to use it:</h3><br/>
<h4>
<ol>
  <li>Enter a good, long, random password into <a href="/">temporal.pw</a>, or click "Generate a random password".</li><br/>
  <li>E-Mail the temporary URL to someone:</li><br/>
  <ul>
    <li>If they're able to view the password: you know that nobody else was able to view it, and you know that that URL can't be used again later to determine the password.</li><br/>
    <li>If they see a "This password doesn't exist" error: that password was likely viewed by someone else, the recipient needs to tell you to generate a new password and send them a new temporal.pw URL.</li><br/>
    <li>If they see an "Invalid password URL" error: the URL they're attempting to view isn't the exact URL that you generated for them.</li><br/>
  </ul>
</ol>
</h4>

<br/>
<br/>

<h3>How it works:</h3><br/>
<h4>
<ul>
  <li>The browser generates a random 128 bit AES encryption/decryption key, encrypts the password with it, sends (only) the encrypted version of the password to the server, and then the browser builds a unique temporary secure URL that contains the ID of the encrypted password plus the decryption key.</li><br/>
  <li>The password encryption/decryption key only exists in the 'fragment' part of the URL (after the '#' hash symbol) and is never sent to the server.</li><br/>
  <li>The encrypted password is only sent to the server so that the unique temporary secure URL can be rendered useless after it has been viewed once or it has expired.</li><br/>
  <li>The encrypted password cannot be decrypted without the decryption key thats in the unique temporary secure URL.</li><br/>
<br/>
  <li>All key generation, encryption, and decryption is 100% done in the browser using common public cryptographic libraries (<a href="https://github.com/jprichardson/secure-random">secure-random</a> and <a href="https://github.com/ricmoo/aes-js">AES-JS</a>).</li><br/>
  <li>The encrypted password is deleted from the server after it expires, or immediately after being viewed a single time by someone who has the unique temporary secure URL.</li><br/>
  <li>Each password is only viewable a single time so that the intended recipient will NOT be able to view the password if someone else has intercepted and viewed it first.</li><br/>
  <li>Optionally, you can choose to tell the server to only allow a password to be viewed from your same IP address (useful for sending passwords to someone in the same office / network).</li><br/>
</ul>
</h4>

<br/>
<br/>

<h3>Other Information:</h3><br/>
<h4>
<ul>
  <li>Easy to audit: only ~150 lines of python for the backend, and ~200 lines of JavaScript for the fronend.</li><br/>
  <li><a href="http://github.com/tkooda/temporalpw">100% open source</a>.</li><br/>
  <li>Uses <a href="http://bottlepy.org/">Bottle</a> framework for the backend; <a href="https://jquery.com/">jQuery</a>, <a href="http://getbootstrap.com/">bootstrap</a>, and <a href="https://clipboardjs.com/">clipboard.js</a> for the frontend; and <a href="https://github.com/ricmoo/aes-js">AES-JS</a>, <a href="https://github.com/45678/Base58">Base58</a>, <a href="https://github.com/jprichardson/secure-random">secure-random</a>, and <a href="https://github.com/h2non/jshashes">jshashes</a> for the in-browser cryptography.</li><br/>
  <li>If you're paranoid, and don't trust that I won't change the JavaScript to send your password or encryption key somewhere (and you don't want to just view the source of the page) : you can use this copy of the JavaScript hosted on github.io: <a href="https://tkooda.github.io/temporalpw/">https://tkooda.github.io/temporalpw/</a> instead, where (you can track any changes to the Javascript you're running at <a href="https://github.com/tkooda/temporalpw/commits/gh-pages">https://github.com/tkooda/temporalpw/commits/gh-pages</a>).</li><br/>
  <li>If you'd like to say "thanks" for this service: you can send me a few pennies via Bitcoin to: <a href="bitcoin:1MLaaKmMbioyCKZShbyKGJztUP8M7BHRYp">1MLaaKmMbioyCKZShbyKGJztUP8M7BHRYp</a></li><br/>
</ul>
</h4>

<br/>

<center>
<a href="/">Send another password</a> | <a href="https://github.com/tkooda/temporalpw">Source</a></br>
</center>

<br/>
<br/>

</div>

</body>
</html>
