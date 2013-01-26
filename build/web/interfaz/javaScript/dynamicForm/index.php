<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>jQuery Dynamic Form Demo</title>
		<style type="text/css">
			form p > label{
				display: block;
				width: 150px;
				float: left;
				clear:left;
			}
			form p > span, fieldset > fieldset{
				display: block;
				float: left;
				clear:left;
			}
			form p > input{
				float: left;
			}
			form p > textarea{
				float: left;
			}
			span.inline{
				display:inline;
				clear:none;
			}
			
		</style>
		<script type="text/javascript" src="https://getfirebug.com/firebug-lite.js">
		{
			overrideConsole: false,
			startOpened: true,
			enableTrace: true
		}

		</script>
		<script type="text/javascript" src="lib/jquery/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="lib/jquery/jquery-ui-1.8.2.custom.min.js"></script>
		<script type="text/javascript" src="jquery-dynamic-form.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				//Activate the main dynamic form
				var mainDynamicForm = $("#people").dynamicForm("#plus", "#minus", {
					limit:5, 
					formPrefix:"mainForm",
					afterClone:function(clone){
						if(window.console && window.console.log){
							console.log("I'm a clone", clone);
						}
					},
					createColor:"green"
				});
			
				//Activate two nested dynamic form
				$("#phoneTemplate").dynamicForm("#plus5", "#minus5", {limit:5, formPrefix:"mainPhone"});
				$("#phone2Template").dynamicForm("#plus6", "#minus6", {limit:5,
					createColor:"red"});
				
				//Defines data to be injected in the form
				var data = [
					{
						"adr" : "A",
						"postal_code" : "B",
						"ville" : "C",
						"phoneTemplate" :[
							{"phone":"1", "phoneType":"pro"},
							{"phone":"2", "phoneType":"perso"},
							{"phone":"3", "phoneType":"perso"}
						],
						"phone2Template" :[
							{"phone2":"bar", "phonePro":true, more_info:"This is filled with more informations"},
							{"phone2":"foo"},
							{"phone2":"baz"}
						]
					},
					{
						"state" : "US",
						"adr" : "X",
						"postal_code" : "Y",
						"ville" : "Z",
						"phoneTemplate" :[
							{"phone":"4"},
							{"phone":"5"},
							{"phone":"6"}
						],
						"phone2Template" :[
							{"phone2":"bar1"},
							{"phone2":"foo2"},
							{"phone2":"baz3"}
						]
					},
					{
						"state" : "United States",
						"adr" : "O",
						"postal_code" : "P",
						"ville" : "Q",
						"phoneTemplate" :[
							{"phone":"7"},
							{"phone":"8"},
							{"phone":"9"}
						],
						"phone2Template" :[
							{"phone2":"bar4"},
							{"phone2":"foo5"},
							{"phone2":"baz6"}
						]
					}
				];
				
				//Inject the data in the main form for prefilling
				mainDynamicForm.inject(data);
			});
		</script>
	</head>
	<body>
		<h1>jQuery Dynamic Form</h1>
		<pre>
<?php
if(!empty($_POST)){
	var_dump($_POST);
}

function formatForm($form, $level){
	foreach ($form as $key => $value) {
		if($level == -1){
			echo "\nForm $key\n";
		}
		if(is_array($value)){
			if($level > -1){
				echo str_repeat("\t", $level);
				echo "$key\n";
			}
			formatForm($value, $level+1);
		}else{
			if($level > -1){
				echo str_repeat("\t", $level);
			}
			echo "$key : $value\n";
		}
	}
}
formatForm($_POST, -1);

?>
		</pre>
		<form method="post" action="#" value="Post">
			<fieldset>
				<legend> Nested fields duplication</legend>
				<p><label for="firstname">first name : </label><input id="firstname" type="text" name="firstname" size="40"></p>
				<p><label for="lastname">last name : </label><input id="lastname" type="text" name="lastname" size="40"></p>
				<fieldset id="people">
					
				<legend> Address</legend>
				<p><label for="state">state : </label>
				<select id="state" name="state" size="1">
				  <option value="France">France</option>
				  <option value="Italy">Italy</option>
				  <option value="Brazil">Brazil</option>
				  <option value="Morocco">Morocco</option>
				  <option value="China">China</option>
				  <option value="US">United States</option>
				</select></p>
				<p><label for="address">address : </label><input id="address" type="text" name="adr" size="30"></p>
				<p><label for="postal">postal code : </label><input id="postal" type="text" name="postal_code" size="10"></p>
				<p><label for="city">city : </label><input id="city" type="text" name="ville" size="50"></p>
				
				<p id='phoneTemplate'><label for="phone">telephone : </label><input id="phone" type="text" name="phone" size="50"><br />
				   <label for="pro">Professional</label><input id="pro" type="radio" value="pro" name="phoneType" /> 
				   <label for="perso">Personal</label><input id="perso" type="radio" value="perso" name="phoneType" />
				
				</p>
				<p><span><a id="minus5" href="">[-]</a> <a id="plus5" href="">[+]</a></span></p>
				
				<p id='phone2Template'><label for="phone2">telephone 2 : </label><input id="phone2" type="text" name="phone2" size="50"><br />
				   <label for="professionnal">Professional ?</label><input id="professionnal" type="checkbox" value="pro" name="phonePro" /> <br />
				   <label for="more_info">More info</label><textarea id="more_info" name="more_info"> </textarea>
				   <span style="clear:none; float:right;"><a id="minus6" href="">[-]</a> <a id="plus6" href="">[+]</a></span></p>
				<p></p>

				</fieldset>
				<p><span><a id="minus" href="">[-]</a> <a id="plus" href="">[+]</a></span></p>
			</fieldset>
			<input type="submit" />
		</form>
	</body>
</html>