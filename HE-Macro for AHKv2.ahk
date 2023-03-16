;	HE_Macro for AutoHotkey v2 (Last Changed: 2023/03/16)
;   ctrl(^), shift(+), win(#), alt(!)

showToolTip("HE-Macro for AHKv2", 500)

magicFnPressed := false


#HotIf
{
    *CapsLock::
    {
        global magicFnPressed
        magicFnPressed := true
        return
    }
    
    CapsLock Up::
    {
        global magicFnPressed
        magicFnPressed := false
        resetCompositeKey()
        return
    }
}
#HotIf (magicFnPressed)
{    
    *1::F1
	*2::F2
	*3::F3
	*4::F4
	*5::F5
	*6::F6
	*7::F7
	*8::F8
	*9::F9
	*0::F10
	*-::F11
	*=::F12
	#r::
    {
        Reload
		Sleep(1000)
		ToolTip("Reload failed")
		return
    }
	
    #4::ExitApp(0)
	
	*z::^z
	*x::^x
	*c::^c
	*v::^v
	*b::^b

	*i::up
	*k::down
	*j::left
	*l::right

	*a::left
	*d::right
	*u::home
	*o::end
	*;::enter
	*n::BackSpace
	*m::Delete

	*q::Send("{Ctrl Down}")
	*q Up::Send("{Ctrl Up}")
	*w::Send("{Shift Down}")
	*w Up::Send("{Shift Up}")
	*e::toggleCapslock()
	*r::Insert

	*h::Send("{vk15sc138}")
}
	

toggleCapslock() 
{
    if isCapslockEnabled()
        SetCapslockState(false)
    else
        SetCapslockState(true)
}

isCapslockEnabled() {
    isDown := GetKeyState("CapsLock", "T")
    if (isDown)
        return True
    else
        return False
}

resetCompositeKey() {
    send("{Ctrl Up}")
    send("{Shift Up}")
}

showToolTip(message, time) {
    ToolTip(message)
    SetTimer(RemoveToolTip, -time)
}

RemoveToolTip()
{
    ToolTip()
    return
}