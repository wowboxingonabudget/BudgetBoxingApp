# BudgetBoxingApp

Author: JJHEO  
Published: 1/20/2020  
  
Send suggestions or issues to wowboxingonabudget@gmail.com  
  
<dl>
<dt>Description: </dt>
<dd>This is a rudimentary multi-boxing app for World of Warcraft. It currently supports 
up to 4 windows, but can easily be modified to support more. It is able to find all 
windows named "World of Warcraft" and rename them "1WOW," "2WOW," etc. These renamed
windows are used to translate commands to the multiple windows that are up. If you use
different names, click 'Register Window Names' after you enter the names in the text 
boxes.</dd>
  
<dt>How to use:  </dt>
<dd><b>1</b>:	You can manually rename windows with a third party app like "Window Title Changer" or
you can use the button at the top of the app which will rename the windows automatically.
One consideration that needs to be made with the current version of this app is the 
controlling character should be used in window "1WOW" for now. </dd>
   
<dd><b>2</b>: Once the windows are renamed, log into the characters and join them all to a party.   </dd>
  
<dd><b>3</b>: Make sure the name of whoever the lead character is going to be is in the text box next 
to "Set Focus." This button will have each window type out "/tar 'name' and '/focus'  </dd>
  
<dd><b>4</b>: Once all the characters have the main character focused, the button broadcasting should
work. Select the checkboxes for the corresponding buttons you would like to broadcast. 
The checkbox for 'Enable Button Broadcasting' will turn broadcasting on and off. 'x' and
'space' have a shift modifier and will only broadcast when it is held down. </dd>

<dd><b>5</b>: Everything should be staged with the app at this point. The last thing that you need to 
  do is configure a couple of macros for the chars. The way the app works is when you press '1', the
app sends 'numpad1' to the slaves. Basically it's the same as you pressing '1' on the numpad for a hotkey.
The macro that you want to set up is as follows:  
  
/cast [@focustarget] Frostbolt  
or   
/cast [@player] Spellname  
  
With your macros configured like that, your slaves will target the focus target and cast the corresponding spell. 
You can use @player to cast spells on 'yourself' (The slave casting an AOE where they are standing) for spells like Blizzard.
</dd>
</dl>
