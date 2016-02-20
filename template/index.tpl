<html>
<head>
 <title>Temporal.PW - Temporary secure storage for passwords</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>

<style type="text/css">
  body { background: #d3d3d3 !important; }
</style>

<script language="javascript">
function validateForm() {
  var x = document.forms["password"]["secret"].value;
  if ( x == null || x == "" ) {
    return false;
  }
}
</script>

<div class="container text-center">

<br/>
<br/>
<br/>
<br/>
<form role="form" name="password" action="/new" method="post" onsubmit="return validateForm()">
<div class="form-group">

<label for="inputlg"><h1>Enter a password to create a temporary URL for:</h1></label>
<div class="col-xs-4 col-xs-offset-4 text-center">
  <input type="text" name="secret" placeholder="Password" class="form-control input-lg text-center" >
</div>
<br/>
<br/>
<br/>
<br/>
<h4>
<div>
Only allow it to be viewed up to <select name="views">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3" selected>3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
</select> times over the next <select name="days">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3" selected>3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
  <option value="13">13</option>
  <option value="14">14</option>
  <option value="15">15</option>
  <option value="16">16</option>
  <option value="17">17</option>
  <option value="18">18</option>
  <option value="19">19</option>
  <option value="20">20</option>
  <option value="21">21</option>
  <option value="22">22</option>
  <option value="23">23</option>
  <option value="24">24</option>
  <option value="25">25</option>
  <option value="26">26</option>
  <option value="27">27</option>
  <option value="28">28</option>
  <option value="29">29</option>
  <option value="30">30</option>
</select> days.
</div>

<div class="checkbox">
 <label><input type="checkbox" name="myiponly">Only allow it to be viewed from my current IP address ({{ip}})</label>
</div>

<br/>
</h4>

<button type="submit" class="btn btn-primary btn-lg">Get temporary URL for this password</button>

</div>
</form>
<br/>
(Do not include any information that identifies what the password is for.)<br/>
<br/>
<a href="/about">About</a> | <a href="https://github.com/tkooda/temporalpw">Source</a></br>

</div>

</body>
</html>
