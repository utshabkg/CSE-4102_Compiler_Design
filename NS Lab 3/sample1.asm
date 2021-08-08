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
output_msg byte "Voltage = %d", 0 ; 0Ah -> new line 0 -> null char at end of str
output_msg1 byte "Current = ", 0 ; 0Ah -> new line 0 -> null char at end of str
output_msg2 byte "Resistance = ", 0 ; 0Ah -> new line 0 -> null char at end of str
output_msg3 byte "ZERO", 0Ah, 0 ; 0Ah -> new line 0 -> null char at end of str
input_format byte "%d", 0
I sdword ?; uninitialized declaration of signed double world - signed 32 bit
V sdword ?; uninitialized declaration of signed double world - signed 32 bit
R sdword ?; uninitialized declaration of signed double world - signed 32 bit
.code
main proc
    INVOKE printf, ADDR output_msg1
    INVOKE scanf, ADDR input_format, ADDR I
    INVOKE printf, ADDR output_msg2
    INVOKE scanf, ADDR input_format, ADDR R
    mov eax, I
    mov ebx, R
    imul ebx
    mov V, eax

    INVOKE printf, ADDR output_msg, V
    ret
    
main endp
end