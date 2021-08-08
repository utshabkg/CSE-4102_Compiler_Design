.686
.model flat, c ; eip register
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr BYTE

.data
msg byte "Hello World", 0Ah, 0

.code
main proc
    INVOKE printf, ADDR msg
    ret
main endp
end