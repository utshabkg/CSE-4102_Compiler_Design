.686
.model flat, c ; eip register
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist: VARARG
scanf PROTO arg2:Ptr Byte, inputlist: VARARG
.data
output_msg1_format byte "%s", 0Ah, 0
output_msg2_format byte "%d", 0Ah, 0
output_msg byte "Enter the Count:", 0
output_msg1 byte "Enter the number", 0
output_msg2 byte "Sum:", 0
input_format byte "%d", 0
number sdword ?
sum sdword 0
count sdword 0

.code
main proc
    INVOKE printf, ADDR output_msg1_format, ADDR output_msg
    INVOKE scanf, ADDR input_format, ADDR count

    mov eax, sum
    mov edx, count

LOOP_:
    cmp edx, 0
    je EXIT_

    ;Always push registers into stack before calling functions as they can overwrite registers
    push edx 
    push eax

    INVOKE printf, ADDR output_msg1_format, ADDR output_msg1
    INVOKE scanf, ADDR input_format, ADDR number

    pop eax
    pop edx

    mov ebx, number
    add eax, ebx
    dec edx

    jmp LOOP_
    
EXIT_:
    mov sum, eax
    ;No need to push because we are not using any registers after calling them
    INVOKE printf, ADDR output_msg1_format, ADDR output_msg2
    INVOKE printf, ADDR output_msg2_format, sum
    ret
main endp
end