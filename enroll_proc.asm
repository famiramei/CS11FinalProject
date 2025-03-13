.CODE
enroll11 PROC
        ; Options
        invoke StdOut, addr selection1
        invoke StdOut, addr selection2

Loops:
        ; Enrollment Loop
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    ; CHECKS ALL DUPLICATE INPUTS
    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    ; APPENDS THE INPUTTED LETTER TO THE FINAL VARIABLE FOR ENROLLMENT
    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

        ; PARSES STRING TO INT AS REFERENCE FOR THE FETCHING OF SUBJECT DATA

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit   
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'H'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS11
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

        ; ERROR HANDLING
    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

        ; CHECKS IF THE UNITS EXCEEDED 26

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

        ; DISPLAY SUBJECTS

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects1
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

        ; DISPLAY TOTAL UNITS ENROLLED
    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je first1
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

        ; DISPLAY THE FINAL ENROLLED SUBJECTS

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year11
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects1
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

        ; PRINTING OF ERRORS

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll11 ENDP

enroll12 PROC
        invoke StdOut, addr Sselection1
        invoke StdOut, addr Sselection2

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'H'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS12
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects2
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je first2
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year12
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects2
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll12 ENDP

enroll13 PROC
        invoke StdOut, addr Sumselection1

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'C'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subSS1
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects3
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je firstsum
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year13
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects3
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll13 ENDP

enroll21 PROC
        invoke StdOut, addr S_selection1
        invoke StdOut, addr S_selection2
        invoke StdOut, addr S_selection3
        invoke StdOut, addr S_selection4

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'L'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS21
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects4
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je second1
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year21
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects4
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll21 ENDP

enroll22 PROC
        invoke StdOut, addr S2_selection1
        invoke StdOut, addr S2_selection2
        invoke StdOut, addr S2_selection3

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'I'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS22
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects5
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je second2
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year22
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects5
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll22 ENDP

enroll23 PROC
        invoke StdOut, addr S_Sumselection1

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'C'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subSS2
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects6
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je secondsum
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year23
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects6
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
       invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll23 ENDP

enroll31 PROC
        invoke StdOut, addr T_selection1
        invoke StdOut, addr T_selection2
        invoke StdOut, addr T_selection3

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'I'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS31
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects7
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je third1
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year31
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects7
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll31 ENDP

enroll32 PROC
        invoke StdOut, addr T2_selection1
        invoke StdOut, addr T2_selection2

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'H'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS32
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects8
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je third2
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year32
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects8
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll32 ENDP

enroll41 PROC
        invoke StdOut, addr F_selection1

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'D'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS41
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects9
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je fourth1
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year41
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects9
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll41 ENDP

enroll42 PROC
        invoke StdOut, addr F2_selection1

Loops:
        invoke StdOut, addr inputSubject
        invoke StdIn, addr tempoSub, sizeof tempoSub
        mov al, [tempoSub]   
        cmp al, 0
        je invalidInputError

        mov esi, OFFSET selSubject
        mov edi, OFFSET tempoSub

    checkDuplicate:
        mov al, [esi]   
        cmp al, 0       
        je appendSubject
        cmp al, ' '     
        je nextCheck    
        cmp al, [edi]   
        jne nextCheck   
        mov al, [esi+1] 
        cmp al, 0       
        je duplicateError
        cmp al, ' '     
        je duplicateError

    nextCheck:
        inc esi
        jmp checkDuplicate

    appendSubject:
        invoke lstrcat, addr selSubject, addr tempoSub
        mov edi, OFFSET selSubject
        add edi, sizeof selSubject - 1
        mov byte ptr [edi], 0 

        mov totalUnitsEnrolled, 0 
        mov esi, offset selSubject 
        xor ebx, ebx             

    parseInput:
        mov al, [esi]
        cmp al, 0
        je checkUnitLimit  
        inc esi  
        cmp al, ' '
        je parseInput
        and al, 0DFh  
        cmp al, 'A'
        jl invalidInput
        cmp al, 'B'
        jg invalidInput
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET subS42
        mov ecx, [edi + eax * 4] 
        add totalUnitsEnrolled, ecx 
        cmp totalUnitsEnrolled, 26
        jg unitLimitExceeded
        jmp parseInput

    invalidInput:
        mov ebx, 1
        jmp checkUnitLimit

    unitLimitExceeded:
        mov ebx, 2 
        jmp checkUnitLimit

    checkUnitLimit:
        cmp ebx, 1
        je displayError
        cmp ebx, 2
        je displayError

        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    displaySubjects:
        mov al, [esi]
        cmp al, 0
        je displayTotalUnits  
        inc esi 
        cmp al, ' '
        je displaySubjects
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects10
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp displaySubjects

    displayTotalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits

        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        
        invoke StdOut, addr addSubject
        invoke StdOut, addr enrollCourse
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100

        mov al, [options]  
        cmp al, '1'
        je fourth2
        cmp al, '2'
        je finalizeEnrollment

        jmp displayTotalUnits 

    finalizeEnrollment:
        invoke ClearScreen
        invoke StdOut, addr congrats
        invoke StdOut, addr congrats2
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Sname
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Program
        invoke StdOut, addr year42
        invoke StdOut, addr newline
        invoke StdOut, addr newline
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        mov esi, OFFSET selSubject

    Final:
        mov al, [esi]
        inc esi 
        cmp al, 0
        je FinalUnits
        cmp al, ' '
        je Final
        and al, 0DFh
        sub al, 'A'
        movzx eax, al
        mov edi, OFFSET inputSubjects10
        mov edi, [edi + eax * 4]
        invoke StdOut, edi
        jmp Final

    FinalUnits:
        invoke StdOut, addr Border
        invoke StdOut, addr totalUnits
        invoke dwtoa, totalUnitsEnrolled, addr tempTotalUnitsEnrolled
        invoke StdOut, addr tempTotalUnitsEnrolled
        invoke StdOut, addr totalUnitsBorder
        invoke StdOut, addr Border
        invoke StdOut, addr newline
        invoke StdOut, addr again
        invoke StdOut, addr exits
        invoke StdOut, addr pick
        invoke StdIn, addr options, 100
        mov byte ptr [selSubject], 0
        
        mov al, [options]  
        cmp al, '1'
        je main
        cmp al, '2'
        je exitProgram

    exitProgram:
        invoke StdOut, addr logout
        invoke ExitProcess, 0

    duplicateError:
        invoke StdOut, addr duplicateMsg
        jmp checkUnitLimit

    displayError:
        cmp ebx, 1
        je invalidInputError
        cmp ebx, 2
        je unitLimitError

    invalidInputError:
        invoke StdOut, addr invalidInputMsg
        mov byte ptr [selSubject], 0
        jmp Loops

    unitLimitError:
        invoke StdOut, addr limitedUnitsMsg
        mov byte ptr [selSubject], 0
        jmp Loops

enroll42 ENDP