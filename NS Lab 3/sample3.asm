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
a sdword ?; uninitialized declaration of signed double world - signed 32 bit
count sdword ?
sum sdword ?
.code
main proc
    mov a, 10
    mov count, 0

    mov eax, a
    mov edx, count
    xor ecx, ecx

LOOP_:
    cmp eax, 5
    je INCREASE_COUNT
    cmp eax, 7
    jge INCREASE_A
    jmp DEC_A

INCREASE_COUNT:
    inc edx
    inc cx
    cmp cx, 10
    jl LOOP_
    jmp EXIT_

INCREASE_A:
    inc eax
    mov edx, eax
    inc cx
    cmp cx, 10
    jl LOOP_
    jmp EXIT_

DEC_A:
    dec eax
    mov edx, eax
    inc cx
    cmp cx, 10
    jl LOOP_
    jmp EXIT_

EXIT_:
    ret
main endp


end main