.686 ; pentium or below processors
.model flat, c ; address space size flat -> for protected mode
; c for using C programming language
include C:\masm32\include\msvcrt.inc ; header file
includelib C:\masm32\lib\msvcrt.lib ; integrating C library

.stack 100h
printf PROTO arg1:Ptr Byte, printlist: VARARG ; byte size pointer for prototype of printf
scanf PROTO arg2:Ptr Byte, inputlist: VARARG
; arg 1tar pore multiple parameters thakte pare
.data
output_msg_fmt byte "%d", 0Ah, 0 ; 0Ah -> new line 0 -> null char at end of str
output_msg byte "Enter a number", 0Ah, 0 ; 0Ah -> new line 0 -> null char at end of str
output_msg1 byte "POSITIVE", 0Ah, 0 ; 0Ah -> new line 0 -> null char at end of str
output_msg2 byte "NEGATIVE", 0Ah, 0 ; 0Ah -> new line 0 -> null char at end of str
output_msg3 byte "ZERO", 0Ah, 0 ; 0Ah -> new line 0 -> null char at end of str
input_format byte "%d", 0
number1 sdword ?; uninitialized declaration of signed double world - signed 32 bit
number2 sdword ?
sum sdword ?
.code
main proc
    INVOKE printf, ADDR output_msg
    INVOKE scanf, ADDR input_format, ADDR number1
    INVOKE printf, ADDR output_msg
    INVOKE scanf, ADDR input_format, ADDR number2
    push number2
    push number1
    call AddTwo
    pop number1
    pop number2

    ret
main endp

AddTwo proc
    push ebp
    mov ebp, esp
    mov eax, [ebp+12]
    add eax, [ebp+8]
    mov sum, eax
    INVOKE printf, ADDR output_msg_fmt, sum
    pop ebp
    ret
AddTwo endp
end main