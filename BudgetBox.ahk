/*
Author: JJHEO
Published: 1/20/2020

Send suggestions or issues to wowboxingonabudget@gmail.com

Description:
This is a rudimentary multi-boxing app for World of Warcraft. It currently supports 
up to 4 windows, but can easily be modified to support more. It is able to find all 
windows named "World of Warcraft" and rename them "1WOW," "2WOW," etc. These renamed
windows are used to translate commands to the multiple windows that are up. If you use
different names, click 'Register Window Names' after you enter the names in the text 
boxes.

How to use:
1:	You can manually rename windows with a third party app like "Window Title Changer" or
you can use the button at the top of the app which will rename the windows automatically.
One consideration that needs to be made with the current version of this app is the 
controlling character should be used in window "1WOW" for now. 

2: Once the windows are renamed, log into the characters and join them all to a party. 

3: Make sure the name of whoever the lead character is going to be is in the text box next 
to "Set Focus." This button will have each window type out "/tar 'name' and '/focus'

4: Once all the characters have the main character focused, the button broadcasting should
work. Select the checkboxes for the corresponding buttons you would like to broadcast. 
The checkbox for 'Enable Button Broadcasting' will turn broadcasting on and off. 'x' and
'space' have a shift modifier and will only broadcast when it is held down. 
*/

#SingleInstance, Force	

;Gui Layout
;---------
;-------------
Gui, Font, cWhite
Gui, Add, Button, xm+90 y+10 w100 h30 gRename_Windows, Rename Windows
Gui, Add, Text, xm yp+40 w250 Center,Windows to be used for multiboxing:
;Gui, Add, Button, xm+150 yp w100 h30 gSubmit_All, Register Window Names
Gui, Add, Checkbox, xm+20 yp+20 cWhite vWindow_One_CheckBox gSubmit_All, Window One
Gui, Add, Edit, xp+100 r1 cBlack vWindow_One_Name w135 gSubmit_All, 1WOW
Gui, Add, Checkbox, xm+20 cWhite vWindow_Two_CheckBox gSubmit_All, Window Two
Gui, Add, Edit, xp+100 r1 cBlack vWindow_Two_Name w135 gSubmit_All, 2WOW
Gui, Add, Checkbox, xm+20 cWhite vWindow_Three_CheckBox gSubmit_All, Window Three
Gui, Add, Edit, xp+100 r1 cBlack vWindow_Three_Name w135 gSubmit_All, 3WOW
Gui, Add, Checkbox, xm+20 cWhite vWindow_Four_CheckBox gSubmit_All, Window Four
Gui, Add, Edit, xp+100 r1 cBlack vWindow_Four_Name w135 gSubmit_All, 4WOW

;Follow button
Gui, Add, Button, xm+40 yp+50 h20 gSend_Focus_Command, Set Focus
Gui, Add, Edit, xp+70 yp cBlack vFollow_Char_Name w135 gSubmit_All, Lead Char Name

;Numbers
Gui,Add, Checkbox, x75 yp+40 cWhite vEnable_Broadcasting gSubmit_All, Enable Button Broadcasting
Gui,Add, Checkbox, x80 y270 cWhite vEnable_1_Broadcast gSubmit_All, 1
Gui,Add, Checkbox, cWhite vEnable_2_Broadcast gSubmit_All, 2
Gui,Add, Checkbox, cWhite vEnable_3_Broadcast gSubmit_All, 3
Gui,Add, Checkbox, cWhite vEnable_4_Broadcast gSubmit_All, 4
Gui,Add, Checkbox, cWhite vEnable_5_Broadcast gSubmit_All, 5
Gui,Add, Checkbox, cWhite vEnable_6_Broadcast gSubmit_All, 6
Gui,Add, Checkbox, cWhite vEnable_7_Broadcast gSubmit_All, 7
Gui,Add, Checkbox, cWhite vEnable_8_Broadcast gSubmit_All, 8
Gui,Add, Checkbox, cWhite vEnable_9_Broadcast gSubmit_All, 9
Gui,Add, Checkbox, cWhite vEnable_0_Broadcast gSubmit_All, 0
Gui,Add, Checkbox, cWhite vEnable_backtick_Broadcast gSubmit_All, ``
Gui,Add, Checkbox, cWhite vEnable_follow_Broadcast gSubmit_All, Follow (Alt+f will send f12)

