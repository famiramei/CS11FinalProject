.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc 
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc 

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

include all_data.asm
include enroll_proc.asm

.code
main:
    invoke ClearScreen
    invoke StdOut, addr UM
    invoke StdOut, addr UM1
    invoke StdOut, addr FName
    invoke StdIn, addr fullname, 100
    invoke ClearScreen
    invoke StdOut, addr prospectus
    invoke StdOut, addr newline
    invoke StdOut, addr newline

    ; DISPLAYS PROSPECTUS

    full_prospectus:
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr F_Subj1
        invoke StdOut, addr F_Subj2
        invoke StdOut, addr F_Subj3
        invoke StdOut, addr F_Subj4
        invoke StdOut, addr F_Subj5
        invoke StdOut, addr F_Subj6
        invoke StdOut, addr F_Subj7
        invoke StdOut, addr F_Subj8
        invoke StdOut, addr total
        invoke StdOut, addr Border

        ;1st year, 2nd sem
        invoke StdOut, addr S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr S_Subj1
        invoke StdOut, addr S_Subj2
        invoke StdOut, addr S_Subj3
        invoke StdOut, addr S_Subj4
        invoke StdOut, addr S_Subj5
        invoke StdOut, addr S_Subj6
        invoke StdOut, addr S_Subj7
        invoke StdOut, addr S_Subj8
        invoke StdOut, addr total
        invoke StdOut, addr Border

        ;1st year, Summer
        invoke StdOut, addr Sum_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr Sum_Subj1
        invoke StdOut, addr Sum_Subj2
        invoke StdOut, addr Sum_Subj3
        invoke StdOut, addr total_sum
        invoke StdOut, addr Border

        ;2nd year, 1st sem
        invoke StdOut, addr SY2_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_F_Subj1
        invoke StdOut, addr SY2_F_Subj2
        invoke StdOut, addr SY2_F_Subj3
        invoke StdOut, addr SY2_F_Subj4
        invoke StdOut, addr SY2_F_Subj5
        invoke StdOut, addr SY2_F_Subj6
        invoke StdOut, addr SY2_F_Subj7
        invoke StdOut, addr SY2_F_Subj8
        invoke StdOut, addr SY2_F_Subj9
        invoke StdOut, addr total
        invoke StdOut, addr Border

        ;2nd year, 2nd sem
        invoke StdOut, addr SY2_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_S_Subj1
        invoke StdOut, addr SY2_S_Subj2
        invoke StdOut, addr SY2_S_Subj3
        invoke StdOut, addr SY2_S_Subj4
        invoke StdOut, addr SY2_S_Subj5
        invoke StdOut, addr SY2_S_Subj6
        invoke StdOut, addr SY2_S_Subj7
        invoke StdOut, addr SY2_S_Subj8
        invoke StdOut, addr total
        invoke StdOut, addr Border

        ;2nd year, Summer
        invoke StdOut, addr SY2_Sum_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_Sum_Subj1
        invoke StdOut, addr SY2_Sum_Subj2
        invoke StdOut, addr SY2_Sum_Subj3
        invoke StdOut, addr total_sum
        invoke StdOut, addr Border

        ;3rd year, 1st sem
        invoke StdOut, addr SY3_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr SY3_F_Subj1
        invoke StdOut, addr SY3_F_Subj2
        invoke StdOut, addr SY3_F_Subj3
        invoke StdOut, addr SY3_F_Subj4
        invoke StdOut, addr SY3_F_Subj5
        invoke StdOut, addr SY3_F_Subj6
        invoke StdOut, addr SY3_F_Subj7
        invoke StdOut, addr SY3_F_Subj8
        invoke StdOut, addr SY3_F_Subj9
        invoke StdOut, addr SY3_total_1
        invoke StdOut, addr Border

        ;3rd year, 2nd sem
         invoke StdOut, addr SY3_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY3_S_Subj1
        invoke StdOut, addr SY3_S_Subj2
        invoke StdOut, addr SY3_S_Subj3
        invoke StdOut, addr SY3_S_Subj4
        invoke StdOut, addr SY3_S_Subj5
        invoke StdOut, addr SY3_S_Subj6
        invoke StdOut, addr SY3_S_Subj7
        invoke StdOut, addr SY3_S_Subj8
        invoke StdOut, addr SY3_total_2
        invoke StdOut, addr Border

        ;4th year, 1st sem
        invoke StdOut, addr SY4_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_F_Subj1
        invoke StdOut, addr SY4_F_Subj2
        invoke StdOut, addr SY4_F_Subj3
        invoke StdOut, addr SY4_F_Subj4
        invoke StdOut, addr SY4_total_1
        invoke StdOut, addr Border        

        ;4th year, 2nd sem
        invoke StdOut, addr SY4_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_S_Subj1
        invoke StdOut, addr SY4_S_Subj2
        invoke StdOut, addr SY4_total_2
        invoke StdOut, addr Border

        ; DISPLAYS OPTIONS FOR SELECTING YEAR AND SEMESTER
    ask2:
    invoke StdOut, addr selection
    invoke StdOut, addr YearLevel
    invoke StdIn, addr yearlevel, 10
    ask:
    .if yearlevel == '1'
    invoke StdOut, addr semSelect
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 10
    
    .if semester == '1'
        first1:
        invoke ClearScreen
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Fyear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr F_Subj1
        invoke StdOut, addr F_Subj2
        invoke StdOut, addr F_Subj3
        invoke StdOut, addr F_Subj4
        invoke StdOut, addr F_Subj5
        invoke StdOut, addr F_Subj6
        invoke StdOut, addr F_Subj7
        invoke StdOut, addr F_Subj8
        invoke StdOut, addr Border
        call enroll11
        
    .elseif semester == '2'
        first2:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Fyear
        invoke StdOut, addr Border
        invoke StdOut, addr S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr S_Subj1
        invoke StdOut, addr S_Subj2
        invoke StdOut, addr S_Subj3
        invoke StdOut, addr S_Subj4
        invoke StdOut, addr S_Subj5
        invoke StdOut, addr S_Subj6
        invoke StdOut, addr S_Subj7
        invoke StdOut, addr S_Subj8
        invoke StdOut, addr Border
        call enroll12
    .elseif semester == '3'
        firstsum:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Fyear
        invoke StdOut, addr Border
        invoke StdOut, addr Sum_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr Sum_Subj1
        invoke StdOut, addr Sum_Subj2
        invoke StdOut, addr Sum_Subj3
        invoke StdOut, addr Border
        call enroll13
    .else
        invoke StdOut, addr InvalidMsg
        jmp ask
    .endif

    .elseif yearlevel == '2'
    invoke StdOut, addr semSelect
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 10
    
    .if semester == '1'
        second1:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Syear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_F_Subj1
        invoke StdOut, addr SY2_F_Subj2
        invoke StdOut, addr SY2_F_Subj3
        invoke StdOut, addr SY2_F_Subj4
        invoke StdOut, addr SY2_F_Subj5
        invoke StdOut, addr SY2_F_Subj6
        invoke StdOut, addr SY2_F_Subj7
        invoke StdOut, addr SY2_F_Subj8
        invoke StdOut, addr SY2_F_Subj9
        invoke StdOut, addr Border
        call enroll21
    .elseif semester == '2'
        second2:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Syear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_S_Subj1
        invoke StdOut, addr SY2_S_Subj2
        invoke StdOut, addr SY2_S_Subj3
        invoke StdOut, addr SY2_S_Subj4
        invoke StdOut, addr SY2_S_Subj5
        invoke StdOut, addr SY2_S_Subj6
        invoke StdOut, addr SY2_S_Subj7
        invoke StdOut, addr SY2_S_Subj8
        invoke StdOut, addr Border
        call enroll22
    .elseif semester == '3'
        secondsum:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Syear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_Sum_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_Sum_Subj1
        invoke StdOut, addr SY2_Sum_Subj2
        invoke StdOut, addr SY2_Sum_Subj3
        invoke StdOut, addr Border
        call enroll23
    .else
        invoke StdOut, addr InvalidMsg
        jmp ask
    .endif
    .elseif yearlevel == '3'
    invoke StdOut, addr semSelect
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 10

    .if semester == '1'
        third1:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Tyear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr SY3_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY3_F_Subj1
        invoke StdOut, addr SY3_F_Subj2
        invoke StdOut, addr SY3_F_Subj3
        invoke StdOut, addr SY3_F_Subj4
        invoke StdOut, addr SY3_F_Subj5
        invoke StdOut, addr SY3_F_Subj6
        invoke StdOut, addr SY3_F_Subj7
        invoke StdOut, addr SY3_F_Subj8
        invoke StdOut, addr SY3_F_Subj9
        invoke StdOut, addr Border
        call enroll31
    .elseif semester == '2'
        third2:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Tyear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr SY3_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY3_S_Subj1
        invoke StdOut, addr SY3_S_Subj2
        invoke StdOut, addr SY3_S_Subj3
        invoke StdOut, addr SY3_S_Subj4
        invoke StdOut, addr SY3_S_Subj5
        invoke StdOut, addr SY3_S_Subj6
        invoke StdOut, addr SY3_S_Subj7
        invoke StdOut, addr SY3_S_Subj8
        invoke StdOut, addr Border
        call enroll32
    .elseif semester == '3'
        thirdsum:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Tyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY3_Sum_Sem
        invoke StdOut, addr SY3_Sum_note
        invoke StdOut, addr return
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        .if options == "1"
        jmp full_prospectus
        .else
        jmp thirdsum
        .endif

    .else
        invoke StdOut, addr InvalidMsg
        jmp ask
    .endif

    .elseif yearlevel == '4'
    invoke StdOut, addr semSelect
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 10

    .if semester == '1'
        fourth1:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr fyear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_F_Subj1
        invoke StdOut, addr SY4_F_Subj2
        invoke StdOut, addr SY4_F_Subj3
        invoke StdOut, addr SY4_F_Subj4
        invoke StdOut, addr Border
        call enroll41
    .elseif semester == '2'
        fourth2:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr fyear
        invoke StdOut, addr Program
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_S_Subj1
        invoke StdOut, addr SY4_S_Subj2
        invoke StdOut, addr Border
        call enroll42
    .elseif semester == '3'
        fourthsum:
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr fyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY4_Sum_Sem
        invoke StdOut, addr SY4_Sum_note
        invoke StdOut, addr return
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        .if options == "1"
        jmp full_prospectus
        .else
        jmp fourthsum
        .endif
    .else
        invoke StdOut, addr InvalidMsg
        jmp ask
    .endif
    .else
        invoke StdOut, addr InvalidMsg
        jmp ask2
    .endif
    invoke ExitProcess, 0
    
end main
