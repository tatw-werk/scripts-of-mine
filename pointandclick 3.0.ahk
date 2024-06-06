
;Admincheck
if (A_IsAdmin=1)
    {
;set pos
^1::
{
    global title := WinGetID("A")
    OutputDebug(title)
    ;getting max window size 
    global winWidth, winHeight
        WinGetPos(,,&winWidth,&winHeight, "A")
        OutputDebug(winwidth)

    CoordMode("Mouse", "Window")
    global mouseX := 0
    global mouseY := 0
    MouseGetPos(&mouseX,&mouseY)
    OutputDebug(mouseX)
    OutputDebug(mouseY)
    ;check for if in window
    if (mouseX <= 0 or mouseY <= 0 or mouseX > winWidth or mouseY > winHeight)
    {   global mouseX := 0
        global mouseY := 0
        global title := " "
        global winWidth, winHeight := 0 
        MsgBox("position invalid"," ", "T1")
        }
        else
            {
                MsgBox("position set"," ", "T1")
                

            }

}
;trigger click
^2::
{
    CoordMode("Mouse", "Window")
    WinActivate(title)
    
        local mouseyback
        local mousexback
        MouseGetPos(&mousexback,&mouseyback)
    MouseMove(mouseX, mouseY,)
    Click
    MouseMove(mousexback,mouseyback)
    MsgBox("woosh"," ", "T0.5")
}

    }
    else
    {
        MsgBox "process does not have admin privileges to work with step 7 and other siemens processes this program needs admin privileges"
    }