;F Keys
Gui,Add, Checkbox, x160 y270 cWhite vEnable_f1_Broadcast, f1
Gui,Add, Checkbox, cWhite vEnable_f2_Broadcast gSubmit_All, f2
Gui,Add, Checkbox, cWhite vEnable_f3_Broadcast gSubmit_All, f3
Gui,Add, Checkbox, cWhite vEnable_f4_Broadcast gSubmit_All, f4
Gui,Add, Checkbox, cWhite vEnable_f5_Broadcast gSubmit_All, f5
Gui,Add, Checkbox, cWhite vEnable_e_Broadcast gSubmit_All, E
Gui,Add, Checkbox, cWhite vEnable_f_Broadcast gSubmit_All, F
Gui,Add, Checkbox, cWhite vEnable_q_Broadcast gSubmit_All, Q
Gui,Add, Checkbox, cWhite vEnable_x_Broadcast gSubmit_All, X
Gui,Add, Checkbox, cWhite vEnable_space_Broadcast gSubmit_All, Space

Gui, +AlwaysOnTop
Gui, Color, Black
Gui, Show, w300 h500, WOW Boxing on a Budget
return


;Labels
;---------
;-------------
Rename_Windows:
;	Gui, Submit, NoHide
;	if(Window_One_CheckBox == 1)
;		MsgBox, Using %Window_One_Name%
;	if(Window_Two_CheckBox == 1)
;		MsgBox, Using %Window_Two_Name%
;	if(Window_Three_CheckBox == 1)
;		MsgBox, Using %Window_Three_Name%
;	if(Window_Four_CheckBox == 1)
;		MsgBox, Using %Window_Four_Name%
;
i := 1
while(WinExist("World of Warcraft")) {
	WinSetTitle, World of Warcraft, , %i%WOW
	i += 1
}
return

Submit_All:
	Gui, Submit, NoHide
	return

Send_Focus_Command:
	SetKeyDelay, 50
	windows := Array(Window_Two_Name,Window_Three_Name,Window_Four_Name)
	for k,v in windows
		ControlSend, , /tar %Follow_Char_Name% {Enter}/focus{enter}, %v%	
	return

GuiClose:
	ExitApp
	return


;Hotkeys
;---------
;-------------
$1::
if(Enable_Broadcasting==1 and Enable_1_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 1, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {Numpad1}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {Numpad1}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {Numpad1}, %Window_Four_Name%
} 
else
	Send, 1
return


$2::
if(Enable_Broadcasting==1 and Enable_2_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 2, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {Numpad2}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {Numpad2}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {Numpad2}, %Window_Four_Name%
} 
else
	Send, 2
return


$3::
if(Enable_Broadcasting==1 and Enable_3_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 3, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {Numpad3}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {Numpad3}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {Numpad3}, %Window_Four_Name%
} 
else
	Send, 3
return


$4::
if(Enable_Broadcasting==1 and Enable_4_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 4, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {Numpad4}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {Numpad4}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {Numpad4}, %Window_Four_Name%
} 
else
	Send, 4
return


$5::
if(Enable_Broadcasting==1 and Enable_5_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 5, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {Numpad5}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {Numpad5}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {Numpad5}, %Window_Four_Name%
} 
else
	Send, 5
return


$6::
if(Enable_Broadcasting==1 and Enable_6_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 6, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {Numpad6}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {Numpad6}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {Numpad6}, %Window_Four_Name%
} 
else
	Send, 6
return


$7::
if(Enable_Broadcasting==1 and Enable_7_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 7, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , Numpad7, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , Numpad7, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , Numpad7, %Window_Four_Name%
} 
else
	Send, 7
return


$8::
if(Enable_Broadcasting==1 and Enable_8_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 8, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , Numpad8, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , Numpad8, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , Numpad8, %Window_Four_Name%
} 
else
	Send, 8
return


$9::
if(Enable_Broadcasting==1 and Enable_9_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 9, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , Numpad9, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , Numpad9, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , Numpad9, %Window_Four_Name%
} 
else
	Send, 9
return


