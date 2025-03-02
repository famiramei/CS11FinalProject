.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    ; Subject Strings
    ge5 db "| GE 5        | Science, Technology, and Society                                              |  3  |  0     |   3   |  NONE             |", 10, 0
    cs25 db "| CS 25       | Data Structures and Algorithms                                                |  3  |  1     |   4   |  CS 15            |", 10, 0
    ge8 db "| GE 8        | Ethics                                                                     |  3  |  0     |   3   |  NONE             |", 10, 0
    ge6 db "| GE 6        | Art Appreciation                                                           |  3  |  0     |   3   |  NONE             |", 10, 0

    ; UI Elements
    newline db 10, 13, 0
    horLine db "+-------------+-------------------------------------------------------------------------------+-----+--------+-------+-------------------+", 10, 0
    header db "| Subject Code| Subject Title                                                                 | Lec |   Lab  | Total |       PreReq      |", 10, 0
    subjectPrompt db "Enter subject code (A-D, type DONE to finish): ", 0
    officiallyEnrolled db "Enrollment Successful!", 10, 0
    totalUnitsMsg db "Total Units Enrolled: ", 0
    invalidInputMsg db "Invalid input! Use letters A-D.", 10, 0
    limitedUnitsMsg db "Unit limit exceeded! Max 26 units.", 10, 0
    sDone db "DONE", 0

    ; Subject Pointer Arrays
    subjectPointers1 dd offset ge5, offset cs25, offset ge8, offset ge6

.data?
    inputCode db 10 dup(?)
    totalUnitsEnrolled dd ?

.code
main proc
    mov totalUnitsEnrolled, 0

mainLoop:
    invoke StdOut, addr subjectPrompt
    invoke StdIn, addr inputCode, sizeof inputCode

    ; Remove newline manually
    mov edi, offset inputCode
removeNewline:
    cmp byte ptr [edi], 0
    je checkDone
    cmp byte ptr [edi], 10
    je clearNewline
    inc edi
    jmp removeNewline
clearNewline:
    mov byte ptr [edi], 0

checkDone:
    ; Check if done
    invoke lstrcmp, addr inputCode, addr sDone
    je finishEnrollment

    ; Map input A-D to subjects
    mov al, inputCode[0]
    sub al, 'A'
    cmp al, 3
    ja invalidInput

    ; Display subject and add units
    movzx eax, al
    mov edi, [subjectPointers1 + eax * 4]
    invoke StdOut, edi

    ; Add units (dummy unit count, adjust as needed)
    add totalUnitsEnrolled, 3
    cmp totalUnitsEnrolled, 26
    jle mainLoop

    ; Unit limit exceeded
    invoke StdOut, addr limitedUnitsMsg
    jmp finishEnrollment

invalidInput:
    invoke StdOut, addr invalidInputMsg
    jmp mainLoop

finishEnrollment:
    invoke StdOut, addr officiallyEnrolled
    invoke StdOut, addr totalUnitsMsg
    invoke StdOut, addr newline
    invoke ExitProcess, 0
main endp
end main
