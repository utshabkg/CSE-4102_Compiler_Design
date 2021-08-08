.686
.model flat, c ; eip register
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist: VARARG
scanf PROTO arg2:Ptr Byte, inputlist: VARARG
.data
output_msg_format byte "%d", 0Ah, 0

input_format byte "%d", 0
number sdword ?

.code
main proc
    INVOKE scanf, ADDR input_format, ADDR number
    INVOKE printf, ADDR output_msg_format, number
    ret
main endp
end