$0::
if(Enable_Broadcasting==1 and Enable_0_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , 0, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , Numpad0, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , Numpad0, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , Numpad0, %Window_Four_Name%
} 
else
	Send, 0
return


$f1::
if(Enable_Broadcasting==1 and Enable_f1_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , {f1}, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {f1}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {f1}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {f1}, %Window_Four_Name%
} 
else
	Send, {f1}
return


$f2::
if(Enable_Broadcasting==1 and Enable_f2_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , {f2}, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {f2}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {f2}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {f2}, %Window_Four_Name%
} 
else
	Send, {f2}
return


$f3::
if(Enable_Broadcasting==1 and Enable_f3_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , {f3}, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {f3}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {f3}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {f3}, %Window_Four_Name%
} 
else
	Send, {f3}
return


$f4::
if(Enable_Broadcasting==1 and Enable_f4_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , {f4}, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {f4}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {f4}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {f4}, %Window_Four_Name%
} 
else
	Send, {f4}
return




$f5::
if(Enable_Broadcasting==1 and Enable_f5_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , {f5}, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {f5}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {f5}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {f5}, %Window_Four_Name%
} 
else
	Send, {f5}
return


!f::
if(Enable_Broadcasting==1 and Enable_follow_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , {f12}, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {f12}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {f12}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {f12}, %Window_Four_Name%
} 
else
	Send, {f9}
return

$q::
if(Enable_Broadcasting==1 and Enable_q_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , q, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , q, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , q, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , q, %Window_Four_Name%
}
else
	Send, q
return


$e::
if(Enable_Broadcasting==1 and Enable_e_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , e, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , e, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , e, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , e, %Window_Four_Name%
}
else
	Send, e
return


$f::
if(Enable_Broadcasting==1 and Enable_f_Broadcast == 1) {
	if(Window_One_CheckBox==1)
		ControlSend, , f, %Window_One_Name%
	if(Window_Two_CheckBox==1)
		ControlSend, , {Numpad0}, %Window_Two_Name%
	if(Window_Three_CheckBox==1)
		ControlSend, , {Numpad0}, %Window_Three_Name%
	if(Window_Four_CheckBox==1)
		ControlSend, , {Numpad0}, %Window_Four_Name%
}
else
	Send, f
return


+$x::
if(Enable_Broadcasting==1 and Enable_x_Broadcast == 1) {
	if(Window_Two_CheckBox==1) {
		ControlSend, , {x down}, %Window_Two_Name%
		Sleep, 500
		ControlSend, , {x up}, %Window_Two_Name%
	}
	if(Window_Three_CheckBox==1) {
		ControlSend, , {x down}, %Window_Three_Name%
		Sleep, 500
		ControlSend, , {x up}, %Window_Three_Name%
	}
	if(Window_Four_CheckBox==1) {
		ControlSend, , {x down}, %Window_Four_Name%
		Sleep, 500
		ControlSend, , {x up}, %Window_Four_Name%
	}
else
	Send, x
return
}

+$space::
if(Enable_Broadcasting==1 and Enable_space_Broadcast == 1) {
	if(Window_Two_CheckBox==1) {
		ControlSend, , {space down}, %Window_Two_Name%
		Sleep, 600
		ControlSend, , {space up}, %Window_Two_Name%
		ControlSend, , {f12}, %Window_Two_Name%
	}
	if(Window_Three_CheckBox==1) {
		ControlSend, , {space down}, %Window_Three_Name%
		Sleep, 600
		ControlSend, , {space up}, %Window_Three_Name%
		ControlSend, , {f12}, %Window_Thr_Name%
	}
	if(Window_Four_CheckBox==1) {
		ControlSend, , {space down}, %Window_Four_Name%
		Sleep, 600
		ControlSend, , {space up}, %Window_Four_Name%
		ControlSend, , {f12}, %Window_Four_Name%
	}
else
	Send, {space}
return
}



/**
	This section will activate your different windows with alt + a number key (1-4 for now)
*/
!1::
WinActivate, %Window_One_Name%
Return

!2::
WinActivate, %Window_Two_Name%
Return

!3::
WinActivate, %Window_Three_Name%
Return

!4::
WinActivate, %Window_Four_Name%
Return

